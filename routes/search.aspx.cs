using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

namespace AWAD_Assignment.routes
{
    public partial class search : BasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["q"] != "" && Request.QueryString["q"] != null) {
                string search_input = Server.HtmlDecode(Request.QueryString["q"]);
                int temp = Function.AnyResultsFromSearch(search_input);

                if (temp > 0) {


                    Repeater1 = Function.GetResultFromSearch(Repeater1, search_input);

                    // Remove No results found
                    Label_NoResultsFound.Visible = false;
                    Label_NoResultsFound.Text = "";
                }

            } else {
                //Return absolute path with params "q"
                Response.Redirect("home");
            }            
        }
    }
}