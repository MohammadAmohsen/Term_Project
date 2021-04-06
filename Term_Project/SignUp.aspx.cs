using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Term_Project
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click1(object sender, EventArgs e)
        {
            String moe = rbAnswer.Text;

            if (rbAnswer.Text == "Yes")
            {
                Response.Redirect("Questions.aspx");

            }
            else
            {
                Response.Redirect("LogIn.aspx");

            }


        }

        protected void btnBackToSign_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");

        }

        protected void ddlSQ1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSQ2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlSQ3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl;
            ddl = (DropDownList)FindControl("ddlImage");
            string selecteditem = ddl.SelectedValue.ToString();

            if (selecteditem == "Beginner")
            {
                profilePicture.ImageUrl = "../Images2/beginner.png";
            }
            else if (selecteditem == "Intermediate")
            {
                profilePicture.ImageUrl = "../Images2/intermediate.png";
            }
            else if (selecteditem == "Advanced")
            {
                profilePicture.ImageUrl = "../Images2/advanced.png";
            }
        }
    }
}