using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class notificationPage : System.Web.UI.Page
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

            DisplayNotification();
            CurrentDate();
            String userrole = Session["userrole"].ToString();
            if(userrole == "Staff" || userrole == "Student")
            {
                menuIcon.Visible = false;
                notificationDATA.Columns[5].Visible = false;
            }
        }
    }

    /*  ================================================= CURRENT DATE ================================================= */
    private void CurrentDate()
    {
        DateTime t = DateTime.UtcNow.Date;
        EditDate.Text = t.ToString("dd/MM/yyyy");
    }



    /*  ================================================= FETCH ALL NOTIFICATION IN GRID VIEW ================================================= */
    private void DisplayNotification()
    {
        con.Open();
        String DisplayQuery = "SELECT * FROM NotificationTB WHERE remove_status = '0' ORDER BY NId DESC";
        cmd = new SqlCommand(DisplayQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        notificationDATA.DataSource = dt;
        notificationDATA.DataBind();
        dr.Close();
        con.Close();
    }

    /*  ================================================= SAVE NOTIFICATION IN DATABASE ================================================= */
    protected void SaveNotification_Click(object sender, EventArgs e)
    {
        if (EditTitle.Text == "" || EditDate.Text == "" || EditDescription.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String saveQuery = "INSERT INTO NotificationTB(NTitle,NDate,NDescription,remove_status) VALUES('" + EditTitle.Text + "','" + EditDate.Text + "','" + EditDescription.Text + "','0')";
            cmd = new SqlCommand(saveQuery, con);
            int res = cmd.ExecuteNonQuery();
            if (res > 0)
            {
                EditTitle.Text = "";
                EditDate.Text = "";
                EditDescription.Text = "";
                CurrentDate();
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                con.Close();
                DisplayNotification();
            }
            else
            {
                EditTitle.Text = "";
                EditDate.Text = "";
                EditDescription.Text = "";
                CurrentDate();
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                con.Close();
                DisplayNotification();
            }
        }
    }

    /*  ================================================= GRID VIEW VIEW BUTTON CLICK EVENT ================================================= */
    protected void notificationDATA_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "viewBtn")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "modelShow()", true);

            int i = Convert.ToInt32(e.CommandArgument.ToString());
            String getID = notificationDATA.Rows[i].Cells[0].Text;

            con.Open();
            String getDataQuery = "SELECT * FROM NotificationTB WHERE NId = '" + getID + "' AND remove_status='0'";
            cmd = new SqlCommand(getDataQuery, con);
            dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                viewTitle.InnerText = dr["Ntitle"].ToString();
                viewDate.InnerText = dr["NDate"].ToString();
                viewBody.InnerText = dr["NDescription"].ToString();
            }
        }
    }

    /*  ================================================= GRID VIEW DELETE BUTTON CLICK EVENT ================================================= */
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(notificationDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String deleteQuery = "UPDATE NotificationTB SET remove_status='1' WHERE NId='" + i + "'";
        cmd = new SqlCommand(deleteQuery, con);
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
            DisplayNotification();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
            DisplayNotification();
        }
    }
}