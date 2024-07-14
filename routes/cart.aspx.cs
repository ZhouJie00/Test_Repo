using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AWAD_Assignment.routes {
    public partial class cart : BasePage {

        // https://docs.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/shopping-cart
        
        protected void Page_Load(object sender, EventArgs e) {

            //if (!IsPostBack) {
            //    Repeater1.DataSource = Repeater1.DataSource;
            //    Repeater1.DataBind();
            //}
            if (!IsPostBack) {
                DataSet dataset = GetCartItems();
                if (dataset == null) return;

                Repeater1.DataSource = dataset;
                Repeater1.DataBind();
            }

            /*
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];
            foreach (KeyValuePair<string, Cart> kvp in carts) {
                Debug.WriteLine("--------------------");
                Debug.WriteLine("Key = {0}, Value = {1}", kvp.Key, kvp.Value);
                Debug.WriteLine("{0} - {1} - {2}", kvp.Value.item_name, kvp.Value.item_quantity, kvp.Value.item_size);
                Debug.WriteLine("--------------------");
            }
            Debug.WriteLine("count: " + carts.Count);
            */
        }
        private DataSet GetCartItems() {
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];

            if (carts == null || carts.Count == 0) {
                // Cart is empty, 
                return null;
            }
            // subtotal
            double subtotal = 0;

            // List all products in cart
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            ds.Tables.Add(dt);
            dt.Columns.Add("image");
            dt.Columns.Add("name");
            dt.Columns.Add("id");
            dt.Columns.Add("price");
            dt.Columns.Add("quantity");
            dt.Columns.Add("total");

            foreach (KeyValuePair<string, Cart> kvp in carts) {
                DataRow dr = dt.Rows.Add();
                dr.SetField("image", "../assets/img/_clothing/carousel/" + kvp.Key + "/1.jpg");
                dr.SetField("name", kvp.Value.item_name);
                dr.SetField("id", kvp.Key);
                dr.SetField("price", kvp.Value.item_price);
                dr.SetField("quantity", kvp.Value.item_quantity);
                dr.SetField("total", kvp.Value.item_price * kvp.Value.item_quantity);
                
                subtotal += kvp.Value.item_price * kvp.Value.item_quantity;
                
            }
            // Session["subtotal"] = subtotal;
            Label_SubTotal.Text = string.Format("${0:00.00}", subtotal);
            return ds;
        }

        protected void LinkButton_UpdateCart_Click(object sender, EventArgs e) {
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];

            foreach (RepeaterItem item in Repeater1.Items) {

                // https://stackoverflow.com/questions/2574288/asp-net-how-to-iterate-through-a-repeater

                var image_control = item.FindControl("Image_Checkout") as Image;
                var name_control = item.FindControl("Label_Name") as Label;
                var id_control = item.FindControl("Label_ID") as Label;
                var price_control = item.FindControl("Label_Price") as Label;
                var quantity_control = item.FindControl("TextBox_CartQuantity") as TextBox;
                var total_control = item.FindControl("Label_Total") as Label;

                //Debug.WriteLine("{0} - {1} - {2} - {3} - {4} - {5}", image_control.ImageUrl, name_control.Text, id_control.Text, price_control.Text, quantity_control.Text, total_control.Text);
                Debug.WriteLine(quantity_control.Text);

                //if (int.Parse(quantity_control.Text) == 0) {
                //    carts.Remove(id_control.Text);
                //} else {
                //    carts[id_control.Text].item_quantity = int.Parse(quantity_control.Text);
                //}
                //Session["cart"] = carts;
                //Response.Redirect(Request.Url.AbsoluteUri);
            }
        }
        protected void Button_UpdateCart_Click(object sender, EventArgs e) {
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];


            foreach (RepeaterItem item in Repeater1.Items) {

                // https://stackoverflow.com/questions/2574288/asp-net-how-to-iterate-through-a-repeater
                // http://www.codingfusion.com/Post/Repeater-Edit-Update-Delete-in-Asp-net-using-Ado

                var image_control = item.FindControl("Image_Checkout") as Image;
                var name_control = item.FindControl("Label_Name") as Label;
                var id_control = item.FindControl("Label_ID") as Label;
                var price_control = item.FindControl("Label_Price") as Label;
                var quantity_control = item.FindControl("TextBox_CartQuantity") as TextBox;
                var total_control = item.FindControl("Label_Total") as Label;

                //Debug.WriteLine("{0} - {1} - {2} - {3} - {4} - {5}", image_control.ImageUrl, name_control.Text, id_control.Text, price_control.Text, quantity_control.Text, total_control.Text);
                Debug.WriteLine("QTY: " + quantity_control.Text);

                if (int.Parse(quantity_control.Text) == 0) {
                    carts.Remove(id_control.Text);
                } else {
                    carts[id_control.Text].item_quantity = int.Parse(quantity_control.Text);
                }
            }
            Session["cart"] = carts;
            Response.Redirect(Request.Url.AbsoluteUri);
        }
        protected void R1_ItemCommand(object source, RepeaterCommandEventArgs e) {
            //====== Here we use switch state to distinguish which link button is clicked based 
            //====== on command name supplied to the link button.
            switch (e.CommandName) {
                //==== This case will fire when link button placed
                //==== inside repeater having command name "Delete" is clicked.

                case ("Delete"):
                    //==== Getting id of the selelected record(We have passed on link button's command argument property).
                    //int id = Convert.ToInt32(e.CommandArgument);
                    string deleteid = e.CommandArgument.ToString();

                    //==== Call delete method and pass id as argument.
                    //deleteEmployee(id);
                    DeleteCartItem(deleteid);

                    break;

                //==== This case will fire when link button placed
                //==== inside repeater having command name "Edit" is clicked.
                case ("Edit"):

                    //==== Getting id of the selelected record(We have passed on link button's command argument property).
                    //id = Convert.ToInt32(e.CommandArgument);
                    string[] commandArgs = e.CommandArgument.ToString().Split(new char[] { ',' });
                    string updateid = commandArgs[0];
                    int qty = int.Parse(commandArgs[1]);

                    //==== Call edit method and pass id as argument.
                    //bindEmployeeDetailToEdit(id);
                    UpdateCartItem(updateid, qty);

                    break;

            }
        }
        protected void DeleteCartItem(string id) {
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];
            carts.Remove(id);
            Session["cart"] = carts;
        }
        protected void UpdateCartItem(string id, int qty) {
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];
            carts[id].item_quantity = qty;
            Session["cart"] = carts;
        }
    }
}