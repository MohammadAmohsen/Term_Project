using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Term_Project
{
    public partial class LogIn : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Text;
            string password = txtPassword.Text;
            if (email == "" && password == "")
            {

                lblinputEmailError.Visible = true;
                lblInputPassError.Visible = true;
            }
            else
            {
                SqlCommand objCommand = new SqlCommand();

                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "TP_SelectAllFromUsers";

                SqlParameter Email = new SqlParameter("@InputEmail", email);
                Email.Direction = ParameterDirection.Input;
                objCommand.Parameters.Add(Email);

                SqlParameter Password = new SqlParameter("@InputPassword", password);
                Password.Direction = ParameterDirection.Input;
                objCommand.Parameters.Add(Password);

                DataSet mydata = db.GetDataSetUsingCmdObj(objCommand);
                int size = mydata.Tables[0].Rows.Count;

                if (size > 0)
                {
                    string Type = db.GetField("Type", 0).ToString();
                    if (Type.CompareTo("User") == 0)
                    {
                        Session["UserId"] = db.GetField("UserId", 0);
                        Session["FirstName"] = db.GetField("FirstName", 0);
                        Session["LastName"] = db.GetField("LastName", 0);
                        Session["EmailAddress"] = db.GetField("EmailAddress", 0);
                        Session["DateCreated"] = db.GetField("DateCreated", 0);
                        Session["UserImage"] = db.GetField("UserImage", 0);
                        Session["Experience"] = db.GetField("Experience", 0);
                        Session["Type"] = db.GetField("Type", 0);
                        Session["Password"] = db.GetField("Password", 0);
                        Session["UserName"] = db.GetField("UserName", 0);
                        Session["BillingAddress"] = db.GetField("BillingAddress", 0);
                        Session["UserWeight"] = db.GetField("UserWeight", 0);
                        Session["UserAge"] = db.GetField("UserAge", 0);
                        Session["UserDays"] = db.GetField("UserDays", 0);
                        Session["UserTraining"] = db.GetField("UserTraining", 0);
                        Session["UserGoals"] = db.GetField("UserGoals", 0);
                        Response.Redirect("HomePage.aspx");

                    }
                    else
                    {
                        Session["UserId"] = db.GetField("UserId", 0);
                        Session["FirstName"] = db.GetField("FirstName", 0);
                        Session["LastName"] = db.GetField("LastName", 0);
                        Session["EmailAddress"] = db.GetField("EmailAddress", 0);
                        Session["DateCreated"] = db.GetField("DateCreated", 0);
                        Session["UserImage"] = db.GetField("UserImage", 0);
                        Session["Experience"] = db.GetField("Experience", 0);
                        Session["Type"] = db.GetField("Type", 0);
                        Session["Password"] = db.GetField("Password", 0);
                        Session["UserName"] = db.GetField("UserName", 0);
                        Session["BillingAddress"] = db.GetField("BillingAddress", 0);
                        Session["UserWeight"] = db.GetField("UserWeight", 0);
                        Session["UserAge"] = db.GetField("UserAge", 0);
                        Session["UserDays"] = db.GetField("UserDays", 0);
                        Session["UserTraining"] = db.GetField("UserTraining", 0);
                        Session["UserGoals"] = db.GetField("UserGoals", 0);
                        Response.Redirect("AdminPage.aspx");
                    }
                }
                else
                {
                    Response.Write("<script>alert('Wrong Email/Password Fool')</script>");

                }
            }
        }


        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");

        }
    }
}