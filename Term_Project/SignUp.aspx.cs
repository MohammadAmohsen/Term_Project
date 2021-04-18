﻿using System;
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
using System.Net;
using System.Net.Mail;
using WorkoutLibraryClass;

namespace Term_Project
{
    public partial class SignUp : System.Web.UI.Page
    {

        DBConnect db = new DBConnect();
        ArrayList arrayNewUser = new ArrayList();
        FitnessService.FitnessSoap pxy = new FitnessService.FitnessSoap();


        protected void Page_Load(object sender, EventArgs e)
        {
 
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
            string SQ1 = ddlSQ1.SelectedValue;
            string SQ2 = ddlSQ2.SelectedValue;
            string SQ3 = ddlSQ3.SelectedValue;

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
                    if (SQ1 != SQ2 && SQ1 != SQ3 && SQ2 != SQ3)
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
                            //Users newUsers = new Users();
                            FitnessService.User newUsers = new FitnessService.User();

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
                            newUsers.Type = "User";
                            newUsers.Experience = ddlImage.SelectedValue;
                            newUsers.UserImage = ddlImage.SelectedValue;
                            newUsers.DateCreated = DateTime.Now.ToString();

                            Boolean test = pxy.AddUser(newUsers);

                            if (test == true)
                            {

                                if (rbAnswer.Text == "Yes")
                                {
                                    List<String> CheckList2 = new List<String>();

                                    int weight = Convert.ToInt32(txtWeight.Text);
                                    string goals = ddlGoals.SelectedValue;
                                    string days = ddlDays.SelectedValue;
                                    int age = Convert.ToInt32(txtAge.Text);
                                    string training = ddlTraining.SelectedValue;


                                    int check2 = 0;
                                    CheckList2.Add(weight.ToString());
                                    CheckList2.Add(goals);
                                    CheckList2.Add(days);
                                    CheckList2.Add(age.ToString());
                                    CheckList2.Add(training);


                                    for (int i = 0; i < CheckList2.Count; i++)
                                    {
                                        if (CheckList2[i] != "")
                                        {
                                            check2 = check2 + 1;
                                        }

                                    }
                                    if (check2 == 5)
                                    {

                                        newUsers.userWeight = Convert.ToInt32(txtWeight.Text);
                                        newUsers.UserGoals = ddlGoals.SelectedValue;
                                        newUsers.amountOfDays = ddlDays.SelectedValue;
                                        newUsers.userAge = Convert.ToInt32(txtAge.Text);
                                        newUsers.userTrainingType = ddlTraining.SelectedValue;


                                        SqlCommand sqlCommand2 = new SqlCommand();


                                        sqlCommand2.CommandType = CommandType.StoredProcedure;
                                        sqlCommand2.CommandText = "TP_UpdateUsersQuestions";

                                        SqlParameter Training = new SqlParameter("@Training", newUsers.userTrainingType);
                                        Training.Direction = ParameterDirection.Input;
                                        sqlCommand2.Parameters.Add(Training);

                                        SqlParameter Weight = new SqlParameter("@Weight", newUsers.userWeight);
                                        Weight.Direction = ParameterDirection.Input;
                                        sqlCommand2.Parameters.Add(Weight);

                                        SqlParameter Goals = new SqlParameter("@Goals", newUsers.UserGoals);
                                        Goals.Direction = ParameterDirection.Input;
                                        sqlCommand2.Parameters.Add(Goals);

                                        SqlParameter Age = new SqlParameter("@Age", newUsers.userAge);
                                        Age.Direction = ParameterDirection.Input;
                                        sqlCommand2.Parameters.Add(Age);

                                        SqlParameter DaysOfWeek = new SqlParameter("@DaysOfWeek", newUsers.amountOfDays);
                                        DaysOfWeek.Direction = ParameterDirection.Input;
                                        sqlCommand2.Parameters.Add(DaysOfWeek);



                                        SqlCommand sqlCommand4 = new SqlCommand();


                                        sqlCommand4.CommandType = CommandType.StoredProcedure;
                                        sqlCommand4.CommandText = "TP_UserIdFromUsersCreateAccountPage";

                                        SqlParameter email = new SqlParameter("@EmailAddress", newUsers.EmailAddress);
                                        email.Direction = ParameterDirection.Input;
                                        sqlCommand4.Parameters.Add(email);


                                        DataSet ds3 = db.GetDataSetUsingCmdObj(sqlCommand4);

                                        int userID = Convert.ToInt32(ds3.Tables[0].Rows[0]["UserID"]);

                                        SqlParameter UserID = new SqlParameter("@UserID", userID);
                                        UserID.Direction = ParameterDirection.Input;
                                        sqlCommand2.Parameters.Add(UserID);

                                        db.DoUpdateUsingCmdObj(sqlCommand2);

                                        Response.Redirect("LogIn.aspx");

                                    }
                                    else
                                    {
                                        Response.Write("<script>alert('Please Fill Out All The Questions') </script>");

                                    }
                                }


                                else
                                {
                                    Response.Redirect("LogIn.aspx");
                                }

                            }

                            else
                            {
                                Response.Write("<script>alert('The EmailAddress is already taken! Please Try Again!') </script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Please Select Different Security Questions') </script>");
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

        public void sendMessage(string emailAddress, int num)
        {
            /*
            MailAddress to = new MailAddress(emailAddress);
            MailAddress from = new MailAddress("tui34800@temple.edu");

            MailMessage message = new MailMessage(from, to);
            message.Subject = "Moe's Fitness Account Creations";
            message.Body = "Thank you so much for signing up to Moe's Fitness. Please Verify your account to get access to our wonderful application!" +
                " Here's your verification code: " + num;


            SmtpClient client = new SmtpClient("smtp.temple.address", 25)
            {
                Credentials = new NetworkCredential("do-not-reply@temple.edu", "password"),
                EnableSsl = true,
                UseDefaultCredentials = false
            };

            try
            {
                client.Send(message);
            }
            catch (SmtpException ex)
            {
                Console.WriteLine(ex.ToString());
            }
            */
            Emails objEmail = new Emails();
            String strTO = emailAddress;
            String strFROM = "tui34800@temple.edu";
            String strSubject = "Moe's Fitness Account Creations";
            String strMessage = "Thank you so much for signing up to Moe's Fitness. Please Verify your account to get access to our wonderful application!" +
                " Here's your verification code: " + num;

            try
            {
                objEmail.SendMail(strTO, strFROM, strSubject, strMessage);
                Response.Write("<script>alert('The email was sent!') </script>");

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('The email couldn't be sent! Please make sure you entered the correct e-mail!') </script>");

            }
            

        }

    }
}