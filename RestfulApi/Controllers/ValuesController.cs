using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RestfulApi.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Utilities;
using WorkoutLibrary;

namespace RestfulApi
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValuesController : Controller
    {

        [HttpGet]
        public String Get()
        {
            return "plz work";
        }


    }
}
