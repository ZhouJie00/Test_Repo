using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Diagnostics;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace AWAD_Assignment.routes {
    public partial class admin_charts : BasePage {
        protected void Page_Load(object sender, EventArgs e) {

            // If admin is not logged in, give 404
            if (Session["email"] == null) Response.Redirect(ResolveClientUrl("../404"));
            if (!Account.GetAccount(Session["email"].ToString()).isAdmin) Response.Redirect(ResolveClientUrl("../404"));

            // Display charts
            if (!IsPostBack) {
                //LoadCountries();
                //LoadCategories();
                LoadSales();
            }
        }

        private void LoadCountries() {
            DataTable tb = Function.GetCountries();

            if (tb != null) {
                string chart = "";
                chart = "<canvas id=\"country-chart\" width=\"100%\" height=\"40\"></canvas>";
                chart += "<script>";
                chart += "new Chart(document.getElementById(\"country-chart\"), { type: 'pie', data: {labels: [";

                // more detais
                for (int i = 0; i < tb.Rows.Count; i++)
                    chart += "'" +  tb.Rows[i][1].ToString() + "'" + ",";
                chart = chart.Substring(0, chart.Length - 1); // Remove trailing comma?

                chart += "],datasets: [{ data: [";

                // get data from database and add to chart
                string value = "";
                for (int i = 0; i < tb.Rows.Count; i++)
                    value += tb.Rows[i][2].ToString() + ",";
                value = value.Substring(0, value.Length - 1);
                chart += value;

                chart += "],label: 'User Locations', ";
                chart += "backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)','rgba(153, 102, 255, 0.2)', 'rgba(201, 203, 207, 0.2)'], ";
                chart += "borderColor: [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)' ],fill: true}"; // Chart color
                chart += "]}";
                chart += "});";
                chart += "</script>";

                Chart1.Text = chart;
            }
        }

        private void LoadCategories() {
            DataTable tb = Function.GetCategories();
            

            if (tb != null) {
                string chart = "";
                chart = "<canvas id=\"category-chart\" width=\"100%\" height=\"40\"></canvas>";
                chart += "<script>";
                chart += "new Chart(document.getElementById(\"category-chart\"), { type: 'bar', data: {labels: [";

                // more detais
                for (int i = 0; i < tb.Rows.Count; i++)
                    chart += "'" + tb.Rows[i][1].ToString() + "'" + ",";
                chart = chart.Substring(0, chart.Length - 1); // Remove trailing comma?

                chart += "],datasets: [{ data: [";

                // get data from database and add to chart
                string value = "";
                for (int i = 0; i < tb.Rows.Count; i++)
                    value += tb.Rows[i][2].ToString() + ",";
                value = value.Substring(0, value.Length - 1);
                chart += value;

                chart += "],label: 'Most Popular Categories', ";
                chart += "backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)','rgba(153, 102, 255, 0.2)', 'rgba(201, 203, 207, 0.2)'], ";
                chart += "borderColor: [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)' ],fill: true}"; // Chart color
                chart += "]}";
                chart += "});";
                chart += "</script>";

                Chart2.Text = chart;
            }
        }

        private void LoadSales() {
            DataTable tb = Function.GetSales();
            

            if (tb != null) {
                string chart = "";
                chart = "<canvas id=\"sales-chart\" width=\"100%\" height=\"40\"></canvas>";
                chart += "<script>";
                chart += "new Chart(document.getElementById(\"sales-chart\"), { type: 'line', data: {labels: [";

                // more detais
                for (int i = 0; i < tb.Rows.Count; i++)
                    chart += "'" + tb.Rows[i][0].ToString() + "'" + ",";
                chart = chart.Substring(0, chart.Length - 1); // Remove trailing comma?

                chart += "],datasets: [{ data: [";

                // get data from database and add to chart
                string value = "";
                for (int i = 0; i < tb.Rows.Count; i++)
                    value += tb.Rows[i][1].ToString() + ",";
                value = value.Substring(0, value.Length - 1);
                chart += value;

                chart += "],label: 'Revenue', ";
                chart += "backgroundColor: [ 'rgba(255, 99, 132, 0.2)', 'rgba(255, 159, 64, 0.2)', 'rgba(255, 205, 86, 0.2)', 'rgba(75, 192, 192, 0.2)', 'rgba(54, 162, 235, 0.2)','rgba(153, 102, 255, 0.2)', 'rgba(201, 203, 207, 0.2)'], ";
                chart += "borderColor: [ 'rgb(255, 99, 132)', 'rgb(255, 159, 64)', 'rgb(255, 205, 86)', 'rgb(75, 192, 192)', 'rgb(54, 162, 235)', 'rgb(153, 102, 255)', 'rgb(201, 203, 207)' ],fill: true}"; // Chart color
                chart += "]}";
                chart += "});";
                chart += "</script>";

                Chart3.Text = chart;
            }
        }
    }
}