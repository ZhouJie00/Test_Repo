using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using Salt_Password_Sample;

namespace AWAD_Assignment.routes {
    public partial class recover_password : BasePage {
        protected void Page_Load(object sender, EventArgs e) {

            if (!IsPostBack) {

                // Decrypt Token
                string decryptedToken = null;
                try {
                    decryptedToken = Function.DecryptEmailToken(Request.QueryString["token"].ToString());
                } catch (NullReferenceException) {
                    // redirect to 404 if no token arg
                    Response.Redirect("/404");
                }

                // Check if token has expired, redirect 404 if true
                if (Function.HasEmailTokenExpired(decryptedToken)) {
                    Response.Redirect("/404");
                }

                // Check if Decrypted Token Email exists in DB
                int temp = Function.GetDecryptedTokenEmailFromDataBase(decryptedToken);


                if (temp == 1) { } // if email exists inside DB it is a valid
                else {
                    // Invalid token, redirect to 404
                    Response.Redirect("/404");
                }
            } else {
                // Update user password
                string email = Encoding.ASCII.GetString(Convert.FromBase64String(Function.DecryptEmailToken(Request.QueryString["token"].ToString()))).Substring(8);
                string password = Hash.ComputeHash(TextBox_Password.Text, "SHA512", null);

                Function.ChangeUserPasswordDB(email, password);

                // show changed password succesful and redirect to index after 2 seconds
                Label_ChangePassword.Text = "Password changed successful";
                System.Threading.Thread.Sleep(2000);
                Response.Redirect(ResolveClientUrl("/"));

            }
        }
        private static string DecryptEmailToken(string textToDecrypt) {
            try {
                //string  = "6+PXxVWlBqcUnIdqsMyUHA==";
                string ToReturn = "";
                string publickey = "12345678";
                string secretkey = "87654321";
                byte[] privatekeyByte = { };
                privatekeyByte = Encoding.UTF8.GetBytes(secretkey);
                byte[] publickeybyte = { };
                publickeybyte = Encoding.UTF8.GetBytes(publickey);
                MemoryStream ms = null;
                CryptoStream cs = null;
                byte[] inputbyteArray = new byte[textToDecrypt.Replace(" ", "+").Length];
                inputbyteArray = Convert.FromBase64String(textToDecrypt.Replace(" ", "+"));
                using (DESCryptoServiceProvider des = new DESCryptoServiceProvider()) {
                    ms = new MemoryStream();
                    cs = new CryptoStream(ms, des.CreateDecryptor(publickeybyte, privatekeyByte), CryptoStreamMode.Write);
                    cs.Write(inputbyteArray, 0, inputbyteArray.Length);
                    cs.FlushFinalBlock();
                    Encoding encoding = Encoding.UTF8;
                    ToReturn = encoding.GetString(ms.ToArray());
                }
                return ToReturn;
            } catch (Exception ae) {
                throw new Exception(ae.Message, ae.InnerException);
            }
        }
        private static bool HasEmailTokenExpired(string token, int tokenLifeSpanDays = 3) {
            var data = Convert.FromBase64String(token);
            var tokenCreationDate = DateTime.FromBinary(BitConverter.ToInt64(data, 0));
            return tokenCreationDate < DateTime.UtcNow.AddDays(-tokenLifeSpanDays);
        }
        protected void Button_ChangePassword_Click(object sender, EventArgs e) {}
    }
}