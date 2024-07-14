using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Salt_Password_Sample;
using Nemiro.OAuth;
using Nemiro.OAuth.Clients;
using Newtonsoft.Json;
using System.IO;

namespace AWAD_Assignment.routes
{
    public partial class login : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSignIn_Click(object sender, EventArgs e) {

            if (TextBox_Email.Text.Trim().Length == 0 || TextBox_Email.Text == null) {
                Label_Email_Validator_Message.Text = "Required Field";
                return;
            }
            if (TextBox_Password.Text.Trim().Length == 0 || TextBox_Password.Text == null) {
                Label_Password_Validator_Message.Text = "Required Field";
                return;
            }

            int temp = Function.CheckIfUserExists(TextBox_Email.Text);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString);

            

            if (temp == 1) // checks if email exists inside DB
            {
                string password = Function.GetUserPassword(TextBox_Email.Text);
                bool flag = Hash.VerifyHash(TextBox_Password.Text, "SHA512", password); // verifies password through hash function

                if (flag) {

                    var user = Account.GetAccount(TextBox_Email.Text);
                    if (!user.emailConfirmed) {
                        Label_LoginFailure.Text = "Please verify your account first before logging in";
                        return;
                    }

                    if (user.mfaEnabled) {
                        Session["2fa"] = user.email;
                        Response.Redirect(ResolveClientUrl("../verify2fa"));
                    }

                    // is user admin or not?
                    if (user.isAdmin) {
                        Session["email"] = TextBox_Email.Text; // Set Email session cookies

                        // Set Admin masterpage
                        Session["CHANGE_MASTERPAGE"] = "~/AfterLoginAdmin.Master";
                        Session["CHANGE_MASTERPAGE2"] = null;
                        Response.Redirect(ResolveClientUrl("../home"));

                    } else { 
                        Session["email"] = TextBox_Email.Text; // Set Email session cookies
                        // Set user masterpage
                        Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                        Session["CHANGE_MASTERPAGE2"] = null;
                        Response.Redirect(ResolveClientUrl("../home"));
                    }
                } else {
                    Label_LoginFailure.Text = "Email Adress or Password is incorrect";
                }
            } else {
                Label_LoginFailure.Text = "Email Adress or Password is incorrect";
            }

            //TextBox_Email.Text = ""; //clears textbox after login
        }

        protected void LinkButton_SignInWithGoogle_Click(object sender, EventArgs e) {
            SecretKeys api_keys = null; // https://www.delftstack.com/howto/csharp/read-json-file-in-csharp/
            using (StreamReader reader = new StreamReader(Server.MapPath("./apikeys.json"))) {
                string jsonString = reader.ReadToEnd();
                api_keys = JsonConvert.DeserializeObject<SecretKeys>(jsonString);
            }

            // https://github.com/alekseynemiro/nemiro.oauth.dll
            // https://www.codeproject.com/Articles/875991/Users-Authorization-through-OAuth-in-NET-Framework#AspNet
            OAuthManager.RegisterClient(
                "google",
                api_keys.google_public,
                api_keys.google_secret
                );
            string returnUrl = new Uri(Request.Url, "callback.aspx").AbsoluteUri;
            OAuthWeb.RedirectToAuthorization("google", returnUrl);
        }
    }
}