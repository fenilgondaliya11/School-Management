using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    DataTable dt;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["userrole"] == null)
        {
            Response.Redirect("loginPage.aspx");
        }
        else
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
            AllCount();
            displayStaffData();
            displayNotificationData();
            displayStudentData();

            String userrole = Session["userrole"].ToString();
            if(userrole == "Staff" || userrole == "Student")
            {
                deshboardStaff.Visible = false;
                deshboardStudent.Visible = false;
            }
        }
    }


    /* ================================================= TOP 5 NOTIFICATION RECORD IN GRIDVIEW IN DASHBORD ================================================= */
    private void displayNotificationData()
    {
        con.Open();
        String displayDataQuery = "SELECT TOP 5 NId AS ID,NDate AS Date, NTitle AS Title, NDescription AS Description FROM NotificationTB WHERE remove_status='0'";
        cmd = new SqlCommand(displayDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        notificationDATA.DataSource = dt;
        notificationDATA.DataBind();
        con.Close();
    }

    /* ================================================= TOP 5 STAFF RECORD IN GRIDVIEW IN DASHBORD ================================================= */
    private void displayStaffData()
    {
        con.Open();
        String displayDataQuery = "SELECT top 5 EId AS ID, EName AS Name,EEmail AS EmailID,EMobile AS Mobile, ECourse AS Course, roles AS Role FROM StaffTB WHERE remove_status='0'";
        cmd = new SqlCommand(displayDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        StaffDATA.DataSource = dt;
        StaffDATA.DataBind();
        con.Close();
    }

    /* ================================================= TOP 5 STUDENT RECORD IN GRIDVIEW IN DASHBORD ================================================= */
    private void displayStudentData()
    {
        con.Open();
        String displayDataQuery = "SELECT TOP 5 SRNo AS ID, SName AS Name, SEmail AS EmailID, SCourse AS Course, SMobile AS Mobile, SDOB AS DOB FROM StudentTB WHERE remove_status='0'";
        cmd = new SqlCommand(displayDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        StudentDATA.DataSource = dt;
        StudentDATA.DataBind();
        con.Close();
    }

    /* ================================================= ALL STAFF STUDENT AND NOTIFICATION RECOND COUNT METHOD ================================================= */
    private void AllCount()
    {
        con.Open();
        String stuCountQuery = "SELECT count(*) FROM StudentTB WHERE remove_status='0'";
        cmd = new SqlCommand(stuCountQuery, con);
        int CStuNo = (int)cmd.ExecuteScalar();
        StuNO.InnerText = CStuNo.ToString();


        String stfCountQuery = "SELECT count(*) FROM StaffTB WHERE remove_status='0'";
        cmd = new SqlCommand(stfCountQuery, con);
        int CStfNo = (int)cmd.ExecuteScalar();
        StaNo.InnerText = CStfNo.ToString();


        String notiCountQuery = "SELECT count(*) FROM NotificationTB WHERE remove_status='0'";
        cmd = new SqlCommand(notiCountQuery, con);
        int CNotNo = (int)cmd.ExecuteScalar();
        NotiNO.InnerText = CNotNo.ToString();
        con.Close();
    }
}