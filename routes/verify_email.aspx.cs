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
            string email = Encoding.ASCII.GetString(Convert.FromBase64String(decryptedToken)).Substring(8);
            int temp = Function.CheckIfUserExists(email); // Convert.ToInt32(com.ExecuteScalar().ToString());


            if (temp == 1) { // if email exists inside DB it is a valid
                // The user has verified their email
                Function.SetUserVerificationTrue(email);
            }
            else {
                // Invalid token, redirect to 404
                Response.Redirect(ResolveClientUrl("../404"));
            }
        }
    }
}