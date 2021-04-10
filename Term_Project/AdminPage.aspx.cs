using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Term_Project
{
    public partial class AdminPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SoapService.WebService1 proxy = new SoapService.WebService1();
            double more = proxy.Add(1, 2);
            Response.Write("<script>alert('" + more + "') </script>");
            string m = proxy.Test();
            Response.Write("<script>alert('" + m + "') </script>");


        }

        protected void btnCreateAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSignUp.aspx");

        }
    }
}