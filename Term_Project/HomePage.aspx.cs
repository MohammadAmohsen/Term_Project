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
    public partial class HomePage : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    navBar.Visible = false;
                    ContentID.Visible = false;
                    youShallNotPass.Visible = true;
                }

                else
                {
                    // int programID = Convert.ToInt32(Session["ProgramID"]);
                    DateTime f = DateTime.Now;
                    DateTime no = f.AddDays(12);
                    navBar.Visible = true;
                    ContentID.Visible = true;
                    youShallNotPass.Visible = false;
                    SavedWorkouts();
                }
                if ((Session["UserID"] != null && Session["Assistance"].ToString() == "Yes"))
                {
                    FindWorkout(Convert.ToInt32(Session["UserDays"]), Session["UserTraining"].ToString(), Session["Experience"].ToString());
                }

            }
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;
            Response.Redirect("LogIn.aspx");

        }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");

        }


        protected void btnMessages_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserMessages.aspx");

        }

        private void SavedWorkouts()
        {
            /* First Statement to get ProgramID */
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_SelectProgramID";

            SqlParameter ID = new SqlParameter("@UserID", Convert.ToInt32(Session["UserID"]));
            ID.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(ID);

            DataSet mydata = db.GetDataSetUsingCmdObj(objCommand);
            int ProgramID = Convert.ToInt32(mydata.Tables[0].Rows[0]["ProgramID"]);

            /* Second Statement to get Length Of Program */
            SqlCommand objCommand1 = new SqlCommand();

            objCommand1.CommandType = CommandType.StoredProcedure;
            objCommand1.CommandText = "TP_SelectProgramLength";

            SqlParameter programID = new SqlParameter("@ID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            objCommand1.Parameters.Add(programID);

            DataSet mydata1 = db.GetDataSetUsingCmdObj(objCommand1);
            double LengthOfProgram = Convert.ToInt32(mydata1.Tables[0].Rows[0]["LengthOfProgram"]);

            /* Third Statement to get Date Added Of Program */
            SqlCommand objCommand2 = new SqlCommand();

            objCommand2.CommandType = CommandType.StoredProcedure;
            objCommand2.CommandText = "TP_SelectDaySelected";

            SqlParameter userID = new SqlParameter("@ID", Convert.ToInt32(Session["UserID"]));
            userID.Direction = ParameterDirection.Input;
            objCommand2.Parameters.Add(userID);

            DataSet mydata2 = db.GetDataSetUsingCmdObj(objCommand2);
            DateTime dateSelected = Convert.ToDateTime(mydata2.Tables[0].Rows[0]["DayWorkoutSelected"]);

            /*Date When User finished program */
            DateTime dateFinished = dateSelected.AddDays(LengthOfProgram);

            double difference = Convert.ToInt32((dateFinished - DateTime.Now).TotalDays);

            lblDaysLeft.Text = difference.ToString();

            double percentage = ((LengthOfProgram - difference) / LengthOfProgram) * 100;

            progressBar.Style["width"] = percentage.ToString() + "%";

            lblCompletionPercentage.Text = percentage.ToString("#.##") + "%";


            SqlCommand objCommand3 = new SqlCommand();

            objCommand3.CommandType = CommandType.StoredProcedure;
            objCommand3.CommandText = "TP_SelectProgramName";

            SqlParameter ProgramID1 = new SqlParameter("@ID", ProgramID);
            ProgramID1.Direction = ParameterDirection.Input;
            objCommand3.Parameters.Add(ProgramID1);

            DataSet mydata3 = db.GetDataSetUsingCmdObj(objCommand3);
            string ProgramName = mydata3.Tables[0].Rows[0]["ProgramName"].ToString();

            lblProgram.Text = "Program Selected: " + ProgramName;
        }

        public void FindWorkout(int days, string training, string experience)
        {

            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_SelectProgramNameForUser";

            SqlParameter Days = new SqlParameter("@Days", days);
            Days.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(Days);

            SqlParameter Training = new SqlParameter("@Training", training);
            Training.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(Training);

            SqlParameter Exp = new SqlParameter("@Experience", experience);
            Exp.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(Exp);

            DataSet mydata = db.GetDataSetUsingCmdObj(objCommand);
            string programName = mydata.Tables[0].Rows[0]["ProgramName"].ToString();

            lblTest.Text = programName;
       
        }
    }
}
   