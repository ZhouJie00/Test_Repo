using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace AWAD_Assignment.routes {
    public partial class verify_email : BasePage {
        protected void Page_Load(object sender, EventArgs e) {
            // Decrypt Token
            string decryptedToken = null;
            try {
                decryptedToken = Function.DecryptEmailToken(Request.QueryString["token"].ToString());
            } catch (NullReferenceException) {
                // redirect to 404 if no token arg
                Response.Redirect(ResolveClientUrl("../404"));
            }

            // Check if token has expired, redirect 404 if true
            if (Function.HasEmailTokenExpired(decryptedToken)) {
                Response.Redirect(ResolveClientUrl("../404"));
            }

            // Check if Decrypted Token Email exists in DB
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

            conn.Open();

            string checkuser = "SELECT COUNT(*) FROM Accounts WHERE Email = @email";
            SqlCommand com = new SqlCommand(checkuser, conn);
            string email = Encoding.ASCII.GetString(Convert.FromBase64String(decryptedToken)).Substring(8);
            com.Parameters.AddWithValue("@email", email);

            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            if (temp == 1) { // if email exists inside DB it is a valid
                // The user has verified their email
                SqlCommand cmd = new SqlCommand("update accounts set emailconfirmed = @verified where email = @email", conn);
                cmd.Parameters.AddWithValue("@email", email);
                cmd.Parameters.AddWithValue("@verified", true);
                cmd.ExecuteNonQuery();
            }
            else {
                // Invalid token, redirect to 404
                Response.Redirect(ResolveClientUrl("../404"));
            }
            conn.Close();
        }
    }
}