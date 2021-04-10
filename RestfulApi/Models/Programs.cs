using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace RestfulApi.Models
{
    public class Programs
    {
        public String programName
        {
            get;
            set;
        }
        public String dateAdded
        {
            get;
            set;
        }
        public String description
        {
            get;
            set;
        }
        public String programType
        {
            get;
            set;
        }
        public String programExperience
        {
            get;
            set;
        }
        public int days
        {
            get;
            set;
        }
        public int workoutID
        {
            get;
            set;
        }

    }
}
