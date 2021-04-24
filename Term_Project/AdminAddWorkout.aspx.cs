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
                    navBar.Visible = false;
                    programContent.Visible = false;
                    youShallNotPass.Visible = true;
                }
                else
                {
                    
                    
                }
            }

        }

        //protected void btnCreateProgram_Click(object sender, EventArgs e)
        //{
        //    ArrayList arrayList = new ArrayList();
        //    Exercise exercise = new Exercise();
        //    Session["Time"] = DateTime.Now.ToString();

        //    SqlCommand sqlCommand3 = new SqlCommand();

        //    sqlCommand3.CommandType = CommandType.StoredProcedure;
        //    sqlCommand3.CommandText = "TP_SelectALLFromProgram";

        //    SqlParameter programName = new SqlParameter("@ProgramName", txtProgramName.Text);
        //    programName.Direction = ParameterDirection.Input;
        //    sqlCommand3.Parameters.Add(programName);

        //    DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

        //    int size = ds.Tables[0].Rows.Count;

        //    if (size == 0)
        //    {
        //        /*Insert Into Program Table */
        //        SqlCommand sqlCommand4 = new SqlCommand();

        //        sqlCommand4.CommandType = CommandType.StoredProcedure;
        //        sqlCommand4.CommandText = "TP_InsertIntoProgram";

        //        string moe = txtProgramName.Text;

        //        SqlParameter ProgramName = new SqlParameter("@ProgramName", txtProgramName.Text);
        //        ProgramName.Direction = ParameterDirection.Input;
        //        sqlCommand4.Parameters.Add(ProgramName);

        //        SqlParameter DateAdded = new SqlParameter("@DateTime", Session["Time"].ToString());
        //        DateAdded.Direction = ParameterDirection.Input;
        //        sqlCommand4.Parameters.Add(DateAdded);

        //        SqlParameter Desc = new SqlParameter("@Description", txtDesc.Text);
        //        Desc.Direction = ParameterDirection.Input;
        //        sqlCommand4.Parameters.Add(Desc);

        //        SqlParameter Type = new SqlParameter("@ProgramType", ddlType.SelectedValue);
        //        Type.Direction = ParameterDirection.Input;
        //        sqlCommand4.Parameters.Add(Type);

        //        SqlParameter Exp = new SqlParameter("@ProgramExperience", ddlExperience.SelectedValue);
        //        Exp.Direction = ParameterDirection.Input;
        //        sqlCommand4.Parameters.Add(Exp);

        //        SqlParameter Days = new SqlParameter("@AmountOfDays", rbDays.SelectedValue);
        //        Days.Direction = ParameterDirection.Input;
        //        sqlCommand4.Parameters.Add(Days);

        //        db.DoUpdateUsingCmdObj(sqlCommand4);

        //        //divContent.Visible = true;
        //        //programContent.Visible = false;
        //        Response.Write("<script>alert('Your Workout Program was created! Now create the scheule and give it some exercises!') </script>");
        //    }
        //    else
        //    {
        //        Response.Write("<script>alert('The Workout Program already exists! Please Try Again!') </script>");
        //    }
        //}

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

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
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

  

            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = Convert.ToInt32(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";

            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);



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


            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            txtExerciseMonday.Text = "";
            txtSetsMonday.Text = "";
            txtRepsMonday.Text = "";

        }

        protected void btnSubmitTuesday_Click(object sender, EventArgs e)
        {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtExcerciseTuesday.Text;
            int sets = Convert.ToInt32(txtSetsTuesday.Text);
            int reps = Convert.ToInt32(txtRepsTuesday.Text);

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            workOut.workoutDescirption = txtDescTuesday.Text;
            workOut.workoutDay = "Tuesday";

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


            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";


            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);


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

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            txtExcerciseTuesday.Text = "";
            txtSetsTuesday.Text = "";
            txtRepsTuesday.Text = "";
        }

        protected void btnAddWednesday_Click(object sender, EventArgs e)
        {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtExerciseWed.Text;
            int sets = Convert.ToInt32(txtSetsWed.Text);
            int reps = Convert.ToInt32(txtRepsWed.Text);

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            workOut.workoutDescirption = txtDescWed.Text;
            workOut.workoutDay = "Wednesday";

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


            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";


            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);


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

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            txtExerciseWed.Text = "";
            txtSetsWed.Text = "";
            txtRepsWed.Text = "";
        }

            protected void btnFriday_Click(object sender, EventArgs e)
            {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtExerciseFri.Text;
            int sets = Convert.ToInt32(txtSetsFri.Text);
            int reps = Convert.ToInt32(txtRepsFri.Text);

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            workOut.workoutDescirption = txtDescFri.Text;
            workOut.workoutDay = "Friday";

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


            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";


            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);


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

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            txtExerciseFri.Text = "";
            txtSetsFri.Text = "";
            txtRepsFri.Text = "";
        }

        protected void btnAddThursday_Click(object sender, EventArgs e)
        {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtExerciseThurs.Text;
            int sets = Convert.ToInt32(txtSetsThurs.Text);
            int reps = Convert.ToInt32(txtRepsThurs.Text);

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            workOut.workoutDescirption = txtDesThurs.Text;
            workOut.workoutDay = "Thursday";

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


            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";


            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);


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

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            txtExerciseThurs.Text = "";
            txtSetsThurs.Text = "";
            txtRepsThurs.Text = "";
        }

        protected void btnAddSaturday_Click(object sender, EventArgs e)
        {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtExerciseSat.Text;
            int sets = Convert.ToInt32(txtSetsSat.Text);
            int reps = Convert.ToInt32(txtRepsSat.Text);

            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            workOut.workoutDescirption = txtDescSat.Text;
            workOut.workoutDay = "Saturday";
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


            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";


            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);


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

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);

            txtExerciseSat.Text = "";
            txtSetsSat.Text = "";
            txtRepsSat.Text = "";
        }

        protected void btnAddSunday_Click(object sender, EventArgs e)
        {
            Exercise exercise = new Exercise();
            Workout workOut = new Workout();

            string exerciseName = txtDescSun.Text;
            int sets = Convert.ToInt32(txtSetsSat.Text);
            int reps = Convert.ToInt32(txtRepsSun.Text);
 
            exercise.exerciseName = exerciseName;
            exercise.sets = sets;
            exercise.reps = reps;
            workOut.workoutDescirption = txtDescSun.Text;
            workOut.workoutDay = "Sunday";

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


            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int ID = (int)(ds.Tables[0].Rows[0]["ExerciseID"]);


            /* Select ProgramID From Program Table */
            SqlCommand sqlCommand1A = new SqlCommand();

            sqlCommand1A.CommandType = CommandType.StoredProcedure;
            sqlCommand1A.CommandText = "TP_SelectProgramIDFromProgram";


            SqlParameter Name2 = new SqlParameter("@Name", txtProgramName.Text);
            Name2.Direction = ParameterDirection.Input;
            sqlCommand1A.Parameters.Add(Name2);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1A);

            int ProgramID = (int)(ds1.Tables[0].Rows[0]["ProgramID"]);


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

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            sqlCommand2.Parameters.Add(programID);

            db.DoUpdateUsingCmdObj(sqlCommand2);
            txtExerciseSun.Text = "";
            txtSetsSun.Text = "";
            txtRepsSun.Text = "";
        }
    }
}