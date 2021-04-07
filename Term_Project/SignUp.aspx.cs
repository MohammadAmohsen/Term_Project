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
    public partial class SignUp : System.Web.UI.Page
    {

        DBConnect db = new DBConnect();
        ArrayList arrayNewUser = new ArrayList();
        SqlCommand sqlCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            rbAnswer.AutoPostBack = true;

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
            string securityQuestion1 = txtSQ1Answer.Text;
            string securityQuestion2 = txtSQ2Answer.Text;
            string securityQuestion3 = txtSQ3Answer.Text;


            int check = 0;
            CheckList.Add(userName);
            CheckList.Add(address);
            CheckList.Add(emailAddress);
            CheckList.Add(firstName);
            CheckList.Add(lastName);
            CheckList.Add(billingAddress);
            CheckList.Add(phoneNumber);
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
            if (check == 12)
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
                        newUsers.Password = pass;
                        newUsers.Type = "User";
                        newUsers.Experience = ddlImage.SelectedValue;

                        arrayNewUser.Add(newUsers);

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

                        SqlParameter SecurityEmail = new SqlParameter("@Image", newUsers.UserImage);
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


                        DataSet myData = db.GetDataSetUsingCmdObj(sqlCommand);

                        
                        if(rbAnswer.Text == "Yes")
                        {
                            int weight = Convert.ToInt32(txtWeight.Text);
                            string goals = ddlGoals.SelectedValue;
                            string days = ddlDays.SelectedValue;
                            int age = Convert.ToInt32(txtAge.Text);
                            string training = ddlTraining.SelectedValue;


                            Response.Write("<script>alert('Your account has been created!') </script>");
                            Response.Redirect("Default.aspx");

                        }
                        else
                        {
                            Response.Write("<script>alert('Your account has been created!') </script>");
                            Response.Redirect("Default.aspx");
                        }


                        //Session["TagFolders"] = null;
                        //Response.Redirect("Default.aspx");
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
            Response.Redirect("LogIn.aspx");

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

        protected void rbAnswer_SelectedIndexChanged(object sender, EventArgs e)
        {
            String moe = rbAnswer.Text;

            if (rbAnswer.Text == "Yes")
            {
                ShowQuestion(true);


            }
            else
            {
                ShowQuestion(false);

            }

        }

        public void ShowQuestion(Boolean boo)
        {
            Questions1.Visible = boo;
            Questions2.Visible = boo;
            Questions3.Visible = boo;
            Questions4.Visible = boo;
            Questions5.Visible = boo;

        }

    }
}