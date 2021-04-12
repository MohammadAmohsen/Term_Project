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
    public partial class AdminAddWorkout : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    headerNav.Visible = false;
                    ContentID.Visible = false;
                    youShallNotPass.Visible = true;
                }
                else
                {
                    headerNav.Visible = true;
                    ContentID.Visible = true;
                    youShallNotPass.Visible = false;
                }
            }

        }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnCreateProgram_Click(object sender, EventArgs e)
        {
            ArrayList arrayList = new ArrayList();
            Exercise exercise = new Exercise();

            for(int i = 0; i < 10; i++)
            {
                string ExerciseMonday = "txtExerciseMonday" + i + ".Text";
                exercise.exerciseName = ExerciseMonday;

                string setsMonday = "txtExerciseMonday" + i + ".Text";
                exercise.sets = Convert.ToInt32(setsMonday);

                string repsMonday = "txtExerciseMonday" + i + ".Text";
                exercise.reps = Convert.ToInt32(repsMonday);
            }

            exercise.exerciseName = txtExerciseMonday.Text;

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminPage.aspx");

        }

        protected void btnAddMonday_Click(object sender, EventArgs e)
        {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtExerciseMonday.Text;
            int sets = Convert.ToInt32(txtSetsMonday.Text);
            int reps = Convert.ToInt32(txtRepsMonday.Text);
            string days = "Monday";

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            exercise.day = days;
            workOut.workoutDescirption = txtMondayDescription.Text;
            workOut.workoutDay = "Monday";

            /*Insert Into Exercise Table */

            SqlCommand sqlCommand1 = new SqlCommand();

            sqlCommand1.CommandType = CommandType.StoredProcedure;
            sqlCommand1.CommandText = "TP_InsertIntoExercise";

            SqlParameter Name = new SqlParameter("@ExerciseName", exercise.exerciseName);
            Name.Direction = ParameterDirection.Input;
            sqlCommand1.Parameters.Add(Name);

            SqlParameter Sets = new SqlParameter("@Sets", exercise.sets);
            Sets.Direction = ParameterDirection.Input;
            sqlCommand1.Parameters.Add(Sets);

            SqlParameter Reps = new SqlParameter("@Reps", exercise.reps);
            Reps.Direction = ParameterDirection.Input;
            sqlCommand1.Parameters.Add(Reps);

            SqlParameter Day = new SqlParameter("@Day", exercise.day);
            Day.Direction = ParameterDirection.Input;
            sqlCommand1.Parameters.Add(Day);

             db.DoUpdateUsingCmdObj(sqlCommand1);

            /*Get Exercise ID*/

            SqlCommand sqlCommand3 = new SqlCommand();

            sqlCommand3.CommandType = CommandType.StoredProcedure;
            sqlCommand3.CommandText = "TP_SelectExerciseID";

            SqlParameter Name1 = new SqlParameter("@Name", exercise.exerciseName);
            Name1.Direction = ParameterDirection.Input;
            sqlCommand3.Parameters.Add(Name1);

            SqlParameter Sets1 = new SqlParameter("@Sets", exercise.sets);
            Sets1.Direction = ParameterDirection.Input;
            sqlCommand3.Parameters.Add(Sets1);

            SqlParameter Reps1 = new SqlParameter("@Reps", exercise.reps);
            Reps1.Direction = ParameterDirection.Input;
            sqlCommand3.Parameters.Add(Reps1);

            SqlParameter Day1 = new SqlParameter("@Day", exercise.day);
            Day1.Direction = ParameterDirection.Input;
            sqlCommand3.Parameters.Add(Day1);

            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /*Insert Into Workout Table */
            SqlCommand sqlCommand2 = new SqlCommand();

            sqlCommand2.CommandType = CommandType.StoredProcedure;
            sqlCommand2.CommandText = "TP_InsertWorkouts";

            SqlParameter WorkoutDay = new SqlParameter("@WorkoutDay", workOut.workoutDay);
            WorkoutDay.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(WorkoutDay);

            SqlParameter WorkoutDescription = new SqlParameter("@WorkoutDescription", workOut.workoutDescirption);
            WorkoutDescription.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(WorkoutDescription);

            SqlParameter ExerciseID = new SqlParameter("@ExerciseID", ID);
            ExerciseID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(ExerciseID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            /*Get WorkOutID*/

            SqlCommand sqlCommand5 = new SqlCommand();

            sqlCommand5.CommandType = CommandType.StoredProcedure;
            sqlCommand5.CommandText = "TPSelectWorkoutIdByWorkoutName";

            SqlParameter workoutDesc = new SqlParameter("@WorkoutDescription", workOut.workoutDescirption);
            workoutDesc.Direction = ParameterDirection.Input;
            sqlCommand5.Parameters.Add(workoutDesc);

            SqlParameter workoutDay = new SqlParameter("@WorkoutDay", workOut.workoutDay);
            workoutDay.Direction = ParameterDirection.Input;
            sqlCommand5.Parameters.Add(workoutDay);

            SqlParameter ExerciseID1 = new SqlParameter("@ExerciseID", ID);
            ExerciseID1.Direction = ParameterDirection.Input;
            sqlCommand5.Parameters.Add(ExerciseID1);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand5);

            int WorkoutId = (int)ds1.Tables[0].Rows[0]["WorkoutID"];


            /*Insert Into Program Table */
            SqlCommand sqlCommand4 = new SqlCommand();

            sqlCommand4.CommandType = CommandType.StoredProcedure;
            sqlCommand4.CommandText = "TP_InsertIntoProgram";

            string moe = txtProgramName.Text;

            SqlParameter ProgramName = new SqlParameter("@ProgramName", txtProgramName.Text);
            ProgramName.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(ProgramName);

            SqlParameter DateAdded = new SqlParameter("@DateTime", DateTime.Now);
            DateAdded.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(DateAdded);

            SqlParameter Desc = new SqlParameter("@Description", txtDesc.Text);
            Desc.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(Desc);

            SqlParameter Type = new SqlParameter("@ProgramType", ddlType.SelectedValue);
            Type.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(Type);

            SqlParameter Exp = new SqlParameter("@ProgramExperience", ddlExpereience.SelectedValue);
            Exp.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(Exp);

            SqlParameter Days = new SqlParameter("@AmountOfDays", rbDays.SelectedValue);
            Days.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(Days);

            SqlParameter WorkoutID = new SqlParameter("@WorkOutID", WorkoutId);
            WorkoutID.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(WorkoutID);

            db.DoUpdateUsingCmdObj(sqlCommand4);

        }

        protected void btnSubmitTuesday_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddWednesday_Click(object sender, EventArgs e)
        {

        }

        protected void btnFriday_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddThursday_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddSaturday_Click(object sender, EventArgs e)
        {

        }

        protected void btnAddSunday_Click(object sender, EventArgs e)
        {

        }
    }
}