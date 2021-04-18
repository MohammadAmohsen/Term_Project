using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace Term_Project
{
    public partial class Explore2 : System.Web.UI.Page
    {              
        DBConnect objDB = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Repeater
                String strSQL = "SELECT * FROM TP_Program";

                // Set the datasource of the Repeater and bind the data
                rptPrograms.DataSource = objDB.GetDataSet(strSQL);
                rptPrograms.DataBind();

                //List View Workout
                String strSQLForWorkoutDisplay = "SELECT * FROM TP_Workouts";         

                ListViewDisplayWorkout.DataSource = objDB.GetDataSet(strSQLForWorkoutDisplay);
                ListViewDisplayWorkout.DataBind();


                //List View Exercise
                String strSqlForExerciseDisplay = "SELECT * FROM TP_Exercise";

                ListViewExercise.DataSource = objDB.GetDataSet(strSqlForExerciseDisplay);
                ListViewExercise.DataBind();
            }
        }


        protected void rptPrograms_OnItemCommand(object sender, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            // Retrieve the row index for the item that fired the ItemCommand event
            int rowIndex = e.Item.ItemIndex;

            // Retrieve a value from a control in the Repeater's Items collection
            Label myLabel = (Label)rptPrograms.Items[rowIndex].FindControl("ProgramID");


        }

        protected void btnDetailView_Click(object sender, EventArgs e)
        {
            rptPrograms.Visible = false;
            btnBack.Visible = true;
            ListViewDisplayWorkout.Visible = true;
            ListViewExercise.Visible = true;

        }

        protected void btnSaveProgram_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        
        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            rptPrograms.Visible = true;
            btnBack.Visible = false;
            ListViewDisplayWorkout.Visible = false;
            ListViewExercise.Visible = false;

        }


    }
}