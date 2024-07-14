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
    public partial class index1 : BasePage {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                RepeaterNew = Function.DisplayNewClothing(RepeaterNew);
                RepeaterRandom = Function.DisplayRandomClothing(RepeaterRandom);
            }
        }
        
    }
}