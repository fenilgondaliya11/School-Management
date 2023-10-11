using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class resultPage : System.Web.UI.Page
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
            FetchResultDATA();

            String username = Session["username"].ToString();
            String userrole = Session["userrole"].ToString();

            menuIcon.Visible = false;
            adminPanel.Visible = false;
            newBox.Visible = false;

            if (userrole == "Staff")
            {
                Response.Redirect("404Page.aspx");
            }
            else if(userrole == "Student")
            {
                getResult(username);
            }
            else if(userrole == "Admin")
            {
                menuIcon.Visible = true;
                StudentPanel.Visible = false;
                adminPanel.Visible = true;
            }
        }
    }

    /* ================================================= NEW RESULT FORM SHOW NEW BUTTON CLICK EVENT ================================================= */
    protected void newBtn_Click(object sender, EventArgs e)
    {
        newBox.Visible = true;
    }

    /* ================================================= NEW RESULT FORM SHOW CLOSE BUTTON CLICK EVENT ================================================= */
    protected void closeStudent_Click(object sender, EventArgs e)
    {
        newBox.Visible = false;
    }

    /* ================================================= STUDENT PANEL RESULT METHOD ================================================= */
    private void getResult(string username)
    {
        con.Open();

        /* ======================== GET THE STUDENT ROLL NO IN DATABASE ======================== */
        String getRnoQuery = "SELECT * FROM StudentTB WHERE SName='" + username + "' AND remove_status='0'";
        cmd = new SqlCommand(getRnoQuery, con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            String SRNo = dr["SRNo"].ToString();
            dr.Close();

            /* ======================== GET DATA STUDENT RESULT IN DATABASE ======================== */
            String TPresentQuery = "SELECT ST.SRNo, ST.SName, ST.SEmail, R.Total, R.Percentage, R.Grade, R.Status FROM StudentTB AS ST INNER JOIN ResultTB AS R ON ST.SRNo = R.SRNo WHERE R.SRNO='" + SRNo + "' AND R.remove_status = '0' ";
            cmd = new SqlCommand(TPresentQuery, con);
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                RSRNo.InnerText = SRNo.ToString();
                RSName.InnerText = dr["SName"].ToString();
                RSEmail.InnerText = dr["SEmail"].ToString();
                RSTotal.InnerText = dr["Total"].ToString();
                RSpercentage.InnerText = dr["Percentage"]+"%".ToString();
                RSGrade.InnerText = dr["Grade"].ToString();
                RSStatus.InnerText = dr["Status"].ToString();
            }            
        }
    }

    /*  ================================================= FETCH ALL RESULT GRID VIEW DATA ================================================= */
    private void FetchResultDATA()
    {
        con.Open();
        String fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SEmail, StudentTB.SCourse, ResultTB.Total, ResultTB.Percentage, ResultTB.Grade, ResultTB.Status, ResultTB.remove_status FROM StudentTB INNER JOIN ResultTB ON StudentTB.SRNo = ResultTB.SRNo WHERE (ResultTB.remove_status = '0')";
        cmd = new SqlCommand(fetchQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        ResultDATA.DataSource = dt;
        ResultDATA.DataBind();
        con.Close();
    }


    /*  ================================================= NEXT BUTTON CLICK EVENT ================================================= */
    protected void EditNext_Click(object sender, EventArgs e)
    {
        if (EditRNo.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "newShow()", true);
            con.Open();
            String fetchValue = "SELECT SRNo, SName, remove_status FROM StudentTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='0' " ;
            cmd = new SqlCommand(fetchValue, con);
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                EditName.Text = dr["SName"].ToString();
                EditRNo.ReadOnly = true;
                EditNext.Enabled = false;
                EditReset.Enabled = true;
                EditTotal.ReadOnly = false;
                SaveResult.Enabled = true;
            }
            else
            {
                EditRNo.Text = "";
            }
            con.Close();
        }
    }


    /*  ================================================= RESET BUTTON CLICK EVENT ================================================= */
    protected void EditReset_Click(object sender, EventArgs e)
    {
        resetButton();
    }

    /*  ================================================= RESET BUTTON METHOD ================================================= */
    private void resetButton()
    {
        EditRNo.Text = "";
        EditName.Text = "";
        EditRNo.ReadOnly = false;
        EditNext.Enabled = true;
        EditReset.Enabled = false;
        EditTotal.ReadOnly = true;
        SaveResult.Enabled = false;
    }


    /*  ================================================= SAVE BUTTON CLICK EVENT ================================================= */
    protected void SaveResult_Click(object sender, EventArgs e)
    {
        if(EditTotal.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            int SRNo = Convert.ToInt32(EditRNo.Text.ToString());
            int Total = Convert.ToInt32(EditTotal.Text.ToString());
            int Percentage = Total / 6;
            string Grade, Status;

            if(Percentage >= 100)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            }
            else
            {
                if(Percentage > 90)
                {
                    Grade = "A";
                    Status = "Pass";
                    insertResultRecord(SRNo,Total,Percentage,Grade,Status);
                }
                else if(Percentage > 80)
                {
                    Grade = "B";
                    Status = "Pass";
                    insertResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 70)
                {
                    Grade = "C";
                    Status = "Pass";
                    insertResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 60)
                {
                    Grade = "D";
                    Status = "Pass";
                    insertResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 50)
                {
                    Grade = "E";
                    Status = "Pass";
                    insertResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 37)
                {
                    Grade = "F";
                    Status = "Pass";
                    insertResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else 
                {
                    Grade = "-";
                    Status = "Fail";
                    insertResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
            }
        }
    }

    /*  ================================================= RECORD INSERT IN DATABASE ================================================= */
    private void insertResultRecord(int sRNo, int total, int percentage, string grade, string status)
    {
        con.Open();

        /* ======================== CHECK THE RECORD REMOVE AND IT RECORD IS UPDATE ======================== */
        String checkDeleteQuery = "SELECT RId, SRNo, remove_status FROM ResultTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='1'";
        cmd = new SqlCommand(checkDeleteQuery, con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            dr.Close();

            /* ======================== RECORD IS UPDATE ======================== */
            String updateQuery = "UPDATE ResultTB SET Total='" + total + "',Percentage='" + percentage + "',Grade='" + grade + "',Status='" + status + "', remove_status='0' WHERE SRNo='" + EditRNo.Text + "' AND remove_status='1'";
            cmd = new SqlCommand(updateQuery, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                resetButton();
                FetchResultDATA();
            }
            else
            {
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                resetButton();
                FetchResultDATA();
            }
        }
        else
        {
            dr.Close();

            /* ======================== CHECK THE ROLL NO RECORD IN STUDENT DATA TABLE ======================== */
            String checkRNo = "SELECT SRNo,remove_status FROM StudentTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='0'";
            cmd = new SqlCommand(checkRNo, con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dr.Close();

                /* ======================== CHECK THE ROLL NO RECORD IN RESULT DATA TABLE ======================== */
                String FcheckRNo = "SELECT SRNo,remove_status FROM ResultTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='0'";
                cmd = new SqlCommand(FcheckRNo, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    con.Close();
                    resetButton();
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertReady()", true);
                    FetchResultDATA();
                    dr.Close();
                }
                else
                {
                    dr.Close();

                    /* ======================== RECORD INSERT IN FEES TABLE ======================== */
                    String saveQuery = "INSERT INTO ResultTB(SRNo,Total,Percentage,Grade,Status,remove_status) VALUES('" + sRNo + "','" + total + "','" + percentage + "','" + grade + "','" + status + "','0')";
                    cmd = new SqlCommand(saveQuery, con);
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                        con.Close();
                        FetchResultDATA();
                        resetButton();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                        con.Close();
                        resetButton();
                        FetchResultDATA();
                    }
                }
            }
            else
            {
                con.Close();
                resetButton();
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                FetchResultDATA();
            }
        }
    }

    /*  ================================================= SEARCH BUTTON CLICK EVENT ================================================= */
    protected void searchbtn_Click(object sender, EventArgs e)
    {
        if (searchBox.Text == "")
        {
            FetchResultDATA();
        }
        else
        {
            con.Open();
            String SearchQuery = "SELECT ST.SRNo,ST.SName,ST.SEmail,R.Total,R.Percentage,R.Grade,R.Status FROM StudentTB AS ST JOIN ResultTB AS R ON ST.SRNo=R.SRNo WHERE ST.SName='"+searchBox.Text+"' OR ST.SEmail='"+searchBox.Text+"' OR R.Grade='"+searchBox.Text+"' OR R.Status='"+searchBox.Text+"' AND R.remove_status='0'";
            cmd = new SqlCommand(SearchQuery, con);
            dr = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            ResultDATA.DataSource = dt;
            ResultDATA.DataBind();
            con.Close();
        }
    }

    /*  ================================================= GRID VIEW DELETE BUTTON CLICK EVENT ================================================= */
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(ResultDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String deleteQuery = "UPDATE ResultTB SET remove_status='1' WHERE SRNo='" + i + "' AND remove_status='0'";
        cmd = new SqlCommand(deleteQuery, con);
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
            FetchResultDATA();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
            FetchResultDATA();
        }
    }

    /* ================================================= GRID VIEW UPDATE BUTTON CLICK EVENT ================================================= */
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        newBox.Visible = false;
        ClientScript.RegisterStartupScript(this.GetType(), "random", "modelShow()", true);

        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(ResultDATA.Rows[rowIndex].Cells[0].Text);
        String GVName = ResultDATA.Rows[rowIndex].Cells[1].Text;
        int GVTotal = Convert.ToInt32(ResultDATA.Rows[rowIndex].Cells[4].Text);

        viewRno.Text = i.ToString();
        viewName.Text = GVName.ToString();
        viewTotal.Text = GVTotal.ToString();
    }

    /* ================================================= VIEW MODEL UPDATE BUTTON CLICK EVENT ================================================= */
    protected void btnViewUpdate_Click(object sender, EventArgs e)
    {
        if (viewRno.Text == "" || viewName.Text == "" || viewTotal.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            int SRNo = Convert.ToInt32(viewRno.Text.ToString());
            int Total = Convert.ToInt32(viewTotal.Text.ToString());
            int Percentage = Total / 6;
            string Grade, Status;

            if (Percentage >= 100)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            }
            else
            {
                if (Percentage > 90)
                {
                    Grade = "A";
                    Status = "Pass";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 80)
                {
                    Grade = "B";
                    Status = "Pass";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 70)
                {
                    Grade = "C";
                    Status = "Pass";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 60)
                {
                    Grade = "D";
                    Status = "Pass";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 50)
                {
                    Grade = "E";
                    Status = "Pass";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else if (Percentage > 37)
                {
                    Grade = "F";
                    Status = "Pass";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
                else
                {
                    Grade = "-";
                    Status = "Fail";
                    updateResultRecord(SRNo, Total, Percentage, Grade, Status);
                }
            }
        }
    }

    /* ================================================= UPDATE RECORD METHOD ================================================= */
    private void updateResultRecord(int sRNo, int total, int percentage, string grade, string status)
    {
        con.Open();
        String updateQuery = "UPDATE ResultTB SET Total='" + total + "', Percentage='" + percentage + "', Grade='" + grade + "',Status='" + status + "' WHERE SRNo='" + sRNo + "' AND remove_status='0'";
        cmd = new SqlCommand(updateQuery, con);
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
            FetchResultDATA();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
            FetchResultDATA();
        }
        viewRno.Text = "";
        viewName.Text = "";
        viewTotal.Text = "";
    }
}