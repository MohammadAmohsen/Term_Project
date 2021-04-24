using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Utilities;
using WebAPITermProject.Models;
using WorkoutLibrary;

namespace WebAPITermProject.Controllers
{
    [Route("api/Fitness")]
    public class FitnessController : Controller
    {

        [HttpGet]
        public string Get()
        {
            return "Web api ran";
        }

        [HttpGet("AllPrograms")]  //https://localhost:44314/api/Fitness/AllPrograms/
        public List<Programs> GetAll()
        {
            DBConnect db = new DBConnect();
            DataSet ds = db.GetDataSet("SELECT * FROM TP_Program");

            List<Programs> programs = new List<Programs>();
            Programs program;

            foreach (DataRow record in ds.Tables[0].Rows)
            {
                program = new Programs();
                program.programID = int.Parse(record["ProgramID"].ToString());
                program.programName = record["ProgramName"].ToString();
                program.dateAdded = DateTime.Parse(record["dateAdded"].ToString());
                program.description = record["Description"].ToString();
                program.programType = record["ProgramType"].ToString();
                program.programExperience = record["ProgramExperience"].ToString();
                program.days = int.Parse(record["AmountOfDays"].ToString());
                program.Image = record["ProgramImage"].ToString();

                programs.Add(program);
            }

            return programs;
        }

        [HttpGet("GetEmail/{email}")] //api/Fitness/GetEmail/{email}
        //DONE AJAX
        public int UserEmail(string email)
        {
            DBConnect db = new DBConnect();
            SqlCommand sqlCommand1 = new SqlCommand();

            sqlCommand1.CommandType = CommandType.StoredProcedure;
            sqlCommand1.CommandText = "TP_SelectVerificationCodeFromUsers";

 
            SqlParameter email1 = new SqlParameter("@Email", email);
            email1.Direction = ParameterDirection.Input;
            sqlCommand1.Parameters.Add(email1);

            DataSet ds1 = db.GetDataSetUsingCmdObj(sqlCommand1);

            int verificationCode = Convert.ToInt32(ds1.Tables[0].Rows[0]["VerificationCode"]);

            return verificationCode;
        }


        [HttpDelete("DeleteProgram/{ProgramName}")] //route:api/Fitness/DeleteProgram/(ProgramID)
         public Boolean DeleteProgram(string ProgramName)
        {
            DBConnect db = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_DeleteFromPrograms";

            SqlParameter Name = new SqlParameter("@Name", ProgramName);
            Name.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(Name);


            int result = db.DoUpdateUsingCmdObj(objCommand);

            if (result > 0)
            {
                return true;
            }
            else
            {
            return false;

            }
        }

