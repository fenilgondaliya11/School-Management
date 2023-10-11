using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;

public partial class staffPage : System.Web.UI.Page
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
            newBox.Visible = false;

            if(userrole == "Staff" || userrole == "Student")
            {
                Response.Redirect("404Page.aspx");
            }
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
            FetchStaffData();
        }
    }

    /* ================================================= NEW STUDENT FORM SHOW NEW BUTTON CLICK EVENT ================================================= */
    protected void newBtn_Click(object sender, EventArgs e)
    {
        newBox.Visible = true;
    }

    /* ================================================= NEW STUDENT FORM SHOW CLOSE BUTTON CLICK EVENT ================================================= */
    protected void close_Click(object sender, EventArgs e)
    {
        newBox.Visible = false;
    }


    /*  ================================================= FETCH ALL STAFF GRID VIEW DATA ================================================= */
    private void FetchStaffData()
    {
        con.Open();
        String Gridviewstring = "select * from StaffTB where remove_status = '0'";
        cmd = new SqlCommand(Gridviewstring, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        StaffDATA.DataSource = dt;
        StaffDATA.DataBind();
        con.Close();
    }


    /*  ================================================= SAVE BUTTON CLICK EVENT ================================================= */
    protected void SaveStaff_Click(object sender, EventArgs e)
    {
        if (EditSName.Text == "" || EditSEmail.Text == "" || EditSMobile.Text == "" || EditSRoles.SelectedItem.Text == "" || EditSCourse.SelectedItem.Text == "" || EditSPassword.Text == "")
        {
            /* ALERTBOX CALL IN JAVASCRIPT */
            ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String CheckEmailQuery = "SELECT * FROM StaffTB WHERE EEmail='" + EditSEmail.Text + "'";
            cmd = new SqlCommand(CheckEmailQuery, con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dr.Close();
                Response.Write("<script>alert('"+EditSEmail.Text+" is All Ready Exists!!!');</script>");
            }
            else
            {
                dr.Close();
                String saveQuery = "INSERT INTO StaffTB(EName,ECourse,EEmail,EMobile,EPassword,roles,remove_status) VALUES('" + EditSName.Text + "','" + EditSCourse.SelectedItem.Text + "','" + EditSEmail.Text + "','" + EditSMobile.Text + "','" + EditSPassword.Text + "','" + EditSRoles.Text + "','0')";
                cmd = new SqlCommand(saveQuery, con);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    /* ALERTBOX CALL IN JAVASCRIPT */
                    con.Close();
                    FetchStaffData();
                    SendEmail();
                    ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertSuccess(),Hide()", true);
                }
                else
                {
                FetchStaffData();
                /* ALERTBOX CALL IN JAVASCRIPT */
                ClientScript.RegisterStartupScript(this.GetType(), "randomtext", "alertError(),Hide()", true);
                con.Close();
                FetchStaffData();
            }
            EditSName.Text = "";
                EditSCourse.Text = "";
                EditSEmail.Text = "";
                EditSMobile.Text = "";
                EditSPassword.Text = "";
                EditSRoles.Text = "";
            }
        }
    }

    /*  ================================================= EMAIL SEND METHOS ================================================= */
    private void SendEmail()
    {
        String mailBody = "<!DOCTYPE html>" +
                            "<html>" +
                            "<body>" +
                                "<img src='~/images/logo/icon.png' alt='School Logo'>" +
                                "<span style='font-size: 20px'>PATEL School In Ahemadabad</span>" +
                                "<hr>" +
                                "<h4>Welcome To '" + EditSName.Text + "'</h4>" +
                                "<h4>Your Name Is '" + EditSName.Text + "'</h4>" +
                                "<h4>Your EmailID / Username Is '" + EditSEmail.Text + "'</h4>" +
                                "<h4>Your Mobile Is '" + EditSMobile.Text + "'</h4>" +
                                "<h4>Your Role Is '" + EditSRoles.Text + "'</h4>" +
                                "<h4>Your Course Is '" + EditSCourse.Text + "'</h4>" +
                                "<h4>Your Password Is '" + EditSPassword.Text + "'</h4>" +
                            "</body>" +
                            "</html>";

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.Port = 587;
        smtp.Credentials = new System.Net.NetworkCredential("testlast54321@gmail.com", "TestLast#54321");
        smtp.EnableSsl = true;
        MailMessage msg = new MailMessage();
        msg.Subject = "New Staff Letter";
        msg.Body = mailBody;
        msg.IsBodyHtml = true;
        string toaddress = EditSEmail.Text;
        msg.To.Add(toaddress);
        String fromaddress = "Patel School <parthdhaduk2456@gmail.com>";
        msg.From = new MailAddress(fromaddress);
        try
        {
            smtp.Send(msg);
        }
        catch
        {
            throw;
        }
    }


    /*  ================================================= SEARCH BUTTON CLICK EVENT ================================================= */
    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        if (Searchtxt.Text == "")
        {
            FetchStaffData();
        }
        else
        {
            con.Open();
            String searchQuery = "SELECT * FROM StaffTB WHERE EName='"+Searchtxt.Text+"' OR EEmail = '"+Searchtxt.Text+"' OR ECourse='"+Searchtxt.Text+"' OR roles='"+Searchtxt.Text+"' AND remove_status='0'";
            cmd = new SqlCommand(searchQuery, con);
            dr = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            StaffDATA.DataSource = dt;
            StaffDATA.DataBind();
            Searchtxt.Text = "";
            con.Close();
        }
    }


    /*  ================================================= GRID VIEW DELETE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnDelete_Click(object sender, EventArgs e)
    {
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(StaffDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String deleteQuery = "UPDATE StaffTB SET remove_status='1' WHERE EId='" + i + "'";
        cmd = new SqlCommand(deleteQuery, con);
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
            FetchStaffData();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
            FetchStaffData();
        }
    }

    /* ================================================= GRID VIEW UPDATE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnUpdate_Click(object sender, EventArgs e)
    {
        newBox.Visible = false;
        ClientScript.RegisterStartupScript(this.GetType(), "random", "modelShow()", true);
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(StaffDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String updateQuery = "SELECT * FROM StaffTB WHERE EId='" + i + "' AND remove_status='0'";
        cmd = new SqlCommand(updateQuery, con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            viewID.Text = dr["EId"].ToString();
            viewName.Text = dr["EName"].ToString();
            viewEmail.Text = dr["EEmail"].ToString();
            viewRole.Text = dr["roles"].ToString();
            viewCourse.Text = dr["ECourse"].ToString();
            viewPassword.Text = dr["EPassword"].ToString();
            con.Close();
        }
    }

    /* ================================================= VIEW MODEL UPDATE BUTTON CLICK EVENT ================================================= */
    protected void btnViewUpdate_Click(object sender, EventArgs e)
    {
        if (viewID.Text == "" || viewName.Text == "" || viewEmail.Text == "" || viewRole.Text == "" || viewCourse.Text==""|| viewPassword.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String updateQuery = "UPDATE StaffTB SET EName='" + viewName.Text + "', EEmail='" + viewEmail.Text + "', ECourse='" + viewCourse.Text + "',roles='" + viewRole.Text + "', EPassword='" + viewPassword.Text + "' WHERE EId='" + viewID.Text + "' AND remove_status='0'";
            cmd = new SqlCommand(updateQuery, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                con.Close();
                FetchStaffData();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                con.Close();
                FetchStaffData();
            }
            viewName.Text = "";
            viewEmail.Text = "";
            viewRole.Text = "";
            viewCourse.Text = "";
            viewPassword.Text = "";
        }
    }
}