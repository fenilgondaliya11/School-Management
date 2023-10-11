using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net;
using System.Net.Mail;

public partial class studentPage : System.Web.UI.Page
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
            FetchSDisplayData();

            String userrole = Session["userrole"].ToString();
            newBox.Visible = false;
            getRollno();

            if(userrole=="Staff")
            {
                menuIcon.Visible = false;
                StudentDATA.Columns[6].Visible = false;
                StudentDATA.Columns[7].Visible = false;
            }
            else if(userrole == "Student")
            {
                Response.Redirect("404Page.aspx");
            }
        }
    }

    /* ================================================= GET THE ROLL NO IN NEXT ROLL NO ================================================= */
    private void getRollno()
    {
        con.Open();
        String getRollNo = "SELECT SRNo FROM StudentTB ORDER BY SRNo DESC";
        cmd = new SqlCommand(getRollNo, con);
        dr = cmd.ExecuteReader();
        dr.Read();
        int grno = Convert.ToInt32(dr["SRNo"].ToString()) + 1;
        EditRNo.Text = grno.ToString();
        dr.Close();
        con.Close();
    }

    /* ================================================= Edit Roll No BUTTON CLICK EVENT ================================================= */
    protected void EditRnoBox_Click(object sender, EventArgs e)
    {
        if(EditRNo.ReadOnly == true)
        {
            EditRNo.ReadOnly = false;
        }
        else
        {
            EditRNo.ReadOnly = true;
        }
        newBox.Visible = true;
    }

    /* ================================================= NEW STUDENT FORM SHOW NEW BUTTON CLICK EVENT ================================================= */
    protected void newBtn_Click(object sender, EventArgs e)
    {
        newBox.Visible = true;
    }

    /* ================================================= NEW STUDENT FORM SHOW CLOSE BUTTON CLICK EVENT ================================================= */
    protected void closeStudent_Click(object sender, EventArgs e)
    {
        newBox.Visible=false;
    }

    /* ================================================= DISPLAY DATA IN GRID VIWE DATA ================================================= */
    private void FetchSDisplayData()
    {
        con.Open();
        String SDisplay = "SELECT * from StudentTB WHERE remove_status='0'";
        cmd = new SqlCommand(SDisplay, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        StudentDATA.DataSource = dt;
        StudentDATA.DataBind();
        dr.Close();
        con.Close();
    }

    /* ================================================= SAVE STUDENT RECORD IN DATABASE ================================================= */
    protected void saveStudent_Click(object sender, EventArgs e)
    {
        if (EditRNo.Text=="" || EditSName.Text == "" || EditSEmail.Text == "" || EditSMobile.Text == "" || EditSDOB.Text == "" || EditSPassword.Text=="")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String checkDeleteQuery = "SELECT SRNo,remove_status FROM StudentTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='1'";
            cmd = new SqlCommand(checkDeleteQuery, con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                dr.Close();
                String updateQuery = "UPDATE StudentTB SET SName='" + EditSName.Text + "',SEmail='" + EditSEmail.Text + "',SMobile='" + EditSMobile.Text + "',SDOB='" + EditSDOB.Text + "',SCourse='" + EditSCourse.Text + "',SPassword='" + EditSPassword.Text + "',remove_status='0' WHERE SRNo='" + EditRNo.Text + "' AND remove_status='1'";
                cmd = new SqlCommand(updateQuery, con);
                int res = cmd.ExecuteNonQuery();
                if (res > 0)
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                    FetchSDisplayData();
                }
                else
                {
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                    FetchSDisplayData();
                }
            }
            else
            {
                dr.Close();
                String checkRNo = "SELECT SRNo,remove_status FROM StudentTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='0'";
                cmd = new SqlCommand(checkRNo, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    con.Close();
                    EditRNo.Text = "";
                    EditSName.Text = "";
                    EditSEmail.Text = "";
                    EditSMobile.Text = "";
                    EditSDOB.Text = "";
                    EditSCourse.Text = "";
                    ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                    FetchSDisplayData();
                }
                else
                {
                    dr.Close();

                    String saveQuery = "INSERT INTO StudentTB(SRNo,SName,SEmail,SMobile,SDOB,SCourse,SPassword,remove_status) VALUES('" + EditRNo.Text + "','" + EditSName.Text + "','" + EditSEmail.Text + "','" + EditSMobile.Text + "','" + EditSDOB.Text + "','" + EditSCourse.Text + "','" + EditSPassword.Text + "','0')";
                    cmd = new SqlCommand(saveQuery, con);
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        con.Close();
                        SendEmail();
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                        FetchSDisplayData();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                        con.Close();
                        FetchSDisplayData();
                    }
                    EditRNo.Text = "";
                    EditSName.Text = "";
                    EditSEmail.Text = "";
                    EditSMobile.Text = "";
                    EditSDOB.Text = "";
                    EditSCourse.Text = "";
                }
            }
        }
    }

    /*  ================================================= EMAIL SEND METHOS ================================================= */
    private void SendEmail()
    {
        String mailBody = "<!DOCTYPE html>" +
                            "<html>" +
                            "<body>" +
                                "<img src='../images/logo/icon.png' alt='School Logo'>" +
                                "<span style='font-size: 20px'>PATEL School In Ahemadabad</span>" +
                                "<hr>" +
                                "<h4>Welcome To '" + EditSName.Text + "'</h4>" +
                                "<h4>Your Name Is '" + EditSName.Text + "'</h4>" +
                                "<h4>Your EmailID / Username Is '" + EditSEmail.Text + "'</h4>" +
                                "<h4>Your Mobile Is '" + EditSMobile.Text + "'</h4>" +
                                "<h4>Your Role Is 'Student'</h4>" +
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
        msg.Subject = "New Student Letter";
        msg.Body = mailBody;
        msg.IsBodyHtml = true;
        string toaddress = EditSEmail.Text;
        msg.To.Add(toaddress);
        String fromaddress = "Patel School <f@gmail.com>";
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

    /* ================================================= SEARCH BUTTON CLICK EVENT ================================================= */
    protected void searchbtn_Click(object sender, EventArgs e)
    {
        if (searchName.Text == "")
        {
            FetchSDisplayData();
        }
        else
        {
            con.Open();
            String searchQuery = "SELECT * FROM StudentTB WHERE SName='" + searchName.Text + "' OR SEmail='" + searchName.Text + "' OR SCourse='" + searchName.Text + "' AND remove_status='0'";
            cmd = new SqlCommand(searchQuery, con);
            dr = cmd.ExecuteReader();
            dt = new DataTable();
            dt.Load(dr);
            StudentDATA.DataSource = dt;
            StudentDATA.DataBind();
            searchName.Text = "";
            con.Close();
        }
    }

    /* ================================================= GRID VIEW DELETE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnDelete_Click(object sender, EventArgs e)
    {
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(StudentDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String deleteQuery = "UPDATE StudentTB SET remove_status='1' WHERE SRNo='" + i + "'";
        cmd = new SqlCommand(deleteQuery, con);
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
            FetchSDisplayData();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
            FetchSDisplayData();
        }
    }

    /* ================================================= GRID VIEW UPDATE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnUpdate_Click(object sender, EventArgs e)
    {
        newBox.Visible = false;
        ClientScript.RegisterStartupScript(this.GetType(), "random", "modelShow()", true);
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(StudentDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String updateQuery = "SELECT * FROM StudentTB WHERE SRNo='" + i + "' AND remove_status='0'";
        cmd = new SqlCommand(updateQuery, con);
        dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            viewRno.Text = dr["SRNo"].ToString();
            viewName.Text = dr["SName"].ToString();
            viewEmail.Text = dr["SEmail"].ToString();
            viewDOB.Text = dr["SDOB"].ToString();
            viewPassword.Text = dr["SPassword"].ToString();
            con.Close();
        }
    }

    /* ================================================= VIEW MODEL UPDATE BUTTON CLICK EVENT ================================================= */
    protected void btnViewUpdate_Click(object sender, EventArgs e)
    {
        if (viewRno.Text == "" || viewName.Text == "" || viewEmail.Text == "" || viewDOB.Text == "" || viewPassword.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String updateQuery = "UPDATE StudentTB SET SName='" + viewName.Text + "', SEmail='" + viewEmail.Text + "', SDOB='" + viewDOB.Text + "',SPassword='" + viewPassword.Text + "' WHERE SRNo='" + viewRno.Text + "' AND remove_status='0'";
            cmd = new SqlCommand(updateQuery, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                viewName.Text = "";
                viewEmail.Text = "";
                viewDOB.Text = "";
                viewPassword.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                con.Close();
                FetchSDisplayData();
            }
            else
            {
                viewName.Text = "";
                viewEmail.Text = "";
                viewDOB.Text = "";
                viewPassword.Text = "";
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                con.Close();
                FetchSDisplayData();
            }
        }
    }

}