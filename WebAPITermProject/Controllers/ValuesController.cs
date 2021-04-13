﻿using Microsoft.AspNetCore.Mvc;
using RestfulApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Utilities;

namespace WebAPITermProject.Controllers
{
    [Route("MoesFitness/[controller]")]
    [ApiController]
    public class ValuesController : ControllerBase
    {
        // GET api/values
        [HttpGet]
        public ActionResult<IEnumerable<string>> Get()
        {
            return new string[] { "value1", "value2" };
        }

        [HttpGet("AllPrograms")]  //MoesFitness/Values/AllPrograms
        //Get houses based on type (list)
        public List<Programs> GetAll()
        {
            DBConnect db = new DBConnect();
            DataSet ds = db.GetDataSet("SELECT * FROM TP_Program");

            List<Programs> programs = new List<Programs>();
            Programs program;

            foreach (DataRow record in ds.Tables[0].Rows)
            {
                program = new Programs();
                program.programName = record["ProgramName"].ToString();     
                program.dateAdded = DateTime.Parse(record["DateAdded"].ToString());
                program.description = record["Description"].ToString();
                program.programType = record["ProgramType"].ToString();
                program.programExperience = record["ProgramExperience"].ToString();
                program.days = int.Parse(record["AmountOfDays"].ToString());   

                programs.Add(program);
            }

            return programs;
        }

        [HttpDelete("DeleteProgram/{ProgramID}")] //route:MoesFitness/{controllerName}/DeleteProgram/(ProgramID)
        //delete house from database
        public Boolean DeleteProgram(int ProgramID)
        {
            DBConnect db = new DBConnect();
            string strSQL = "DELETE FROM TP_Program WHERE ProgramID = " + ProgramID;
            DataSet recordSet = db.GetDataSet(strSQL);

            int result = db.DoUpdate(strSQL);

            if (result > 0)
                return true;

            return false;
        }


        [HttpPost("AddProgram")] //route: MoesFitness/{controllerName}/AddProgram
        //add house to db
        public Boolean Post([FromBody] Programs program)
        {
            DBConnect db = new DBConnect();

            string sql = "INSERT INTO TP_Program (ProgramName, DateAdded, Description, WorkoutID, ProgramType, ProgramExperience, AmountOfDays) " +
                "VALUES (" + program.programName + ", '" + program.dateAdded + "', '" + program.description + "', '" + program.workoutID + "', '" + program.programType + "', '" + program.programExperience
                + "', '" + program.days + "')";
            DataSet recordSet = db.GetDataSet(sql);
            int result = db.DoUpdate(sql);

            if (result > 0)
                return true;

            return false;
        }

        [HttpPut("UpdateProgram/{ProgramID}")] //MoesFitness/{controllerName}/UpdateProgram/(ProgramID)
        public Boolean Put(int HomeID, [FromBody] Programs program)
        {

            DBConnect db = new DBConnect();

            String sql = "UPDATE TP_Program SET ProgramName = '" + program.programName + "', DateAdded = '" + program.dateAdded + "', Description = '" + program.description + "', WorkoutID = " + program.workoutID +
                ", ProgramType = '" + program.programType + "', ProgramExperience = " + program.programExperience + ", AmountOfDays = " + program.days;

            int result = db.DoUpdate(sql);
            if (result > 0)
                return true;

            return false;

        }

    }
}
