using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Diagnostics;

namespace AWAD_Assignment.routes
{
    public partial class admin_dashboard : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            // If admin is not logged in, give 404
            if (Session["email"] == null) Response.Redirect(ResolveClientUrl("../404"));
            if (!Account.GetAccount(Session["email"].ToString()).isAdmin) Response.Redirect(ResolveClientUrl("../404"));

            if (!IsPostBack)
            {
                GridView_ProductTable = Function.GetAllClothes(GridView_ProductTable);
            }


        }

        protected void GridView_ProductTable_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            Function.AdminInsertClothing(GridView_ProductTable, e, Server);
        }

        protected void GridView_ProductTable_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView_ProductTable.EditIndex = e.NewEditIndex;
            GridView_ProductTable = Function.GetAllClothes(GridView_ProductTable);
        }

        protected void GridView_ProductTable_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView_ProductTable.EditIndex = -1;
            GridView_ProductTable = Function.GetAllClothes(GridView_ProductTable);
        }

        protected void GridView_ProductTable_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView_ProductTable = Function.AdminUpdateClothe(GridView_ProductTable, e.RowIndex);
            GridView_ProductTable = Function.GetAllClothes(GridView_ProductTable);
        }

        protected void GridView_ProductTable_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView_ProductTable = Function.AdminDeleteClothe(GridView_ProductTable, e.RowIndex, Server);
            GridView_ProductTable = Function.GetAllClothes(GridView_ProductTable);
        }
    }
}