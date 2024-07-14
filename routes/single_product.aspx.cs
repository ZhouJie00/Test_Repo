using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Diagnostics;

namespace AWAD_Assignment.routes
{
    public partial class single_product : BasePage {
        Clothes clothes = null;
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {

                try {
                    clothes = Clothes.getClothesID(Request.QueryString["id"].ToString());
                } catch (NullReferenceException) {
                    Response.Redirect(ResolveClientUrl("../404"));
                }
                if (clothes == null) Response.Redirect(ResolveClientUrl("../404"));

                Label_Clothes_name.Text = clothes.name;
                Label_Clothes_price.Text = string.Format("${0:00.00}", clothes.price); //string.Format("{0:00.00}", double.Parse(clothes.price.ToString()));
                Label_Clothes_overview.Text = clothes.overview.Replace("\n", "<br/>");

                // Get all Images related to this product        
                DataSet datasetImages = GetImages(clothes.id);
                RepeaterImages.DataSource = datasetImages;
                RepeaterImages.DataBind();

                // Get all reviews related to this product        
                DataSet datasetReviews = Function.GetAllReviews(clothes.id);
                RepeaterReview.DataSource = datasetReviews;
                RepeaterReview.DataBind();

                // If user has already created a review, show the review in the textbox.
                if (Function.UserAlreadyCreatedReview(clothes.id, Session["email"])) {
                    var temp = Function.ShowAllRatings(Account.GetAccount(Session["email"].ToString()).id, clothes.id);

                    TextBox_ReviewDescription.Text = temp[0];
                    Rating1.CurrentRating = int.Parse(temp[1]);
                }

                Label_ReviewCount.Text = Function.GetAllReviewsCount(clothes.id); // Display review count

                // Display Average Rating stars & Rating number
                DataTable dataTable = Function.GetAverageRating(clothes.id);
                Label_AverageReviewStar.Text = dataTable.Rows[0][0].ToString();
            }
        }
        private DataSet GetImages(string product_id) {

            clothes = Clothes.getClothesID(product_id);

            List<string> image_paths = new List<string>();

            // https://www.aspsnippets.com/Articles/Display-Directory-Folder-structure-using-ASPNet-TreeView-control-in-C-and-VBNet.aspx
            DirectoryInfo di = new DirectoryInfo(Server.MapPath(@"/assets/img/_clothing/carousel/" + clothes.id + "/"));
            foreach (FileInfo f in di.GetFiles()) {
                image_paths.Add("../assets/img/_clothing/carousel/" + clothes.id + "/" + f.Name);
            }

            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            ds.Tables.Add(dt);
            dt.Columns.Add("paths");
            //dt.Columns.Add("id", typeof(string));
            // other columns...
            foreach (string i in image_paths) {
                DataRow dr = dt.Rows.Add();
                dr.SetField("paths", i);
                // other properties
            }
            return ds;
        } // https://stackoverflow.com/questions/45283037/fill-dataset-from-list-of-class-items

        protected void Button_AddToCart_Click(object sender, EventArgs e) {
            try {
                clothes = Clothes.getClothesID(Request.QueryString["id"].ToString());
            } catch (NullReferenceException) {
                Response.Redirect(ResolveClientUrl("../404"));
            } // Change to -> DRY CODE 


            //Debug.WriteLine(Session["cart"]);
            Dictionary<string, Cart> carts = (Dictionary<string, Cart>)Session["cart"];

            if (carts.ContainsKey(clothes.id)) { // if clothes already in cart, modify item
                carts[clothes.id].item_quantity = int.Parse(ListBox_Quantity.SelectedValue);
                carts[clothes.id].item_size = ListBox_Size.SelectedValue;
                carts[clothes.id].item_color = ListBox_Colour.SelectedValue;
            } else { // Add clothes to cart
                carts[clothes.id] = new Cart(clothes.name, int.Parse(ListBox_Quantity.SelectedValue), double.Parse(clothes.price.ToString()), ListBox_Colour.SelectedValue, ListBox_Size.SelectedValue, clothes.id);
            }
            // update cart with new/updated clothes
            Session["cart"] = carts;
        }

        protected void Button_SubmitReview_Click(object sender, EventArgs e) {
            // Check user is signed in, only signed user are allowed to leave a review
            if (Session["email"] == null) {
                Response.Write("<script>alert('Only logged in users are allowed to leave a review')</script>");
                return;
            }

            // Validate input and ensure fields are not empty
            if (TextBox_ReviewDescription.Text.Trim().Length < 5) {
                Response.Write("<script>alert('Review must contain 5 characters minimum')</script>");
            }
            if (Rating1.CurrentRating == 0) {
                Response.Write("<script>alert('Please select the rating star before submitting')</script>");
            }

            // check if the user creating a review or updating existing review
            if (Function.UserAlreadyCreatedReview(Request.QueryString["id"].ToString(), Session["email"])) { // Update rating 
                Function.UpdateUserReview(TextBox_ReviewDescription.Text, Rating1.CurrentRating.ToString(), Session["email"].ToString(), Request.QueryString["id"].ToString());

            } else { // insert rating                
                Function.AddUserReview(TextBox_ReviewDescription.Text, Rating1.CurrentRating.ToString(), Session["email"].ToString(), Request.QueryString["id"].ToString());
            }
            Response.Redirect(Request.Url.AbsoluteUri);

        }

    }
}