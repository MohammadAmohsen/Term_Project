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

namespace Term_Project
{
    public partial class UserSavedPrograms : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] == null)
                {
                    navBar.Visible = false;
                    content.Visible = false;
                    youShallNotPass.Visible = true;
                }
                else if (Session["UserID"] != null)
                {
                    //Repeater
                    //String strSQL = "Select ProgramID FROM TP_SavedProgram";

                    SqlCommand objCommand = new SqlCommand();
                    ArrayList arrayProgramID = new ArrayList();
                    ArrayList arrayDisplay = new ArrayList();

                    objCommand.CommandType = CommandType.StoredProcedure;
                    objCommand.CommandText = "TP_SelectProgramIDFromSavedPrograms";

                    SqlParameter ProgramID = new SqlParameter("@ID", Convert.ToInt32(Session["UserID"]));
                    ProgramID.Direction = ParameterDirection.Input;
                    objCommand.Parameters.Add(ProgramID);

                    DataSet mydata1 = db.GetDataSetUsingCmdObj(objCommand);

                    for (int i = 0; i < mydata1.Tables[0].Rows.Count; i++)
                    {
                        Program program = new Program();
                        int programID = Convert.ToInt32(mydata1.Tables[0].Rows[i]["ProgramID"]);

                        lvVisible(false);

                        SqlCommand objCommand1 = new SqlCommand();

                        objCommand1.CommandType = CommandType.StoredProcedure;
                        objCommand1.CommandText = "TP_SelectAllFromProgramWhereID";

                        SqlParameter ProgramID1 = new SqlParameter("@ID", programID);
                        ProgramID1.Direction = ParameterDirection.Input;
                        objCommand1.Parameters.Add(ProgramID1);

                        DataSet mydata = db.GetDataSetUsingCmdObj(objCommand1);
                        program.programName = mydata.Tables[0].Rows[0]["ProgramName"].ToString();
                        program.Image = mydata.Tables[0].Rows[0]["ProgramImage"].ToString();
                        program.ProgramID = Convert.ToInt32(mydata.Tables[0].Rows[0]["ProgramID"]);
                        program.description = mydata.Tables[0].Rows[0]["Description"].ToString();
                        program.dateAdded = mydata.Tables[0].Rows[0]["DateAdded"].ToString();
                        program.programType = mydata.Tables[0].Rows[0]["ProgramType"].ToString();
                        program.programExperience = mydata.Tables[0].Rows[0]["ProgramExperience"].ToString();
                        program.Days = Convert.ToInt32(mydata.Tables[0].Rows[0]["AmountOfDays"]);
                        program.LengthOfProgram = Convert.ToInt32(mydata.Tables[0].Rows[0]["LengthOfProgram"]);


                        arrayProgramID.Add(program);
                    }
                    // Set the datasource of the Repeater and bind the data
                    rptPrograms.DataSource = arrayProgramID;
                    rptPrograms.DataBind();

                }
            }
        }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
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

            lvMonday.DataSource = lvWorkoutDays(ID, "Monday");
            lvMonday.DataBind();

            lvTuesday.DataSource = lvWorkoutDays(ID, "Tuesday");
            lvTuesday.DataBind();

            lvWednesday.DataSource = lvWorkoutDays(ID, "Wednesday");
            lvWednesday.DataBind();

            lvThursday.DataSource = lvWorkoutDays(ID, "Thursday");
            lvThursday.DataBind();

            lvFriday.DataSource = lvWorkoutDays(ID, "Friday");
            lvFriday.DataBind();

            lvSaturday.DataSource = lvWorkoutDays(ID, "Saturday");
            lvSaturday.DataBind();

            lvSunday.DataSource = lvWorkoutDays(ID, "Sunday");
            lvSunday.DataBind();

        }

        protected void btnDetailView_Click(object sender, EventArgs e)
        {
            rptPrograms.Visible = false;
            //ListViewDisplayWorkout.Visible = true;
            lvVisible(true);

        }

        protected void btnSaveProgram_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }


        protected void btnBackToHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnMessages_Click(object sender, EventArgs e)
        {
            Response.Redirect("UserMessages.aspx");

        }


        protected void btnBack_Click(object sender, EventArgs e)
        {
            rptPrograms.Visible = true;
            // ListViewDisplayWorkout.Visible = false;
            lvVisible(false);
        }

        private ArrayList lvWorkoutDays(int ID, string dayName)
        {
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_SelectAllFromExercisesWhereDay";

            SqlParameter workoutID = new SqlParameter("@ID", ID);
            workoutID.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(workoutID);

            SqlParameter day = new SqlParameter("@Day", dayName);
            day.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(day);


            DataSet mydata1 = db.GetDataSetUsingCmdObj(objCommand);


            ArrayList arrayExercise = new ArrayList();
            int size = mydata1.Tables[0].Rows.Count;
            if (size > 0)
            {
                for (int row = 0; row < mydata1.Tables[0].Rows.Count; row++)
                {
                    Exercise exercise = new Exercise();
                    exercise.exerciseName = mydata1.Tables[0].Rows[row]["ExerciseName"].ToString();
                    exercise.sets = Convert.ToInt32(mydata1.Tables[0].Rows[row]["Sets"]);
                    exercise.reps = Convert.ToInt32(mydata1.Tables[0].Rows[row]["Reps"]);

                    arrayExercise.Add(exercise);
                }
                return arrayExercise;
            }
            else
            {
                Exercise exercise = new Exercise();
                exercise.exerciseName = "rest";
                arrayExercise.Add(exercise);
            }
            return arrayExercise;

        }

        private void lvVisible(Boolean boo)
        {
            lvMonday.Visible = boo;
            lvTuesday.Visible = boo;
            lvWednesday.Visible = boo;
            lvThursday.Visible = boo;
            lvFriday.Visible = boo;
            lvSaturday.Visible = boo;
            lvSunday.Visible = boo;
            btnBack.Visible = boo;
            lvContent.Visible = boo;
        }

    }
}