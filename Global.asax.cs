using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

using System.Web.Routing;
using System.Data;

namespace AWAD_Assignment {
    public class Global : System.Web.HttpApplication {

        static void HTTP_Endpoints(RouteCollection routes) {
            //routes.MapPageRoute("Uniquename", "Name to shown on Adddress bar AND for redirecting", "Physical Path to the page");
            routes.MapPageRoute("Home", "home", "~/default.aspx");
            routes.MapPageRoute("Login", "login", "~/routes/login.aspx");
            routes.MapPageRoute("SingleProduct", "product", "~/routes/single_product.aspx");
            //routes.MapPageRoute("VerifyEmail", "verifyemail", "~/routes/verify_email.aspx");
            routes.MapPageRoute("ProductListFemale", "productsWomen", "~/routes/product_list_women.aspx");
            routes.MapPageRoute("ProductListMale", "productsMen", "~/routes/product_list_men.aspx");
            routes.MapPageRoute("Register", "register", "~/routes/register.aspx");
            routes.MapPageRoute("ForgetPassword", "forgetpassword", "~/routes/forget_password.aspx");
            routes.MapPageRoute("Checkout", "checkout", "~/routes/checkout.aspx");
            routes.MapPageRoute("Cart", "cart", "~/routes/cart.aspx");
            routes.MapPageRoute("Confirmation", "confirmation", "~/routes/confirmation.aspx");
            routes.MapPageRoute("About", "about", "~/routes/about.aspx");
            routes.MapPageRoute("Contact", "contact", "~/routes/contact.aspx");
            routes.MapPageRoute("Search", "search", "~/routes/search.aspx");
            routes.MapPageRoute("Settings", "settings", "~/routes/settings.aspx");
            routes.MapPageRoute("AdminDashboard", "admindashboard", "~/routes/admin_dashboard.aspx");
            routes.MapPageRoute("AdminCharts", "admincharts", "~/routes/admin_charts.aspx");
            routes.MapPageRoute("Verify2FA", "verify2fa", "~/routes/verify2fa.aspx");
            routes.MapPageRoute("PurchaseHistory", "history", "~/routes/purchase_history.aspx");


            // Error routes
            routes.MapPageRoute("NotFound", "404", "~/routes/error/404.aspx");
            routes.MapPageRoute("ServerError", "500", "~/routes/error/500.html");
        }
        protected void Application_Start(object sender, EventArgs e) {
            HTTP_Endpoints(RouteTable.Routes);
        }

        protected void Session_Start(object sender, EventArgs e) {

        }

        protected void Application_BeginRequest(object sender, EventArgs e) {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e) {

        }

        protected void Application_Error(object sender, EventArgs e) {

        }

        protected void Session_End(object sender, EventArgs e) {

        }

        protected void Application_End(object sender, EventArgs e) {

        }
    }
}