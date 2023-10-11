using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class loginPage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
    }

    /* ================================================= LOGIN BUTTON CLICK EVENT ================================================= */
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        con.Open();
        if(loginRole.Text=="" || loginEmail.Text=="" || loginPassword.Text=="")
        {
            Response.Write("<script>alert('Please Enter Values In Fills');</script>");
        }
        else
        {
            if (loginRole.Text == "Staff")
            {
                String checkLoginQuery = "SELECT * FROM StaffTB WHERE EEmail='" + loginEmail.Text + "' AND EPassword='" + loginPassword.Text + "' AND roles = 'Staff' AND remove_status='0'";
                cmd = new SqlCommand(checkLoginQuery, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    String username = dr["EName"].ToString();
                    Session["username"] = username;
                    Session["userrole"] = "Staff";
                    Response.Redirect("Default.aspx");
                    loginRole.Text = "";
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Please! Current Username And Password???');</script>");
                    loginRole.Text = "";
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                    con.Close();
                }
            }
            else if(loginRole.Text == "Student")
            {
                String checkLoginQuery = "SELECT * FROM StudentTB WHERE SEmail='" + loginEmail.Text + "' AND SPassword='" + loginPassword.Text + "' AND remove_status='0'";
                cmd = new SqlCommand(checkLoginQuery, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    String username = dr["SName"].ToString();
                    Session["username"] = username;
                    Session["userrole"] = "Student";
                    Response.Redirect("Default.aspx");
                    loginRole.Text = "";
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Please! Current Username And Password???');</script>");
                    loginRole.Text = "";
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                    con.Close();
                }
            }
            else if(loginRole.Text == "Admin")
            {
                String checkLoginQuery = "SELECT * FROM StaffTB WHERE EEmail='" + loginEmail.Text + "' AND EPassword='" + loginPassword.Text + "' AND roles = 'Admin' AND remove_status='0'";
                cmd = new SqlCommand(checkLoginQuery, con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    String username = dr["EName"].ToString();
                    Session["username"] = username;
                    Session["userrole"] = "Admin";
                    Response.Redirect("Default.aspx");
                    loginRole.Text = "";
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                    con.Close();
                }
                else
                {
                    Response.Write("<script>alert('Please! Current Username And Password???');</script>");
                    loginRole.Text = "";
                    loginEmail.Text = "";
                    loginPassword.Text = "";
                    con.Close();
                }
            }
            else
            {
                loginRole.Text = "";
                loginEmail.Text = "";
                loginPassword.Text = "";
                con.Close();
                Response.Write("<script>alert('Please! Enter The Current Value In Fills...');</script>");
            }
        }
    }
    
}