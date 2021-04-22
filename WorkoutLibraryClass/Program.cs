using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WorkoutLibrary
{
    public class Program
    {
        private String ProgramName;
        private String DateAdded;
        private String Description;
        private String ProgramType;
        private String ProgramExperience;
        private int days;
        private int lengthOfProgram;
        private String image;
        private int programID;

        public int ProgramID
        {
            get { return programID; }
            set { programID = value; }
        }
        public int LengthOfProgram
        {
            get { return lengthOfProgram; }
            set { lengthOfProgram = value; }
        }
        public String Image
        {
            get { return image; }
            set { image = value; }
        }
        public int Days
        {
            get { return days; }
            set { days = value; }
        }
        public String programName
        {
            get { return ProgramName; }
            set { ProgramName = value; }
        }
        public String dateAdded
        {
            get { return DateAdded; }
            set { DateAdded = value; }
        }
        public String description
        {
            get { return Description; }
            set { Description = value; }
        }
        public String programType
        {
            get { return ProgramType; }
            set { ProgramType = value; }
        }
        public String programExperience
        {
            get { return ProgramExperience; }
            set { ProgramExperience = value; }
        }


    }
}
