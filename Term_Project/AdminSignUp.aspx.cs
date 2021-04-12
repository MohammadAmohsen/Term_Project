using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using WorkoutLibrary;

namespace Term_Project
{
    public partial class AdminSignUp : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        ArrayList arrayNewUser = new ArrayList();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    headerNav.Visible = false;
                    contentID.Visible = false;
                    youShallNotPass.Visible = true;
                }
                else
                {
                    headerNav.Visible = true;
                    contentID.Visible = true;
                    youShallNotPass.Visible = false;
                }
            }
    }

        protected void btnCreate_Click1(object sender, EventArgs e)
        {
            List<String> CheckList = new List<String>();
            string pass = txtPassword.Text;
            string pass2 = txtPasswordReenter.Text;
            string userName = txtUserName.Text;
            string address = txtAddress.Text;
            string emailAddress = txtNewEmail.Text;
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string billingAddress = txtBillingAddress.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string securityAnswer1 = txtSQ1Answer.Text;
            string securityAnswer2 = txtSQ2Answer.Text;
            string securityAnswer3 = txtSQ3Answer.Text;
            string securityQuestion1 = ddlSQ1.SelectedValue;
            string securityQuestion2 = ddlSQ2.SelectedValue;
            string securityQuestion3 = ddlSQ3.SelectedValue;


            int check = 0;
            CheckList.Add(userName);
            CheckList.Add(address);
            CheckList.Add(emailAddress);
            CheckList.Add(firstName);
            CheckList.Add(lastName);
            CheckList.Add(billingAddress);
            CheckList.Add(phoneNumber);
            CheckList.Add(securityAnswer1);
            CheckList.Add(securityAnswer2);
            CheckList.Add(securityAnswer3);
            CheckList.Add(securityQuestion1);
            CheckList.Add(securityQuestion2);
            CheckList.Add(securityQuestion3);
            CheckList.Add(pass);
            CheckList.Add(pass2);

            for (int i = 0; i < CheckList.Count; i++)
            {
                if (CheckList[i] != "")
                {
                    check = check + 1;
                }

            }
            if (check == 15)
            {
                if (pass == pass2)
                {
                    lblPassError.Visible = false;
                    lblPassError1.Visible = false;
                    lblPassword.Visible = true;
                    lblPassword1.Visible = true;

                    SqlCommand sqlCommand3 = new SqlCommand();

                    sqlCommand3.CommandType = CommandType.StoredProcedure;
                    sqlCommand3.CommandText = "TP_SelectUserIDEmailCreateUser";

                    SqlParameter EmailAddress = new SqlParameter("@Email", txtNewEmail.Text);
                    EmailAddress.Direction = ParameterDirection.Input;
                    sqlCommand3.Parameters.Add(EmailAddress);

                    DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

                    int size = ds.Tables[0].Rows.Count;

                    if (size == 0)
                    {
                        Users newUsers = new Users();
                        newUsers.FirstName = firstName;
                        newUsers.LastName = lastName;
                        newUsers.EmailAddress = emailAddress;
                        newUsers.UserName = userName;
                        newUsers.BillingAddress = billingAddress;
                        newUsers.SecurityQuestion1 = securityQuestion1;
                        newUsers.SecurityQuestion2 = securityQuestion2;
                        newUsers.SecurityQuestion3 = securityQuestion3;
                        newUsers.SecurityAnswer1 = securityAnswer1;
                        newUsers.SecurityAnswer2 = securityAnswer2;
                        newUsers.SecurityAnswer3 = securityAnswer3;
                        newUsers.Password = pass;
                        newUsers.Type = "Admin";
                        newUsers.Experience = ddlImage.SelectedValue;
                        newUsers.UserImage = ddlImage.SelectedValue;
                        newUsers.DateCreated = DateTime.Now.ToString();
                        arrayNewUser.Add(newUsers);

                        SqlCommand sqlCommand = new SqlCommand();


                        sqlCommand.CommandType = CommandType.StoredProcedure;
                        sqlCommand.CommandText = "TP_InsertUser";

                        SqlParameter UserName = new SqlParameter("@UserName", newUsers.UserName);
                        UserName.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(UserName);

                        SqlParameter Avatar = new SqlParameter("@FirstName", newUsers.FirstName);
                        Avatar.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(Avatar);

                        SqlParameter Address = new SqlParameter("@LastName", newUsers.LastName);
                        Address.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(Address);

                        SqlParameter PhoneNumber = new SqlParameter("@EmailAddress", newUsers.EmailAddress);
                        PhoneNumber.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(PhoneNumber);

                        SqlParameter NewEmail = new SqlParameter("@BillingAddress", newUsers.BillingAddress);
                        NewEmail.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(NewEmail);

                        SqlParameter SecurityEmail = new SqlParameter("@Image", "Images2/" + newUsers.UserImage + ".png");
                        SecurityEmail.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityEmail);

                        SqlParameter SecurityAnswer1 = new SqlParameter("@SecurityAnswer1", newUsers.SecurityAnswer1);
                        SecurityAnswer1.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityAnswer1);


                        SqlParameter SecurityAnswer2 = new SqlParameter("@SecurityAnswer2", newUsers.SecurityAnswer2);
                        SecurityAnswer2.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityAnswer2);


                        SqlParameter SecurityAnswer3 = new SqlParameter("@SecurityAnswer3", newUsers.SecurityAnswer3);
                        SecurityAnswer3.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityAnswer3);


                        SqlParameter SecurityQuestion1 = new SqlParameter("@SecurityQuestion1", newUsers.SecurityQuestion1);
                        SecurityQuestion1.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityQuestion1);


                        SqlParameter SecurityQuestion2 = new SqlParameter("@SecurityQuestion2", newUsers.SecurityQuestion2);
                        SecurityQuestion2.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityQuestion2);


                        SqlParameter SecurityQuestion3 = new SqlParameter("@SecurityQuestion3", newUsers.SecurityQuestion3);
                        SecurityQuestion3.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(SecurityQuestion3);

                        SqlParameter Password = new SqlParameter("@Password", newUsers.Password);
                        Password.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(Password);

                        SqlParameter Type = new SqlParameter("@Type", newUsers.Type);
                        Type.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(Type);

                        SqlParameter DateCreated = new SqlParameter("@DateCreated", newUsers.DateCreated);
                        DateCreated.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(DateCreated);

                        SqlParameter Experience = new SqlParameter("@Experience", newUsers.Experience);
                        Experience.Direction = ParameterDirection.Input;
                        sqlCommand.Parameters.Add(Experience);

                        db.DoUpdateUsingCmdObj(sqlCommand);

                        Response.Redirect("LogIn.aspx");

                    }

                    else
                    {
                        Response.Write("<script>alert('The EmailAddress is already taken! Please Try Again!') </script>");
                    }

                }
                else
                {
                    lblPassError.Visible = true;
                    lblPassError1.Visible = true;
                    lblPassword.Visible = false;
                    lblPassword1.Visible = false;
                }

            }
            else
            {
                Response.Write("<script>alert('Every Field Is Needed To Make An Account Dummy!') </script>");
            }
            

        }


        protected void btnBackToSign_Click(object sender, EventArgs e)
        {
            //Session["UserID"] = null;
            Response.Redirect("AdminPage.aspx");

        }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void ddlImage_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl;
            ddl = (DropDownList)FindControl("ddlImage");
            string selecteditem = ddl.SelectedValue.ToString();

            if (selecteditem == "Admin1")
            {
                profilePicture.ImageUrl = "../Images2/Admin1.png";
            }
            else if (selecteditem == "Admin2")
            {
                profilePicture.ImageUrl = "../Images2/Admin2.png";
            }
            else if (selecteditem == "Admin3")
            {
                profilePicture.ImageUrl = "../Images2/Admin3.png";
            }
        }

    }
}