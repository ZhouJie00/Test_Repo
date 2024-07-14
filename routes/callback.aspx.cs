using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Nemiro.OAuth;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Salt_Password_Sample;

namespace AWAD_Assignment.routes {
    public partial class callback : BasePage {
        protected void Page_Load(object sender, EventArgs e) {

            var result = OAuthWeb.VerifyAuthorization();

            if (result.IsSuccessfully) {

                // Check if user with that email exists in DB login in with that email else create account with that email

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);
                conn.Open();

                bool exists = false;
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [accounts] WHERE email = @email", conn)) {
                    //checks if the email that the user has entered exists in the database table
                    cmd.Parameters.AddWithValue("@email", result.UserInfo.Email);
                    exists = (int)cmd.ExecuteScalar() > 0;
                }
                //if the email exists, login with the email in DB
                if (exists) {
                    Session["email"] = result.UserInfo.Email;
                    // Set Login MasterPage
                    Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                    Session["CHANGE_MASTERPAGE2"] = null;
                    Response.Redirect("home");
                }
                //else, create new account 
                else {
                    string insertQuery = "INSERT INTO accounts (Id, first_name, last_name, email, emailConfirmed, isAdmin, password, mobile_number, multi_factor_enabled, secret_key, address1, address2, zipcode) " + 
                        "values (@id, @first, @last, @email, @emailConfirmed, @admin, @password, @mobile, @multi_factor_enabled, @secret_key, @address1, @address2, @zipcode)";

                    SqlCommand com = new SqlCommand(insertQuery, conn);
                    com.Parameters.AddWithValue("@id", Guid.NewGuid().ToString());
                    com.Parameters.AddWithValue("@first", result.UserInfo.FirstName == null ? "null" : result.UserInfo.FirstName);
                    com.Parameters.AddWithValue("@last", result.UserInfo.LastName == null ? "null" : result.UserInfo.LastName);
                    com.Parameters.AddWithValue("@email", result.UserInfo.Email);
                    com.Parameters.AddWithValue("@emailConfirmed", false);
                    com.Parameters.AddWithValue("@admin", false);
                    com.Parameters.AddWithValue("@password", Hash.ComputeHash(Function.GenerateRandomPassword(12), "SHA512", null));
                    com.Parameters.AddWithValue("@mobile", result.UserInfo.Phone == null ? "null" : result.UserInfo.Phone);
                    com.Parameters.AddWithValue("@multi_factor_enabled", false);
                    com.Parameters.AddWithValue("@secret_key", DBNull.Value);
                    com.Parameters.AddWithValue("@address1", DBNull.Value);
                    com.Parameters.AddWithValue("@address2", DBNull.Value);
                    com.Parameters.AddWithValue("@zipcode", DBNull.Value);

                    com.ExecuteNonQuery();

                    // login newly created account
                    Session["email"] = result.UserInfo.Email;
                    Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                    Session["CHANGE_MASTERPAGE2"] = null;
                    Response.Redirect("home");
                }
                conn.Close();
            }
            else {
                Response.Write(result.ErrorInfo.Message);
            }

        }
    }
}