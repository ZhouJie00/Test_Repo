using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AWAD_Assignment {
    public partial class AfterLogin : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            if (Session["cart"] == null) Session["cart"] = new Dictionary<string, Cart>();

            if (IsPostBack) {
                if (TextBox_Search.Text.Trim().Length > 0 && TextBox_Search.Text != null && TextBox_Search.Text.ToString() != "") {
                    Response.Redirect("/search?q=" + Server.HtmlEncode(TextBox_Search.Text));
                }
            }
        }
        protected void LinkButton_SignOut_Click(object sender, EventArgs e) {
            Session.Clear();
            Session["email"] = null;

            Session["CHANGE_MASTERPAGE2"] = "~/BeforeLogin.Master";
            Session["CHANGE_MASTERPAGE"] = null;
            Response.Redirect(ResolveClientUrl("default.aspx"));
        }
    }
}