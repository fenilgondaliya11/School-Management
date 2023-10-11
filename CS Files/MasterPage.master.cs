using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        setUsername.InnerText = Session["username"].ToString();
        boxUsername.InnerText = Session["username"].ToString();
        String userrole = Session["userrole"].ToString();

        setUserrole.InnerText = userrole;


        if(userrole == "Admin")
        {
            UserLogo.ImageUrl = "~/images/logo/admin.png";
            BoxUserLogo.ImageUrl = "~/images/logo/admin.png";
        }
        else if(userrole == "Staff")
        {
            UserLogo.ImageUrl = "~/images/logo/staff.png";
            BoxUserLogo.ImageUrl = "~/images/logo/staff.png";

            /* ======================== HIDE THE MENU ======================== */
            staffMenu.Visible = false;
            feesMenu.Visible = false;
            resultMenu.Visible = false;
            binMenu.Visible = false;
        }
        else if(userrole == "Student")
        {
            UserLogo.ImageUrl = "~/images/logo/student.png";
            BoxUserLogo.ImageUrl = "~/images/logo/student.png";

            /* ======================== HIDE THE MENU ======================== */
            staffMenu.Visible = false;
            studentMenu.Visible = false;
            binMenu.Visible = false;
        }
    }

    /* ================================================= PROFILE BUTTON CLICK EVENT ================================================= */
    protected void BtnProfile_Click(object sender, EventArgs e)
    {
        Response.Redirect("profilePage.aspx");
    }
    
    /* ================================================= LOGOUT BUTTON CLICK EVENT ================================================= */
    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("loginPage.aspx");
    }
}
