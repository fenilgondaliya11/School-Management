using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class attendancePage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;
    DataTable dt;
    DateTime t;
    String CurrentDate, username, userrole;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["userrole"] == null)
        {
            Response.Redirect("loginPage.aspx");
        }
        else
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
            t = DateTime.UtcNow.Date;
            CurrentDate = t.ToString("dd/MM/yyyy");
            SearchCurrentDate.Text = CurrentDate;
            SearchBoxDate.Text = CurrentDate;
            username = Session["username"].ToString();
            userrole = Session["userrole"].ToString();


            newAttendanceBox.Visible = false;
            AttendanceGridview.Visible = false;
            StudentPanel.Visible = false;
            DisplayAllStudentRecord.Visible = false;
            DisplayStartDate.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");
            DisplayEndDate.Attributes["max"] = DateTime.Now.ToString("yyyy-MM-dd");

            if (userrole == "Staff" || userrole == "Admin")
            {
                StaffPanel.Visible = true;
            }
            else if(userrole == "Student")
            {
                STotalAttendece(username);
                StudentPanel.Visible = true;
                menuIcon.Visible = false;
                DisplayAllStudent.Columns[5].Visible = false;
                studCourse.Visible = false;
            }
        }

       
        
    }

    /* ================================================= DISPLAY ATTENDANCE STUDENT FORM OPEN ================================================= */
    protected void newBtn_Click(object sender, EventArgs e)
    {
        newAttendanceBox.Visible = true;
        AllSearchRecordBox.Visible = false;
    }

    /* ================================================= DISPLAY ATTENDANCE STUDENT FORM CLOSE ================================================= */
    protected void newFormClose_Click(object sender, EventArgs e)
    {
        newAttendanceBox.Visible = false;
        AllSearchRecordBox.Visible = true;
    }

    /* ================================================= STUDENT DATA DISPLAY IN GRID VIEW METHOD ================================================= */
    private void FetchAttendanceData()
    {
        con.Open();
        String fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SEmail, AttendanceTB.ADate, AttendanceTB.AAttendance, AttendanceTB.remove_status FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE (StudentTB.remove_status = '0')";
        cmd = new SqlCommand(fetchQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        AttendanceDATA.DataSource = dt;
        AttendanceDATA.DataBind();
        con.Close();
    }

    /* ================================================= STUDENT TOTAL ATTENDECE METHOD ================================================= */
    private void STotalAttendece(string username)
    {
        con.Open();

        /* ======================== GET THE STUDENT ROLL NO IN DATABASE ======================== */
        String getRnoQuery = "SELECT * FROM StudentTB WHERE SName='" + username + "' AND remove_status='0'";
        cmd = new SqlCommand(getRnoQuery, con);
        dr = cmd.ExecuteReader();
        if(dr.Read())
        {
            String SRNo = dr["SRNo"].ToString();
            dr.Close();

            /* ======================== GET THE STUDENT PRESENT IN DATABASE ======================== */
            String TPresentQuery = "SELECT COUNT(SRNo) FROM AttendanceTB WHERE SRNo='" + SRNo + "' AND AAttendance='Present'";
            cmd = new SqlCommand(TPresentQuery, con);
            int TP = (int)cmd.ExecuteScalar();
            TotalPresent.InnerText = TP.ToString();
            

            /* ======================== GET THE STUDENT ABSENT IN DATABASE ======================== */
            String TAbsentQuery = "SELECT COUNT(SRNo) FROM AttendanceTB WHERE SRNo='" + SRNo + "' AND AAttendance='Absent'";
            cmd = new SqlCommand(TAbsentQuery, con);
            int TA = (int)cmd.ExecuteScalar();
            TotalAbsent.InnerText = TA.ToString();

            /* ======================== GET THE STUDENT LEAVE IN DATABASE ======================== */
            String TLeaveQuery = "SELECT COUNT(SRNo) FROM AttendanceTB WHERE SRNo='" + SRNo + "' AND AAttendance='Leave'";
            cmd = new SqlCommand(TLeaveQuery, con);
            int TL = (int)cmd.ExecuteScalar();
            TotalLeave.InnerText = TL.ToString();
        }
        con.Close();
    }

    /* ================================================= SEARCH BUTTON CLICK EVENT ================================================= */
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        if (SearchCourse.Text == "" || SearchCurrentDate.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            AllSearchRecordBox.Visible = true;
            con.Open();
            String searchQuery = "SELECT * FROM StudentTB WHERE SCourse like '" + SearchCourse.Text + "' AND remove_status='0'";
            cmd = new SqlCommand(searchQuery, con);
            dr = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            AttendanceDATA.DataSource = dt;
            AttendanceDATA.DataBind();
            AttendanceGridview.Visible = true;
            con.Close();
        }
    }

    /* ================================================= GRID VIEW SAVE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnSave_Click(object sender, EventArgs e)
    {
        foreach(GridViewRow row in AttendanceDATA.Rows)
        {
            int SRNo = Convert.ToInt32(row.Cells[0].Text);
            RadioButton RPresent = (row.Cells[3].FindControl("GVPresent") as RadioButton);
            RadioButton RAbsent = (row.Cells[3].FindControl("GVAbsent") as RadioButton);
            RadioButton RLeave = (row.Cells[3].FindControl("GVLeave") as RadioButton);

            if(RPresent.Checked)
            {
                String Attendence = "Present";
                InsertData(SRNo, CurrentDate, Attendence);
            }
            else if (RLeave.Checked)
            {
                String Attendence = "Leave";
                InsertData(SRNo, CurrentDate, Attendence);
            }
            else
            {
                String Attendence = "Absent";
                InsertData(SRNo, CurrentDate, Attendence);
            }
        }
    }

    /* ================================================= GRID VIEW SAVE BUTTON CLICK EVENT ================================================= */
    private void InsertData(int sRNo, string currentDate, string attendence)
    {
        if (sRNo.ToString() == null || currentDate == null || attendence == null)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();

            /* ======================== TODAY DATE CHECK SQL QUERY ======================== */
            String checkDataQuery = "select * from AttendanceTB where SRNo='" + sRNo + "' and ADate='" + currentDate + "' and remove_status='0'";
            cmd = new SqlCommand(checkDataQuery, con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dr.Close();

                /* ======================== CHECK THE ATTENDANCE SQL QUERY ======================== */
                String checkAttendance = "SELECT * FROM AttendanceTB WHERE SRNo='" + sRNo + "' AND ADate='" + currentDate + "' AND AAttendance='" + attendence + "' AND remove_status='0'";
                cmd = new SqlCommand(checkAttendance, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dr.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertReady()", true);
                    con.Close();
                }
                else
                {
                    dr.Close();

                    /* ======================== UPDATE THE ATTENDANCE SQL QUERY ======================== */
                    String updateQuery = "UPDATE AttendanceTB SET AAttendance='" + attendence + "' WHERE SRNo='" + sRNo + "' AND remove_status='0'";
                    cmd = new SqlCommand(updateQuery, con);
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                        con.Close();
                        FetchAttendanceData();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                        con.Close();
                        FetchAttendanceData();
                    }
                }
            }
            else
            {
                dr.Close();

                /* ======================== RECORD INSERT IN DATABASE SQL QUERY ======================== */
                String insertQuery = "insert into AttendanceTB(SRNo,ADate,AAttendance,remove_status) values('" + sRNo + "','" + currentDate + "','" + attendence + "','0')";
                cmd = new SqlCommand(insertQuery, con);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                }
                else
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                }
            }
        }
    }

    /* ================================================= SEARCH MONTH WISE RECORDS DISPLAY ================================================= */
    protected void DisplaySearchRecord_Click(object sender, EventArgs e)
    {
        String fetchQuery;
        if (DisplaySearchCourse.Text == "" || DisplayStartDate.Text == "" || DisplayEndDate.Text == "")
        {
            if (userrole == "Student")
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SName='" + username + "' AND StudentTB.remove_status='0'";
            }
            else
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SCourse='" + DisplaySearchCourse.Text + "' AND StudentTB.remove_status='0'";
            }
        }
        else
        {
            string StartDate = DateTime.Parse(DisplayStartDate.Text.Trim()).ToString("dd/MM/yyyy");
            string EndDate = DateTime.Parse(DisplayEndDate.Text.Trim()).ToString("dd/MM/yyyy");

            if (userrole == "Student")
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SName='" + username + "' AND ADate BETWEEN '" + StartDate + "' AND '" + EndDate + "' AND StudentTB.remove_status='0'";
            }
            else
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SCourse='" + DisplaySearchCourse.Text + "' AND ADate BETWEEN '" + StartDate + "' AND '" + EndDate + "' AND StudentTB.remove_status='0'";
            }
        }

        DisplayAllStudentRecord.Visible = true;
        con.Open();
        cmd = new SqlCommand(fetchQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        DisplayAllStudent.DataSource = dt;
        DisplayAllStudent.DataBind();
        con.Close();
        DisplayStartDate.Text = "";
        DisplayEndDate.Text = "";
    }

    /* ================================================= SEARCH RECORD IN ALL STUDENTS BOX ================================================= */
    protected void btnStudentSearch_Click(object sender, EventArgs e)
    {
        if(SearchStudentData.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            DisplayAllStudentRecord.Visible = true;
            con.Open();
            String fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE StudentTB.SName='" + SearchStudentData.Text + "' AND AttendanceTB.remove_status='0'";
            cmd = new SqlCommand(fetchQuery, con);
            dr = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            DisplayAllStudent.DataSource = dt;
            DisplayAllStudent.DataBind();
            con.Close();
            SearchStudentData.Text = "";
        }
    }

    /* ================================================= DISPLAY STUDENT RECORDS GRID VIEW UPDATE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnUpdate_Click(object sender, EventArgs e)
    {
        DisplayAllStudentRecord.Visible = true;
        ClientScript.RegisterStartupScript(this.GetType(), "random", "modelShow()", true);

        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(DisplayAllStudent.Rows[rowIndex].Cells[0].Text);
        String fetchdate = DisplayAllStudent.Rows[rowIndex].Cells[3].Text;

        con.Open();
        String updateQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE StudentTB.SRNo='" + i + "' AND AttendanceTB.ADate='" + fetchdate + "' AND AttendanceTB.remove_status='0'";
        cmd = new SqlCommand(updateQuery, con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            viewID.Text = dr["SRNo"].ToString();
            viewName.Text = dr["SName"].ToString();
            viewDate.Text = fetchdate.ToString();
            con.Close();
        }
    }

    /* ================================================= MODEL UPDATE BUTTON CLICK EVENT ================================================= */
    protected void btnViewUpdate_Click(object sender, EventArgs e)
    {
        if(viewID.Text == "" || viewName.Text == "" || viewDate.Text == "" || viewAttendance.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String updateQuery = "UPDATE AttendanceTB SET AAttendance='" + viewAttendance.Text + "' WHERE SRNo='" + viewID.Text + "' AND ADate='" + viewDate.Text + "' AND remove_status='0'";
            cmd = new SqlCommand(updateQuery, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                con.Close();

            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                con.Close();
            }
            viewID.Text = "";
            viewName.Text = "";
            viewDate.Text = "";
            viewAttendance.Text = "";
        }
    }
}
 