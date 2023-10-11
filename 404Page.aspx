<%@ Page Language="C#" AutoEventWireup="true" CodeFile="~/CS Files/404Page.aspx.cs" Inherits="_404Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <!-- basic -->
    <!-- site metas -->
    <title>404 Page</title>
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
</head>
<body class="inner_page error_404">
    <form id="form1" runat="server">
        <div class="full_container">
            <div class="container">
                <div class="center verticle_center full_height">
                    <div class="error_page">
                        <div class="center">
                            <div class="error_icon">
                                <img class="img-responsive" src="images/layout_img/error.png" alt="#">
                            </div>
                        </div>
                        <br>
                        <h3>PAGE NOT FOUND !</h3>
                        <p>YOU SEEM TO BE TRYING TO FIND HIS WAY HOME</p>
                        <div class="center">
                            <a class="main_bt" href="Default.aspx">Go To Home Page</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div>
        </div>
    </form>

    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- select country -->
    <script src="js/bootstrap-select.js"></script>
    <!-- Sweetalert JS -->
    <script src="js/sweetalert.min.js"></script>
    <!-- custom js -->
    <script src="js/custom.js"></script>
    <script>
            var ps = new PerfectScrollbar('#sidebar');
    </script>
</body>
</html>
