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
using System.Drawing;
using QRCoder;
using System.IO;
using OtpNet;

namespace AWAD_Assignment.routes {
    public partial class settings : BasePage {
        protected void Page_Load(object sender, EventArgs e) {

            // If user is not logged in, redirect to login.aspx
            if (Session["email"] == null) Response.Redirect("login");

            if (!IsPostBack) {
                var account = Account.GetAccount(Session["email"].ToString());

                TextBox_Firstname.Text = account.firstname;
                TextBox_Lastname.Text = account.lastname;
                TextBox_MobileNumber.Text = account.mobilenumber;

                TextBox_CurrentPassword.Text = "";
                TextBox_NewPassword.Text = "";

                TextBox_Address1.Text = account.adress1;
                TextBox_Address2.Text = account.adress2;
                TextBox_Zipcode.Text = account.zipcode;

                // Set OTP button text
                if (account.mfaEnabled) Label_mfa.Text = "Current 2FA status: Enabled";
                else Label_mfa.Text = "Current 2FA status: Disabled";
            }
        }

        protected void Button_UpdateAccount_Click(object sender, EventArgs e) {
            // Update user Information
            Function.UpdateUserInformation(TextBox_Firstname.Text, TextBox_Lastname.Text, TextBox_MobileNumber.Text, TextBox_Address1.Text, TextBox_Address2.Text, TextBox_Zipcode.Text, Session["email"].ToString());
           
            // Update password if password field is not empty
            if (TextBox_CurrentPassword.Text.Trim() != "" && TextBox_NewPassword.Text.Trim() != "") {
                var account = Account.GetAccount(Session["email"].ToString()); // Getting current user password
                if (Hash.VerifyHash(TextBox_CurrentPassword.Text, "SHA512", account.password)) {
                    // If password match, replace old password with new password
                    Function.UpdateUserPassword(Session["email"].ToString(), Hash.ComputeHash(TextBox_NewPassword.Text, "SHA512", null));
                }
            }
        }

        protected void LinkButton_mfa_Click(object sender, EventArgs e) {

            if (Account.GetAccount(Session["email"].ToString()).mfaEnabled) {
                // Disable MFA
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString)) {
                    connection.Open();
                    SqlCommand sql = new SqlCommand("update accounts set multi_factor_enabled=0, secret_key=null where id=@id", connection);
                    sql.Parameters.AddWithValue("@id", Account.GetAccount(Session["email"].ToString()).id);
                    sql.ExecuteNonQuery();
                }
                Label_mfa.Text = "Current 2FA status: Disabled";
            } else {
                // Enable MFA
                string secret = Base32Encoding.ToString(KeyGeneration.GenerateRandomKey(20));
                QRCodeGenerator qrGenerator = new QRCodeGenerator();
                QRCodeData qrCodeData = qrGenerator.CreateQrCode($"otpauth://totp/Estore?secret={secret}", QRCodeGenerator.ECCLevel.Q);
                QRCode qrCode = new QRCode(qrCodeData);
                System.Web.UI.WebControls.Image imgBarCode = new System.Web.UI.WebControls.Image
                {
                    Height = 150,
                    Width = 150
                };
                using (Bitmap bitMap = qrCode.GetGraphic(20)) {
                    using (MemoryStream ms = new MemoryStream()) {
                        bitMap.Save(ms, System.Drawing.Imaging.ImageFormat.Png);
                        byte[] byteImage = ms.ToArray();
                        imgBarCode.ImageUrl = "data:image/png;base64," + Convert.ToBase64String(byteImage);
                    }
                    PlaceHolder_QRCode.Controls.Add(imgBarCode);
                }
                // Saving Secret to database
                using (SqlConnection connection = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString)) {
                    connection.Open();
                    SqlCommand sql = new SqlCommand("update accounts set multi_factor_enabled=1, secret_key=@secret where id=@id", connection);
                    sql.Parameters.AddWithValue("@secret", secret);
                    sql.Parameters.AddWithValue("@id", Account.GetAccount(Session["email"].ToString()).id);
                    sql.ExecuteNonQuery();
                }
                Label_mfa.Text = "Current 2FA status: Enabled";
            }
        }
    }
}