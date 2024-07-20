using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AWAD_Assignment.routes
{
    public partial class admin_users : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If admin is not logged in, give 404
            if (Session["email"] == null) Response.Redirect(ResolveClientUrl("../404"));
            if (!Account.GetAccount(Session["email"].ToString()).isAdmin) Response.Redirect(ResolveClientUrl("../404"));

            if (!IsPostBack)
            {
                GridView_UserTable = Function.GetAllUsers(GridView_UserTable);
            }
        }

        protected void GridView_UserTable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView_UserTable = Function.AdminDeleteUser(GridView_UserTable, e.RowIndex, Server);
            GridView_UserTable = Function.GetAllUsers(GridView_UserTable);
        }
    }
}