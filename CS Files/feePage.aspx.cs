using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class feePages : System.Web.UI.Page
{
    SqlCommand cmd;
    SqlConnection con;
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
            String username = Session["username"].ToString();
            String userrole = Session["userrole"].ToString();

            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
            fetchFeesData();
            CurrentDate();
            newBox.Visible = false;


            StaffContainer.Visible = false;
            feesDetails.Visible = false;
            if(userrole == "Admin")
            {
                StaffContainer.Visible = true;
                feesDetails.Visible = true;
                StudentBox.Visible = false;
            }
            else if(userrole == "Staff")
            {
                Response.Redirect("404Page.aspx");
            }
            else if (userrole == "Student")
            {
                menuicon.Visible = false;
                getStudentFees(username);
            }
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

    /*  ================================================= STUDENT PANEL GET ROLL NUMBER ================================================= */
    private void getStudentFees(string username)
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

            /* ======================== STUDENT PAY THE MONEY IN DATABASE ======================== */
            String TFessQuery = "select FMoney from FeesTB where SRNo='" + SRNo + "' AND remove_status='0'";
            cmd = new SqlCommand(TFessQuery, con);
            int TF = (int)cmd.ExecuteScalar();
            payFees.InnerText = TF.ToString();
            
            int TEFees = 22500 - TF;
            emptyFees.InnerText = TEFees.ToString();

            int STD = 22500 - TEFees - 4500;
            STFees.InnerText = STD.ToString();

            int SDtotal = STD + 4500;
            SDFTotal.InnerText = SDtotal.ToString();
        }

    }

    /*  ================================================= CURRENT DATE ================================================= */
    private void CurrentDate()
    {
        DateTime t = DateTime.UtcNow.Date;
        EditDate.Text = t.ToString("dd/MM/yyyy");
        viewTDate.Text = t.ToString("dd/MM/yyyy");
    }

    /* ================================================= DISPLAY DATA IN GRIDVIEW IN DATABASE ================================================= */
    private void fetchFeesData()
    {
        con.Open();
        String displayQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SEmail, StudentTB.SCourse, FeesTB.FDate, FeesTB.FMoney, FeesTB.remove_status FROM StudentTB INNER JOIN FeesTB ON StudentTB.SRNo = FeesTB.SRNo WHERE (FeesTB.remove_status = '0')";
        cmd = new SqlCommand(displayQuery, con);
        dr = cmd.ExecuteReader();
        dt = new DataTable();
        dt.Load(dr);
        FeesDATA.DataSource = dt;
        FeesDATA.DataBind();
        con.Close();
    }

    /* ================================================= NEXT BUTTON CLICK EVENT ================================================= */
    protected void next_Click(object sender, EventArgs e)
    {
        if (EditRNo.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            con.Open();
            String fetchValue = "SELECT SRNo, SName, remove_status FROM StudentTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='0' ";
            cmd = new SqlCommand(fetchValue, con);
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                EditName.Text = dr["SName"].ToString();
                EditRNo.ReadOnly = true;
                EditNext.Enabled = false;
                EditReset.Enabled = true;
                EditFees.ReadOnly = false;
                saveFees.Enabled = true;
                con.Close();
                newBox.Visible = true;
            }
            else
            {
                EditRNo.Text = "";
                newBox.Visible = true;
                con.Close();
            }
        }
    }

    /* ================================================= RESET BUTTON CLICK EVENT ================================================= */
    protected void reset_Click(object sender, EventArgs e)
    {
        resetButton();
    }

    /* ================================================= RESET BUTTON METHOD ================================================= */
    private void resetButton()
    {
        EditRNo.Text = "";
        EditName.Text = "";
        EditRNo.ReadOnly = false;
        EditNext.Enabled = true;
        EditReset.Enabled = false;
        EditFees.ReadOnly = true;
        saveFees.Enabled = false;
    }

    /* ================================================= SAVE BUTTON CLICK EVENT ================================================= */
    protected void saveFees_Click(object sender, EventArgs e)
    {
        if(EditFees.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
            resetButton();
        }
        else
        {
            int Fees = Convert.ToInt32(EditFees.Text.ToString());

            /* ======================== CHECK THE FEES IN ROUND THE 22500 ======================== */
            if(Fees > 22500)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                resetButton();
            }
            else
            {
                con.Open();

                /* ======================== CHECK THE RECORD REMOVE AND IT RECORD IS UPDATE ======================== */
                String checkDeleteQuery = "SELECT FId, SRNo, remove_status FROM FeesTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='1'";
                cmd = new SqlCommand(checkDeleteQuery, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    dr.Close();

                    /* ======================== RECORD IS UPDATE ======================== */
                    String updateQuery = "UPDATE FeesTB SET FMoney='" + EditFees.Text + "', FDate='" + EditDate.Text + "', remove_status='0' WHERE SRNo='" + EditRNo.Text + "' AND remove_status='1'";
                    cmd = new SqlCommand(updateQuery, con);
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                        resetButton();
                        fetchFeesData();
                    }
                    else
                    {
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                        resetButton();
                        fetchFeesData();
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

                        /* ======================== CHECK THE ROLL NO RECORD IN FEES DATA TABLE ======================== */
                        String FcheckRNo = "SELECT SRNo,remove_status FROM FeesTB WHERE SRNo='" + EditRNo.Text + "' AND remove_status='0'";
                        cmd = new SqlCommand(FcheckRNo, con);
                        dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            con.Close();
                            resetButton();
                            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertReady()", true);
                            fetchFeesData();
                            dr.Close();
                        }
                        else
                        {
                            dr.Close();

                            /* ======================== RECORD INSERT IN FEES TABLE ======================== */
                            String saveQuery = "INSERT INTO FeesTB(SRNo,FMoney,FDate,remove_status) VALUES('" + EditRNo.Text + "','" + EditFees.Text + "','" + EditDate.Text + "','0')";
                            cmd = new SqlCommand(saveQuery, con);
                            int res = cmd.ExecuteNonQuery();
                            if (res > 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                                con.Close();
                                fetchFeesData();
                                resetButton();
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                                con.Close();
                                resetButton();
                                fetchFeesData();
                            }
                        }
                    }
                    else
                    {
                        con.Close();
                        resetButton();
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                        fetchFeesData();
                    }
                }
            }
        }
    }

    /* ================================================= GRID VIEW IN VIEW BUTTON CLICK EVENT ================================================= */
    protected void FeesDATA_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if(e.CommandName == "viewBtn")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "modelShow()", true);

            int i = Convert.ToInt32(e.CommandArgument.ToString());
            String Vname = FeesDATA.Rows[i].Cells[1].Text;
            String Vdate = FeesDATA.Rows[i].Cells[4].Text;
            String VFees = FeesDATA.Rows[i].Cells[5].Text;
            viewTitle.InnerText = Vname;
            viewDate.InnerText = Vdate;
            SVTModel.InnerText = VFees.ToString();

            int EFees = Convert.ToInt32(VFees.ToString()) - 4500;
            STVModel.InnerText = EFees.ToString();
        }
    }

    /* ================================================= GRID VIEW IN DELETE BUTTON CLICK EVENT ================================================= */
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(FeesDATA.Rows[rowIndex].Cells[0].Text);

        con.Open();
        String deleteQuery = "UPDATE FeesTB SET remove_status='1' WHERE SRNo='" + i + "' AND remove_status='0'";
        cmd = new SqlCommand(deleteQuery, con);
        int res = cmd.ExecuteNonQuery();
        if (res > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
            con.Close();
            fetchFeesData();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            con.Close();
            fetchFeesData();
        }
    }

    /* ================================================= VIEW DETAILS IN BUTTON CLICK EVENT ================================================= */
    protected void viewDetail_Click(object sender, EventArgs e)
    {
        feesDetails.Visible = true;
    }

    /* ================================================= GRID VIEW UPDATE BUTTON CLICK EVENT ================================================= */
    protected void GVBtnUpdate_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "random", "modelUShow()", true);
        newBox.Visible = false;

        int rowIndex = ((GridViewRow)(sender as Control).NamingContainer).RowIndex;
        int i = Convert.ToInt32(FeesDATA.Rows[rowIndex].Cells[0].Text);
        String GVName = FeesDATA.Rows[rowIndex].Cells[1].Text;
        int GVMoney = 22500 - Convert.ToInt32(FeesDATA.Rows[rowIndex].Cells[5].Text);

        viewID.Text = i.ToString();
        viewName.Text = GVName.ToString();
        viewMoney.Text = GVMoney.ToString();
        viewEmptyFees.Text = GVMoney.ToString();
    }

    /* ================================================= VIEW MODEL UPDATE BUTTON CLICK EVENT ================================================= */
    protected void btnViewUpdate_Click(object sender, EventArgs e)
    {
        if (viewID.Text == "" || viewName.Text == "" || viewTDate.Text == "" || viewMoney.Text == "")
        {
            ClientScript.RegisterStartupScript(this.GetType(), "random", "alertEmpty()", true);
        }
        else
        {
            if (Convert.ToInt32(viewMoney.Text) > Convert.ToInt32(viewEmptyFees.Text))
            {
                ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
            }
            else
            {
                con.Open();
                String getFeesQuery = "SELECT FMoney FROM FeesTB WHERE SRNo='" + viewID.Text + "' AND remove_status='0'";
                cmd = new SqlCommand(getFeesQuery, con);
                dr = cmd.ExecuteReader();
                if(dr.Read())
                {
                    int TotalUpdateFees = Convert.ToInt32(dr["FMoney"].ToString()) + Convert.ToInt32(viewMoney.Text);
                    dr.Close();

                    String updateQuery = "UPDATE FeesTB SET FMoney='" + TotalUpdateFees + "', FDate='" + viewTDate.Text + "' WHERE SRNo='" + viewID.Text + "' AND remove_status='0'";
                    cmd = new SqlCommand(updateQuery, con);
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertSuccess()", true);
                        con.Close();
                        fetchFeesData();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "random", "alertError()", true);
                        con.Close();
                        fetchFeesData();
                    }
                }
            }
            viewEmptyFees.Text = "";
            viewID.Text = "";
            viewName.Text = "";
            viewTDate.Text = "";
            viewMoney.Text = "";
        }
    }

}