        [HttpDelete("DeleteWorkOut/{ProgramID}")] //route:api/Fitness/DeleteWorkOut/(ProgramID)
        public Boolean DeleteWorkout(int ProgramID)
        {
            DBConnect db = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_DeleteFromWorkouts";

            SqlParameter programID = new SqlParameter("@ProgramID", ProgramID);
            programID.Direction = ParameterDirection.Input;
            objCommand.Parameters.Add(programID);

 
            int result = db.DoUpdateUsingCmdObj(objCommand);

            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        [HttpPost("AddProgram")] //route:api/Fitness/AddProgram
        //DONE AJAX
         public Boolean Post([FromBody] Programs program)
        {
            DBConnect db = new DBConnect();

            ArrayList arrayList = new ArrayList();
            Exercise exercise = new Exercise();

            SqlCommand sqlCommand3 = new SqlCommand();

            sqlCommand3.CommandType = CommandType.StoredProcedure;
            sqlCommand3.CommandText = "TP_SelectALLFromProgram";

            SqlParameter programName = new SqlParameter("@ProgramName", program.programName);
            programName.Direction = ParameterDirection.Input;
            sqlCommand3.Parameters.Add(programName);

            DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            int size = ds.Tables[0].Rows.Count;

            if (size == 0)
            {
                /*Insert Into Program Table */
                SqlCommand sqlCommand4 = new SqlCommand();

                sqlCommand4.CommandType = CommandType.StoredProcedure;
                sqlCommand4.CommandText = "TP_InsertIntoProgram";


                SqlParameter ProgramName = new SqlParameter("@ProgramName", program.programName);
                ProgramName.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(ProgramName);

                SqlParameter DateAdded = new SqlParameter("@DateTime", DateTime.Now);
                DateAdded.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(DateAdded);

                SqlParameter Desc = new SqlParameter("@Description", program.description);
                Desc.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(Desc);

                SqlParameter Type = new SqlParameter("@ProgramType", program.programType);
                Type.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(Type);

                SqlParameter Exp = new SqlParameter("@ProgramExperience", program.programExperience);
                Exp.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(Exp);

                SqlParameter Days = new SqlParameter("@AmountOfDays", program.days);
                Days.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(Days);

                SqlParameter image = new SqlParameter("@Image", program.Image);
                image.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(image);

                SqlParameter Length = new SqlParameter("@Length", program.programLength);
                Length.Direction = ParameterDirection.Input;
                sqlCommand4.Parameters.Add(Length);

                int ret = db.DoUpdateUsingCmdObj(sqlCommand4);


                if (ret > 0)
                {
                    return true;

                }
                else
                {
                    return false;
                }

            }
            else
            {
                return false;
            }




            //DBConnect db = new DBConnect();

            //string sql = "INSERT INTO TP_Program (ProgramName, DateAdded, Description, ProgramType, ProgramExperience, AmountOfDays, ProgramImage, LengthOfProgram) " +
            //    "VALUES ('" + program.programName + "', '" + program.dateAdded + "', '" + program.description + "', '" + program.programType + "', '" + program.programExperience
            //    + "', " + program.days + ", '" + program.programImage + "', " + program.programLength + ")";
            ////DataSet recordSet = db.GetDataSet(sql);
            //int result = db.DoUpdate(sql);

        //    if (result > 0)
        //    {
        //        return true;
        //    }
        //    else
        //    {
        //    return false;

        //    }
        }

        [HttpPut("UpdateProgram/{email}")] //api/Fitness/UpdateProgram/(ProgramID)
        //DONE AJAX
        public Boolean Put(string email)
        {

            DBConnect db = new DBConnect();

            //String sql = "UPDATE TP_Users SET Verified = Yes WHERE EmailAddress = '" + email + "'";

            /*Insert Into Program Table */
            SqlCommand sqlCommand4 = new SqlCommand();

            sqlCommand4.CommandType = CommandType.StoredProcedure;
            sqlCommand4.CommandText = "TP_UpdateUsersSetVerifiedYes";

            SqlParameter Email = new SqlParameter("@Email", email);
            Email.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(Email);

            SqlParameter yes = new SqlParameter("@Yes", "Yes");
            yes.Direction = ParameterDirection.Input;
            sqlCommand4.Parameters.Add(yes);

            int result = db.DoUpdateUsingCmdObj(sqlCommand4);
            if (result > 0)
                return true;

            return false;

        }


        //[HttpGet("User/{email}/{password}")]  //MoesFitness/Values/User
        // public int GetUser(string email, string password)
        //{
        //    DBConnect db = new DBConnect();

        //        SqlCommand objCommand = new SqlCommand();

        //        objCommand.CommandType = CommandType.StoredProcedure;
        //        objCommand.CommandText = "TP_SelectAllFromUsers";

        //    SqlParameter Email = new SqlParameter("@InputEmail", email);
        //    Email.Direction = ParameterDirection.Input;
        //    objCommand.Parameters.Add(Email);

        //    SqlParameter Password = new SqlParameter("@InputPassword", password);
        //    Password.Direction = ParameterDirection.Input;
        //    objCommand.Parameters.Add(Password);

        //    DataSet mydata = db.GetDataSetUsingCmdObj(objCommand);
        //    int size = mydata.Tables[0].Rows.Count;

        //    return size;
        //}

    }
}
