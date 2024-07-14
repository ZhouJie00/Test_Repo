using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AWAD_Assignment
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e) {

            if(Session["cart"] == null) Session["cart"] = new Dictionary<string, Cart>();

            if (IsPostBack) {
                if (TextBox_Search.Text.Trim().Length > 0 && TextBox_Search.Text != null && TextBox_Search.Text.ToString() != "") {
                    Response.Redirect("/search?q=" + Server.HtmlEncode(TextBox_Search.Text));
                }
            }

            /* TODO - XSS Prevention  | Secure Practices 
             * https://docs.microsoft.com/en-us/previous-versions/aspnet/ms178270(v=vs.100)     Securing Standard Controls
             * https://docs.microsoft.com/en-us/previous-versions/aspnet/a2a4yykt(v=vs.100)     How to: Protect Against Script Exploits in a Web Application by Applying HTML Encoding to Strings
             * https://docs.microsoft.com/en-us/previous-versions/aspnet/7kh55542(v=vs.100)     Validating User Input in ASP.NET Web Pages
             * https://docs.microsoft.com/en-us/previous-versions/aspnet/zdh19h94(v=vs.100)     Basic Security Practices for Web Applications
             * https://docs.microsoft.com/en-us/previous-versions/aspnet/f13d73y6(v=vs.100)     Overview of Web Application Security Threats
             */
        }

        protected void LinkButton_SignOut_Click(object sender, EventArgs e) {
        }
    }
}