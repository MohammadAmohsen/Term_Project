using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestfulApi.Controllers
{
    [Route("api/MoesFitness")]
    public class MoesFitnessController : Controller
    {

        [HttpGet]
        public String Get()
        {
            return "plz work";
        }

    }
}
