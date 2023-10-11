using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class profilePage : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    SqlDataReader dr;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["username"] == null || Session["userrole"] == null)
        {
            Response.Redirect("loginPage.aspx");
        }
        else
        {
            con = new SqlConnection(WebConfigurationManager.ConnectionStrings["conn"].ToString());
            String Username = Session["username"].ToString();
            String Userrole = Session["userrole"].ToString();

            ProfileUserName.InnerText = Username;

            con.Open();

            if (Userrole == "Admin")
            {
                fetchData(Username);
                UserImage.ImageUrl = "~/images/logo/admin.png";
            }
            else if(Userrole == "Staff")
            {
                fetchData(Username);
                UserImage.ImageUrl = "~/images/logo/staff.png";
            }
            else
            {
                // Set The Images
                UserImage.ImageUrl = "~/images/logo/student.png";

                String fetchData = "SELECT * FROM StudentTB WHERE SName='" + Username + "' AND remove_status='0'";
                cmd = new SqlCommand(fetchData, con);
                dr = cmd.ExecuteReader();
                dr.Read();

                ProfileCourse.InnerText = "Course : " + dr["SCourse"].ToString();
                ProfileRole.InnerText = "Date Of Birth : " + dr["SDOB"].ToString();
                UserEmailID.InnerText = dr["SEmail"].ToString();
                UserMobile.InnerText = dr["SMobile"].ToString();
            }
        }
    }

    private void fetchData(string username)
    {
        String fetchData = "SELECT * FROM StaffTB WHERE EName='" + username + "' AND remove_status='0'";
        cmd = new SqlCommand(fetchData, con);
        dr = cmd.ExecuteReader();
        dr.Read();

        ProfileCourse.InnerText = "Course : " + dr["ECourse"].ToString();
        ProfileRole.InnerText = "Role : " + dr["roles"].ToString();
        UserEmailID.InnerText = dr["EEmail"].ToString();
        UserMobile.InnerText = dr["EMobile"].ToString();
    }
}