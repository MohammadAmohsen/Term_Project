﻿using System;
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

            if(!IsPostBack)
            {
                if(Session["UserID"] == null)
                {
                    navBar.Visible = false;
                    ContentID.Visible = false;
                    youShallNotPass.Visible = true;
                }
                else
                {
                    navBar.Visible = true;
                    ContentID.Visible = true;
                    youShallNotPass.Visible = false;
                }
            }
            }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnCreateWorkOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddWorkout.aspx");
        }

        protected void btnCreateAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSignUp.aspx");
        }


        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;

            Response.Redirect("LogIn.aspx");

        }
    }
}