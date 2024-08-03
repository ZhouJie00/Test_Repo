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
using Newtonsoft.Json;
using System.IO;
using System.Text;
using System.Net;
using System.Diagnostics;
using static QRCoder.PayloadGenerator;
using System.Xml.Linq;

namespace AWAD_Assignment.routes
{
    public partial class register : BasePage {
        protected void Page_Load(object sender, EventArgs e) {
        }
        protected void btnRegister_Click(object sender, EventArgs e) {
            RegisterAccount();
        }
        private void RegisterAccount() {
            bool exists = Function.CheckIfUserExists(TextBox_Email.Text) > 0;

            //if the email exists, send an alert
            if (exists) {
                Label_EmailExists.Text = "Sorry, Email is already taken!";
                //Response.Write("<script>alert('Sorry, Email is already taken!');</script>");
            }

            //else, insert 
            else {
                Label_EmailExists.Text = "";

                Function.RegisterUser(
                        TextBox_Email.Text, DBNull.Value, DBNull.Value, DBNull.Value, TextBox_FirstName.Text, TextBox_LastName.Text, TextBox_MobileNumber.Text, Hash.ComputeHash(TextBox_Password.Text, "SHA512", null));

                // User should verify email first before login  ~~login newly created account~~
                Label_EmailExists.Text = "An email has been sent to your email address to verify your account";

                SecretKeys api_keys = null; // https://www.delftstack.com/howto/csharp/read-json-file-in-csharp/
                using (StreamReader reader = new StreamReader(Server.MapPath("./apikeys.json"))) {
                    string jsonString = reader.ReadToEnd();
                    api_keys = JsonConvert.DeserializeObject<SecretKeys>(jsonString);
                }

                // Get user geo location
                WebClient webClient = new WebClient();
                string ipaddress = webClient.DownloadString("https://api.ipify.org");
                string url = $"https://geo.ipify.org/api/v1?apiKey={api_keys.ipify}&ipAddress={ipaddress}";
                string resultData = string.Empty;

                HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);

                using (HttpWebResponse response = (HttpWebResponse)req.GetResponse())
                using (Stream stream = response.GetResponseStream())
                using (StreamReader reader = new StreamReader(stream)) {
                    resultData = reader.ReadToEnd();
                }
                Dictionary<dynamic, dynamic> ipify = JsonConvert.DeserializeObject<Dictionary<dynamic, dynamic>>(resultData);
                string countryISO = ipify["location"]["country"];
                // Save Country to database
                Function.SaveCountryToDatabase(countryISO);                
            }

            // Send verification Email to user
            ////////////////////////////////////////////SendEmail(TextBox_Email.Text, string.Format("{0} {1}", TextBox_FirstName.Text, TextBox_LastName.Text));

            var user_email = TextBox_Email.Text;
            var encryptedToken = Function.EncryptEmailToken(Function.CreateEmailToken(Encoding.ASCII.GetBytes(user_email))); // Use uuid4 for token?
            var verifylink = $"http://localhost:62828/routes/verify_email.aspx?token={encryptedToken}";
            
            Function.SendMail(
                            email: user_email,
                            subject: string.Format("{0} {1}", TextBox_FirstName.Text, TextBox_LastName.Text),
                            body: $"Very account at : {verifylink}"
                            );

            //txt_FirstName.Text = "";
            //txt_LastName.Text = "";
            //txt_RegEmail.Text = "";
        }
        private void SendEmail(string email, string name = "Customer") {

        }
    }
}