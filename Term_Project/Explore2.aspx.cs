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
    public partial class Explore2 : System.Web.UI.Page
    {              
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Repeater
                String strSQL = "SELECT * FROM TP_Program";

                // Set the datasource of the Repeater and bind the data
                rptPrograms.DataSource = db.GetDataSet(strSQL);
                rptPrograms.DataBind();

            }
        }


        protected void rptPrograms_OnItemCommand(object sender, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
        {
            // Retrieve the row index for the item that fired the ItemCommand event
            int rowIndex = e.Item.ItemIndex;

            // Retrieve a value from a control in the Repeater's Items collection
            Label id = (Label)(rptPrograms.Items[rowIndex].FindControl("lblProgramID"));
             int ID = Convert.ToInt32(id.Text);
            Label myLabel = (Label)rptPrograms.Items[rowIndex].FindControl("ProgramID");

            //List View Workout
           // String strSQLForWorkoutDisplay = "SELECT * FROM TP_Workouts Where ProgramID = " + ID;

            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_SelectAllFromWorkout";

            SqlParameter workoutID = new SqlParameter("@ID", ID);
            workoutID.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(workoutID);

            DataSet mydata = db.GetDataSetUsingCmdObj(objCommand);


            ArrayList arrayExercise = new ArrayList();
            int size = mydata.Tables[0].Rows.Count;
            for (int i = 0; i < size; i++)
            {
                Exercise exercise = new Exercise();
                 exercise.ExerciseID = Convert.ToInt32(mydata.Tables[0].Rows[i]["ExerciseID"]);


                //List View Exercise
                // String strSqlForExerciseDisplay = "SELECT * FROM TP_Exercise, TP_Workouts WHERE TP_Exercise.ExerciseID = TP_Workouts.WorkoutID";
             SqlCommand objCommand1 = new SqlCommand();

                objCommand1.CommandType = CommandType.StoredProcedure;
                objCommand1.CommandText = "TP_SelectAllfromExercisesWhereWorkoutID";

                SqlParameter exerciseID = new SqlParameter("@ID", exercise.ExerciseID);
                exerciseID.Direction = ParameterDirection.Input;
                objCommand1.Parameters.Add(exerciseID);
                DataSet mydata1 = db.GetDataSetUsingCmdObj(objCommand1);

                for (int row = 0; row < mydata1.Tables.Count; row++)
                {
                    exercise.exerciseName = mydata1.Tables[0].Rows[row]["ExerciseName"].ToString();
                    exercise.sets = Convert.ToInt32(mydata1.Tables[0].Rows[row]["Sets"]);
                    exercise.reps = Convert.ToInt32(mydata1.Tables[0].Rows[row]["Reps"]);

                    arrayExercise.Add(exercise);
                }

            }
            ListViewExercise.DataSource = arrayExercise;
            ListViewExercise.DataBind();


        }

        protected void btnDetailView_Click(object sender, EventArgs e)
        {
            rptPrograms.Visible = false;
            btnBack.Visible = true;
            //ListViewDisplayWorkout.Visible = true;
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
           // ListViewDisplayWorkout.Visible = false;
            ListViewExercise.Visible = false;

        }


    }
}