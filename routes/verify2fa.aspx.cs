using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using OtpNet; // https://github.com/kspearrin/Otp.NET

namespace AWAD_Assignment.routes {
    public partial class verify2fa : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["2fa"] == null) Response.Redirect(ResolveClientUrl("../404"));
        }

        protected void LinkButton_2fa_Click(object sender, EventArgs e) {

            // Get Secret
            var account = Account.GetAccount(Session["2fa"].ToString());
            string userinput = TextBox_2fa.Text;

            // Verify and login if correct
            Totp totp = new Totp(Base32Encoding.ToBytes(account.secret_key));
            if (totp.VerifyTotp(userinput, out long timeStepMatched, VerificationWindow.RfcSpecifiedNetworkDelay)) {
                // Login user

                // is user admin or not?
                if (account.isAdmin) {
                    Session["email"] = account.email; // Set Email session cookies

                    // Set Admin masterpage
                    Session["CHANGE_MASTERPAGE"] = "~/AfterLoginAdmin.Master";
                    Session["CHANGE_MASTERPAGE2"] = null;
                    Response.Redirect(ResolveClientUrl("default.aspx"));

                } else {
                    Session["email"] = account.email; // Set Email session cookies
                    // Set user masterpage
                    Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                    Session["CHANGE_MASTERPAGE2"] = null;
                    Response.Redirect(ResolveClientUrl("default.aspx"));
                }
            }
            Label_error.Text = "Invalid OTP PIN";
        }
    }
}