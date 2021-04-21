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

namespace Term_Project
{
    public partial class AdminManagePrograms : System.Web.UI.Page
    {
        DBConnect db = new DBConnect();
        FitnessService.FitnessSoap pxy = new FitnessService.FitnessSoap();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Session["UserID"] == null)
                {
                    navBar.Visible = false;
                    ContentID.Visible = false;
                    youShallNotPass.Visible = true;
                }
                else
                {
                    navBar.Visible = true;
                    ContentID.Visible = true;
                    youShallNotPass.Visible = false;
                    ShowUsers();
                }
            }
        }

        protected void btnBackToLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("LogIn.aspx");
        }

        protected void btnCreateWorkOut_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminAddWorkout.aspx");
        }

        protected void btnCreateAdmin_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminSignUp.aspx");
        }


        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session["UserID"] = null;

            Response.Redirect("LogIn.aspx");

        }

        protected void btnMessages_Click(object sender, EventArgs e)
        {

            Response.Redirect("AdminMessages.aspx");

        }

        public void ShowUsers()
        {
            SqlCommand sqlCommand1 = new SqlCommand();
            ArrayList programList = new ArrayList();

            sqlCommand1.CommandType = CommandType.StoredProcedure;
            sqlCommand1.CommandText = "TP_SelectEverythingFromProgram";

            DataSet myData = db.GetDataSetUsingCmdObj(sqlCommand1);

            // String sql = "SELECT * FROM Users WHERE UserType = 'User'";
            //DataSet myData = db.GetDataSet(sql);


            int size = myData.Tables[0].Rows.Count;

            if (size > 0)
            {
                for (int i = 0; i < size; i++)
                {
                    programList.Add(pxy.GetAllProgram(myData, i));
                }
                gvManagePrograms.DataSource = programList;
                gvManagePrograms.DataBind();
            }
            else
            {
                Response.Write("<script>alert('No Users Found') </script>");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < gvManagePrograms.Rows.Count; i++)
            {
                CheckBox cb;
                cb = (CheckBox)gvManagePrograms.Rows[i].FindControl("cbSelect");

                if (cb.Checked)
                {
                    SqlCommand sqlCommand5 = new SqlCommand();

                    String programName = gvManagePrograms.Rows[i].Cells[2].Text;

                    sqlCommand5.CommandType = CommandType.StoredProcedure;
                    sqlCommand5.CommandText = "TP_DeleteFromPrograms";


                    SqlParameter program = new SqlParameter("@Name", programName);
                    program.Direction = ParameterDirection.Input;
                    sqlCommand5.Parameters.Add(program);

                    db.DoUpdateUsingCmdObj(sqlCommand5);

                    ShowUsers();
                }
            }
        }
    }
}