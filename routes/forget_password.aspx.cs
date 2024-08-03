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