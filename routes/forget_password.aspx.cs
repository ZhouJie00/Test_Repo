using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Threading;
using System.Security.Cryptography;
using SendGrid;
using SendGrid.Helpers.Mail;
using System.Threading.Tasks;
using System.Diagnostics;
using System.IO;
using Newtonsoft.Json;
using System.Text;
using static QRCoder.PayloadGenerator;
using System.Xml.Linq;

namespace AWAD_Assignment.routes {
    public partial class forget_password : BasePage {
        protected void Page_Load(object sender, EventArgs e) {}
        protected void btnForgetPassword_Click(object sender, EventArgs e) {

            int temp = Function.CheckIfUserExists(TextBox_Email.Text);

            if (temp == 1) // checks if email exists inside DB
            {
                // Send a password token reset
                //SendEmail().Wait();
                var user = Account.GetAccount(TextBox_Email.Text);

                var encryptedToken = Function.EncryptEmailToken(Function.CreateEmailToken(Encoding.ASCII.GetBytes(user.email))); // Use uuid4 for token?

                var resetlink = $"http://localhost:62828/routes/change_password.aspx?token={encryptedToken}";

                Function.SendMail(
                    user.email,
                    subject: string.Format("{0} {1}", user.firstname, user.lastname),
                    body: $"<a href='{resetlink}'><h1>reset password</h1><a/>");
            } else {
                Thread.Sleep(500);
            }
            //Label_Status.Text = RandomNumberGenerator.Create().ToString();
            Label_Status.Text = "A password reset request has been sent if the email exists";
        }
        private void SendEmail(string email, string name="Customer") {

            SecretKeys api_keys = null; // https://www.delftstack.com/howto/csharp/read-json-file-in-csharp/
            using (StreamReader reader = new StreamReader(Server.MapPath("./apikeys.json"))) {
                string jsonString = reader.ReadToEnd();
                api_keys = JsonConvert.DeserializeObject<SecretKeys>(jsonString);
            }
            // Create an encrypted token for reset password
            var encryptedToken = Function.EncryptEmailToken(Function.CreateEmailToken(Encoding.ASCII.GetBytes(email))); // Use uuid4 for token?

            var client = new SendGridClient(api_keys.sendgrid_api_key); // Environment.GetEnvironmentVariable("NAME_OF_THE_ENVIRONMENT_VARIABLE_FOR_YOUR_SENDGRID_KEY");
            var msg = new SendGridMessage();
            msg.SetFrom(new EmailAddress(api_keys.sendgrid_email, "Support"));
            msg.AddTo(new EmailAddress(email, name));
            msg.SetTemplateId("d-2e7fa9b4a6c148f499d4949765b0d524");
            var dynamicTemplateData = new ForgetPasswordTemplateData { resetlink = $"http://localhost:62828/routes/change_password.aspx?token={encryptedToken}" };
            msg.SetTemplateData(dynamicTemplateData);

            var response = client.SendEmailAsync(msg);
            //Console.WriteLine(response.StatusCode);
            //Console.WriteLine(response.Headers.ToString());
            //Console.WriteLine("\n\nPress any key to exit.");
        }
        private static string EncryptEmailToken(string textToEncrypt) {
            try {
                //string  = "WaterWorld";
                string ToReturn = "";
                string publickey = "12345678";
                string secretkey = "87654321";
                byte[] secretkeyByte = { };
                secretkeyByte = Encoding.UTF8.GetBytes(secretkey);
                byte[] publickeybyte = { };
                publickeybyte = Encoding.UTF8.GetBytes(publickey);
                MemoryStream ms = null;
                CryptoStream cs = null;
                byte[] inputbyteArray = Encoding.UTF8.GetBytes(textToEncrypt);
                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider()) {
                    ms = new MemoryStream();
                    cs = new CryptoStream(ms, des.CreateEncryptor(publickeybyte, secretkeyByte), CryptoStreamMode.Write);
                    cs.Write(inputbyteArray, 0, inputbyteArray.Length);
                    cs.FlushFinalBlock();
                    ToReturn = Convert.ToBase64String(ms.ToArray());
                }
                return ToReturn;
            } catch (Exception ex) {
                throw new Exception(ex.Message, ex.InnerException);
            }
        }
        private static string CreateEmailToken(byte[] arg) {
            var time = BitConverter.GetBytes(DateTime.UtcNow.ToBinary());
            var key = arg ?? Guid.NewGuid().ToByteArray();
            var token = Convert.ToBase64String(time.Concat(key).ToArray());

            return token;
        }
    }
}