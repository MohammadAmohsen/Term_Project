using Microsoft.AspNetCore.Mvc;
 using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Utilities;
using WebAPITermProject.Models;

namespace WebAPITermProject.Controllers
{
    [Route("api/values")]
    public class ValuesController : Controller
    {
        [HttpPost("AddProgram")] //route:api/Fitness/AddProgram
        //add house to db
        public Boolean Post([FromBody] Programs program)
        {
            //DBConnect db = new DBConnect();

            //ArrayList arrayList = new ArrayList();
            //Exercise exercise = new Exercise();

            //SqlCommand sqlCommand3 = new SqlCommand();

            //sqlCommand3.CommandType = CommandType.StoredProcedure;
            //sqlCommand3.CommandText = "TP_SelectALLFromProgram";

            //SqlParameter programName = new SqlParameter("@ProgramName", program.programName);
            //programName.Direction = ParameterDirection.Input;
            //sqlCommand3.Parameters.Add(programName);

            //DataSet ds = db.GetDataSetUsingCmdObj(sqlCommand3);

            //int size = ds.Tables[0].Rows.Count;

            //if (size == 0)
            //{
            //    /*Insert Into Program Table */
            //    SqlCommand sqlCommand4 = new SqlCommand();

            //    sqlCommand4.CommandType = CommandType.StoredProcedure;
            //    sqlCommand4.CommandText = "TP_InsertIntoProgram";


            //    SqlParameter ProgramName = new SqlParameter("@ProgramName", program.programName);
            //    ProgramName.Direction = ParameterDirection.Input;
            //    sqlCommand4.Parameters.Add(ProgramName);

            //    SqlParameter DateAdded = new SqlParameter("@DateTime", DateTime.Now);
            //    DateAdded.Direction = ParameterDirection.Input;
            //    sqlCommand4.Parameters.Add(DateAdded);

            //    SqlParameter Desc = new SqlParameter("@Description", program.description);
            //    Desc.Direction = ParameterDirection.Input;
            //    sqlCommand4.Parameters.Add(Desc);

            //    SqlParameter Type = new SqlParameter("@ProgramType", program.programType);
            //    Type.Direction = ParameterDirection.Input;
            //    sqlCommand4.Parameters.Add(Type);

            //    SqlParameter Exp = new SqlParameter("@ProgramExperience", program.programExperience);
            //    Exp.Direction = ParameterDirection.Input;
            //    sqlCommand4.Parameters.Add(Exp);

            //    SqlParameter Days = new SqlParameter("@AmountOfDays", program.days);
            //    Days.Direction = ParameterDirection.Input;
            //    sqlCommand4.Parameters.Add(Days);

            //    int ret = db.DoUpdateUsingCmdObj(sqlCommand4);


            //    if (ret > 0)
            //    {
            //        return true;

            //    }
            //    else
            //    {
            //        return false;
            //    }

            //}
            //else
            //{
            //    return false;
            //}




            DBConnect db = new DBConnect();

            string sql = "INSERT INTO TP_Program (ProgramName, DateAdded, Description, ProgramType, ProgramExperience, AmountOfDays, ProgramImage, LengthOfProgram) " +
                "VALUES ('" + program.programName + "', '" + program.dateAdded + "', '" + program.description + "', '" + program.programType + "', '" + program.programExperience
                + ", '" + program.days + ", '" + program.programImage + "', '" + program.programLength + "')";
            DataSet recordSet = db.GetDataSet(sql);
            int result = db.DoUpdate(sql);

            if (result > 0)
                return true;

            return false;
        }
    }
}
