using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AWAD_Assignment.routes
{
    public partial class product_list_women : BasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["q"] != "" && Request.QueryString["q"] != null) {
                if (Request.QueryString["q"] == "tops") {
                    // Dataset
                    DataSet dataset = Function.GetWomenTops();
                    Repeater1.DataSource = dataset;
                    Repeater1.DataBind();

                    //Set Categories - Top
                    LinkButtonCategory1.Text = "Shirts & Blouses";
                    LinkButtonCategory2.Text = "Sweaters";
                    LinkButtonCategory3.Text = "Sweats";
                    LinkButtonCategory4.Text = "T-Shirts";
                    LinkButtonCategory5.Text = "UT(Graphic T-Shirts)";

                } else if (Request.QueryString["q"] == "bottoms") {
                    // Dataset
                    DataSet dataset = Function.GetWomenBottoms();
                    Repeater1.DataSource = dataset;
                    Repeater1.DataBind();

                    //Set Categories - Bottom
                    LinkButtonCategory1.Text = "Jeans";
                    LinkButtonCategory2.Text = "Legging Pants";
                    LinkButtonCategory3.Text = "Pants";
                    LinkButtonCategory4.Text = "Shorts";
                    LinkButtonCategory5.Text = "Skirts";
                } else {
                    //redirect if not valid parameter
                    Response.Redirect("ProductsWomen?q=tops");
                }
            } else {
                //Return absolute path with params "q"
                Response.Redirect("ProductsWomen?q=tops");
            }
        }
        private DataSet GetWomenClothes() {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["Database"].ConnectionString)) {
                SqlDataAdapter sql = new SqlDataAdapter("select * from Clothes where gender = 'F'", conn);
                DataSet temp = new DataSet();
                sql.Fill(temp);
                return temp;
            }
        }
        protected void LinkButtonCategory1_Click(object sender, EventArgs e) {
            if (Request.QueryString["q"] == "tops") {
                // Edit filter = "Shirts & Blouses"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 11);
            } else {
                // Edit filter = "Jeans"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 2);
            }
        }
        protected void LinkButtonCategory2_Click(object sender, EventArgs e) {
            if (Request.QueryString["q"] == "tops") {
                // Edit filter = "Sweaters"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 12);
            } else {
                // Edit filter = "Legging Pants"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 9);
            }
        }
        protected void LinkButtonCategory3_Click(object sender, EventArgs e) {
            if (Request.QueryString["q"] == "tops") {
                // Edit filter = "Sweats"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 13);
            } else {
                // Edit filter = "Pants"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 3);
            }
        }
        protected void LinkButtonCategory4_Click(object sender, EventArgs e) {
            if (Request.QueryString["q"] == "tops") {
                // Edit filter = "T-Shirts"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 7);
            } else {
                // Edit filter = "Shorts"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 4);
            }
        }
        protected void LinkButtonCategory5_Click(object sender, EventArgs e) {
            if (Request.QueryString["q"] == "tops") {
                // Edit filter = "UT(Graphic T-Shirts)"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 8);
            } else {
                // Edit filter = "Skirts"
                Repeater1 = Function.ProductListCategory(Repeater1, 'F', 10);
            }
        }
    }
}