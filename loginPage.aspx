<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/CS Files/loginPage.aspx.cs" Inherits="loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- basic -->
    <!-- site metas -->
    <title>School Management System</title>
    <!-- site icon -->
    <link rel="icon" type="image/png" href="images/logo/icon.png" />
    <!-- Font Awsomeicon Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    <!-- bootstrap css -->
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <!-- site css -->
    <link rel="stylesheet" href="css/style.css" />
    <!-- responsive css -->
    <link rel="stylesheet" href="css/responsive.css" />
    <!-- select bootstrap -->
    <link rel="stylesheet" href="css/bootstrap-select.css" />
    <!-- scrollbar css -->
    <link rel="stylesheet" href="css/perfect-scrollbar.css" />
    <!-- custom css -->
    <link rel="stylesheet" href="css/custom.css" />
</head>
<body class="inner_page login">
    <form id="form1" runat="server">
        <div class="full_container">
            <div class="container">
                <div class="center verticle_center full_height">

                    <!-- ================================================= LOGIN FORM START ================================================= -->
                    <div class="login_section">

                        <div class="logo_login">
                            <div class="center">
                                <img src="images/logo/icon.png" alt="School logo" />
                                <h1 class="text-white pl-2" style="font-size: 3rem;">Login Form</h1>
                            </div>
                        </div>

                        <div class="login_form">
                            <form>
                                <fieldset class="form">
                                    <div class="field">
                                        <label class="label_field">Role</label>
                                        <asp:DropDownList ID="loginRole" runat="server" CssClass="input">
                                            <asp:ListItem>-- Select Role --</asp:ListItem>
                                            <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                            <asp:ListItem Value="Staff">Staff</asp:ListItem>
                                            <asp:ListItem Value="Student">Student</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="field">
                                        <label class="label_field">Email ID</label>
                                        <asp:TextBox ID="loginEmail" runat="server" placeholder="Enter Your Email ID" CssClass="input" TextMode="Email"></asp:TextBox>
                                    </div>
                                    <div class="field">
                                        <label class="label_field">Password</label>
                                        <asp:TextBox ID="loginPassword" runat="server" placeholder="Enter Your Password" CssClass="input" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="field margin_0">
                                        <asp:Button ID="btnLogin" runat="server" Text="Sign In" OnClick="btnLogin_Click" CssClass="main_bt w-100" />
                                    </div>
                                </fieldset>
                            </form>
                        </div>

                    </div>
                    <!-- ================================================= LOGIN FORM END ================================================= -->

                </div>
            </div>
        </div>

        <div>
        </div>
    </form>
</body>
</html>
