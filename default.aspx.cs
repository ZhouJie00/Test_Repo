using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AWAD_Assignment {
    public partial class _default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            // This file is just to redirect users to routes/default.aspx 
            Response.Redirect(ResolveUrl("routes/"));

        }
    }
}