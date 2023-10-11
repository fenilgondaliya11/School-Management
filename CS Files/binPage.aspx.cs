using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class binPage : System.Web.UI.Page
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
            String userrole = Session["userrole"].ToString();
            if(userrole == "Staff" || userrole == "Student")
            {
                Response.Redirect("404Page.aspx");
            }
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
            binGridview.Visible = false;
        }
    }

    /* ================================================= SEARCH BUTTON CLICK EVENT ================================================= */
    protected void searchbtn_Click(object sender, EventArgs e)
    {
        if (searchName.Text == "StaffTB")
        {
            tableName.InnerText = "Staff Remove Records";
            displayStaffDATA();
            binGridview.Visible = true;
        }
        else if(searchName.Text == "StudentTB")
        {
            tableName.InnerText = "Student Remove Records";
            displayStudentDATA();
            binGridview.Visible = true;
        }
        else if(searchName.Text == "NotificationTB")
        {
            tableName.InnerText = "Notification Remove Records";
            displayNotificationDATA();
            binGridview.Visible = true;
        }
        else if(searchName.Text == "FeesTB")
        {
            tableName.InnerText = "Fees Remove Records";
            displayFeesDATA();
            binGridview.Visible = true;
        }
        else if(searchName.Text == "ResultTB")
        {
            tableName.InnerText = "Result Remove Records";
            displayResultDATA();
            binGridview.Visible = true;
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
    }

    /* ================================================= DISPLAY STAFF IN REMOVE RECORD ================================================= */
    private void displayStaffDATA()
    {
        con.Open();
        String removeDataQuery = "SELECT EId AS ID, EName AS NAME, ECourse AS Course, roles AS Roles , EEmail AS Emailid, EMobile AS Mobile FROM StaffTB WHERE remove_status='1'";
        cmd = new SqlCommand(removeDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        RemoveDATA.DataSource = dt;
        RemoveDATA.DataBind();
        con.Close();
    }

    /* ================================================= DISPLAY STUDENT IN REMOVE RECORD ================================================= */
    private void displayStudentDATA()
    {
        con.Open();
        String removeDataQuery = "SELECT SId AS ID, SName AS NAME, SCourse AS Course, SEmail AS Emailid, SMobile AS Mobile, SDOB AS DOB, SCourse AS Course FROM StudentTB WHERE remove_status='1'";
        cmd = new SqlCommand(removeDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        RemoveDATA.DataSource = dt;
        RemoveDATA.DataBind();
        con.Close();
    }

    /* ================================================= DISPLAY NOTIFICATION IN REMOVE RECORD ================================================= */
    private void displayNotificationDATA()
    {
        con.Open();
        String removeDataQuery = "SELECT NId AS ID, NDate AS Date, NTitle AS Title, NDescription AS Description FROM NotificationTB WHERE remove_status='1'";
        cmd = new SqlCommand(removeDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        RemoveDATA.DataSource = dt;
        RemoveDATA.DataBind();
        con.Close();
    }

    /* ================================================= DISPLAY FEES IN REMOVE RECORD ================================================= */
    private void displayFeesDATA()
    {
        con.Open();
        String removeDataQuery = "SELECT ST.SRNo AS ID, ST.SName AS Name, F.FDate AS Date, F.FMoney AS Money FROM StudentTB AS ST INNER JOIN FeesTB AS F ON ST.SRNo = F.SRNo WHERE F.remove_status = '1'";
        cmd = new SqlCommand(removeDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        RemoveDATA.DataSource = dt;
        RemoveDATA.DataBind();
        con.Close();
    }

    /* ================================================= DISPLAY RESULT IN REMOVE RECORD ================================================= */
    private void displayResultDATA()
    {
        con.Open();
        String removeDataQuery = "SELECT ST.SRNo AS ID, ST.SName AS Name, R.Total AS Total, R.Percentage AS Percentage, R.Grade AS Grade, R.Status AS Status FROM StudentTB AS ST INNER JOIN ResultTB AS R ON ST.SRNo = R.SRNo WHERE R.remove_status = '1'";
        cmd = new SqlCommand(removeDataQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        RemoveDATA.DataSource = dt;
        RemoveDATA.DataBind();
        con.Close();
    }



    /* ================================================= GRID VIEW RESTORE BUTTON CLICK EVENT ================================================= */
    protected void btnRestore_Click(object sender, EventArgs e)
    {
        if (searchName.Text == "StaffTB")
        {
            displayStaffDATA();
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int i = Convert.ToInt32(RemoveDATA.Rows[rowIndex].Cells[1].Text);
            String restoreQuery = "UPDATE StaffTB SET remove_status='0' WHERE EId='"+i+"' AND remove_status='1'";
            updateRestorData(restoreQuery);
            displayStaffDATA();
        }
        else if (searchName.Text == "StudentTB")
        {
            displayStudentDATA();
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int i = Convert.ToInt32(RemoveDATA.Rows[rowIndex].Cells[1].Text);
            String restoreQuery = "UPDATE StudentTB SET remove_status='0' WHERE SId='" + i + "' AND remove_status='1'";
            updateRestorData(restoreQuery);
            displayStudentDATA();
        }
        else if (searchName.Text == "NotificationTB")
        {
            displayNotificationDATA();
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int i = Convert.ToInt32(RemoveDATA.Rows[rowIndex].Cells[1].Text);
            String restoreQuery = "UPDATE NotificationTB SET remove_status='0' WHERE NId='" + i + "'  AND remove_status='1'";
            updateRestorData(restoreQuery);
            displayNotificationDATA();
        }
        else if (searchName.Text == "FeesTB")
        {
            displayFeesDATA();
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int i = Convert.ToInt32(RemoveDATA.Rows[rowIndex].Cells[1].Text);
            String restoreQuery = "UPDATE FeesTB SET remove_status='0' WHERE SRNo='" + i + "' AND remove_status='1'";
            updateRestorData(restoreQuery);
            displayFeesDATA();
        }
        else if (searchName.Text == "ResultTB")
        {
            displayResultDATA();
            int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
            int i = Convert.ToInt32(RemoveDATA.Rows[rowIndex].Cells[1].Text);
            String restoreQuery = "UPDATE ResultTB SET remove_status='0' WHERE SRNo='" + i + "' AND remove_status='1'";
            updateRestorData(restoreQuery);
            displayResultDATA();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }

    }

    /* ================================================= DATA UPDATE METHODS ================================================= */
    private void updateRestorData(string restoreQuery)
    {
        con.Open();
        cmd = new SqlCommand(restoreQuery, con);
        int res = cmd.ExecuteNonQuery();
        if(res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
        }
    }
}