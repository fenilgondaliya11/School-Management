<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/attendancePage.aspx.cs" Inherits="attendancePage" EnableEventValidation="false"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        .table tr td:last-child{
            position: relative;
            display: flex;
            justify-content: space-around;
            column-gap: 20px;
        }
        .DisplayRecord .table tr td:last-child{
            justify-content: flex-start;
        }
        .customeCheckbox{
            width: 20px;
            height: 20px;
            border: 2px solid black;
            background: #fff;
            position: absolute;
            left: 10px;
            top: 10px;
        }
        .searchbtn {
            margin-top: 2.5%;
        }
        input[type=radio]{
            width: 20px;
            height: 20px;
            position: relative;
        }
        .radioBtn:nth-child(1){
            accent-color: blue;
        }
        .radioBtn:nth-child(2){
            accent-color: red;
        }
        .radioBtn:nth-child(3){
            accent-color: green;
        }
        .radioBtn label{
            position: absolute;
            top: 10px;
            margin-left: 5px;
        }
        .circle h3{
            border-radius: 50%;
            color: white;
            width: 50px;
            height: 50px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .newFormClose{
            font-size: 16px;
            line-height: 30px;
            cursor: pointer;
        }
    </style>

    <div id="content">
        <div class="midde_cont">
            <div class="container-fluid">


                <!-- ================================================== TITLE BAR START ================================================== -->
                <div class="row column_title">
                    <div class="col-md-12">

                        <div class="page_title">
                            <h2>Attendance</h2>
                            <div class="menuicon" id="menuIcon" runat="server">
                                <img src="images/logo/menu.png" data-toggle="dropdown" />
                                <div class="dropdown-menu">
                                    <div class="menu_box w-100" id="newMenu" runat="server">
                                        <asp:LinkButton ID="newBtn" runat="server" Text="New" OnClick="newBtn_Click">
                                            <i class="fas fa-plus-circle"></i>
                                            <p>New</p>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- ================================================== TITLE BAR END ================================================== -->



                <!-- ================================================== FIRST BOX START ================================================== -->
                <div class="row" id="StaffPanel" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== NEW ATTENDANCE FORM SEARCH BAR START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="newAttendanceBox" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0 d-flex w-100 justify-content-between">
                                    <h2>New Students Attendance</h2>
                                    <asp:LinkButton ID="newFormClose" runat="server" CssClass="fas fa-x newFormClose" OnClick="newFormClose_Click"></asp:LinkButton>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="searchbar">
                                        <div class="course" style="width: 100%;">
                                            <label for="SearchCourse" class="col-form-label">Course</label>
                                            <asp:DropDownList ID="SearchCourse" runat="server" CssClass="selectCourse form-control w-100">
                                                <asp:ListItem Value="BCA">BCA</asp:ListItem>
                                                <asp:ListItem Value="BSC">BSC</asp:ListItem>
                                                <asp:ListItem Value="BSCIT">BSCIT</asp:ListItem>
                                                <asp:ListItem Value="B.COM">B.COM</asp:ListItem>
                                                <asp:ListItem Value="BBA">BBA</asp:ListItem>
                                                <asp:ListItem Value="BA">BA</asp:ListItem>
                                                <asp:ListItem Value="B.TECH">B.TECH</asp:ListItem>
                                                <asp:ListItem Value="MCA">MCA</asp:ListItem>
                                                <asp:ListItem Value="LLB">LLB</asp:ListItem>
                                                <asp:ListItem Value="BMS">BMS</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="course" style="width: 100%;">
                                            <label for="recipient-name" class="col-form-label">Today Date</label>
                                            <asp:TextBox ID="SearchCurrentDate" runat="server" CssClass="selectCourse form-control w-100" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="searchbtn">
                                            <asp:Button ID="SearchBtn" runat="server" CssClass="btn btn-primary" OnClick="SearchBtn_Click" OnClientClick="gridviewShow()" Text="Search" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== NEW ATTENDANCE FORM SEARCH BAR END ================================================== -->




                        <!-- ================================================== DISPLAY SEARCH BOX START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="AllSearchRecordBox" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Search Course</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="searchbar">
                                        <div class="course" id="studCourse" runat="server" style="width: 100%;">
                                            <label for="SearchCourse" class="col-form-label">Course</label>
                                            <asp:DropDownList ID="DisplaySearchCourse" runat="server" CssClass="selectCourse form-control w-100">
                                                <asp:ListItem Value="BCA">BCA</asp:ListItem>
                                                <asp:ListItem Value="BSC">BSC</asp:ListItem>
                                                <asp:ListItem Value="BSCIT">BSCIT</asp:ListItem>
                                                <asp:ListItem Value="B.COM">B.COM</asp:ListItem>
                                                <asp:ListItem Value="BBA">BBA</asp:ListItem>
                                                <asp:ListItem Value="BA">BA</asp:ListItem>
                                                <asp:ListItem Value="B.TECH">B.TECH</asp:ListItem>
                                                <asp:ListItem Value="MCA">MCA</asp:ListItem>
                                                <asp:ListItem Value="LLB">LLB</asp:ListItem>
                                                <asp:ListItem Value="BMS">BMS</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="course" style="width: 100%;">
                                            <label for="recipient-name" class="col-form-label">Select Start Date</label>
                                            <asp:TextBox ID="DisplayStartDate" runat="server" CssClass="selectCourse form-control w-100" TextMode="Date"></asp:TextBox>
                                        </div>
                                        <div class="course" style="width: 100%;">
                                            <label for="recipient-name" class="col-form-label">Select End Date</label>
                                            <asp:TextBox ID="DisplayEndDate" runat="server" CssClass="selectCourse form-control w-100" TextMode="Date"></asp:TextBox>
                                        </div>
                                        <div class="searchbtn">
                                            <asp:Button ID="DisplaySearchRecord" runat="server" CssClass="btn btn-primary" Text="Display" OnClick="DisplaySearchRecord_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== DISPLAY SEARCH BOX END ================================================== -->






                        <!-- ================================================== GRID VIEW BOX START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="AttendanceGridview" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0 d-flex justify-content-between w-100">
                                    <h2>Student Attendance</h2>
                                    <asp:Label ID="SearchBoxDate" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="AttendanceDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="SRNo" HeaderText="ID" SortExpression="SRNo" ReadOnly="True" />
                                            <asp:BoundField DataField="SName" HeaderText="Name" SortExpression="SName" />
                                            <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" />
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblPresent" runat="server" Text="Attendance"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:RadioButton ID="GVPresent" runat="server" GroupName="g1" Text="Present" CssClass="radioBtn w-25" />
                                                    <asp:RadioButton ID="GVAbsent" runat="server" GroupName="g1" Text="Absent" CssClass="radioBtn w-25" />
                                                    <asp:RadioButton ID="GVLeave" runat="server" GroupName="g1" Text="Leave" CssClass="radioBtn w-25" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="full graph_head border-top d-flex justify-content-between">
                                <div class="w-25">
                                    <asp:Button ID="GVBtnSave" runat="server" Text="Save" OnClick="GVBtnSave_Click" CssClass="btn btn-primary w-100" />
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== GRID VIEW BOX START ================================================== -->



                        <!-- ================================================== DISPLAY ALL STUDENTS ATTENDANCE START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="DisplayAllStudentRecord" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>All Student Attendance</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">

                                <div class="searchbar">
                                    <div class="course" style="width: 100%;">
                                        <label for="recipient-name" class="col-form-label">Search Name</label>
                                        <asp:TextBox ID="SearchStudentData" runat="server" CssClass="selectCourse form-control w-100" placeholder="Enter Student Name"></asp:TextBox>
                                    </div>
                                    <div class="searchbtn">
                                        <asp:Button ID="btnStudentSearch" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="btnStudentSearch_Click" />
                                    </div>
                                </div>

                                <div class="table-responsive-sm DisplayRecord mt-3">                                   
                                    <asp:GridView ID="DisplayAllStudent" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="SRNo" HeaderText="No" ReadOnly="True" SortExpression="SRNo" />
                                            <asp:BoundField DataField="SName" HeaderText="Name" SortExpression="SName" />
                                            <asp:BoundField DataField="SCourse" HeaderText="Course" SortExpression="SCourse" />
                                            <asp:BoundField DataField="ADate" HeaderText="Date" SortExpression="ADate" />
                                            <asp:BoundField DataField="AAttendance" HeaderText="Attendance" SortExpression="AAttendance" />
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" ID="gvUpdateTitle" Text="Update" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="GVBtnUpdate" runat="server" OnClick="GVBtnUpdate_Click" Text="Update" CssClass="btn btn-primary" Width="100%"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <EmptyDataTemplate>No Record Found</EmptyDataTemplate>
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== DISPLAY ALL STUDENTS ATTENDANCE END ================================================== -->



                        <!-- ================================================== VIEW UPDATE MODEL BOX START ================================================== -->
                        <div class="modal fade" id="viewModel">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Update Attendance</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">ID</label>
                                                <asp:TextBox ID="viewID" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Name</label>
                                                <asp:TextBox ID="viewName" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Date</label>
                                                <asp:TextBox ID="viewDate" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Attendance</label>
                                                <asp:DropDownList ID="viewAttendance" runat="server" CssClass="form-control">
                                                    <asp:ListItem>-- Select Attendance --</asp:ListItem>
                                                    <asp:ListItem Value="Present">Present</asp:ListItem>
                                                    <asp:ListItem Value="Absent">Absent</asp:ListItem>
                                                    <asp:ListItem Value="Leave">Leave</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <asp:Button ID="btnViewUpdate" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="btnViewUpdate_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== VIEW UPDATE MODEL BOX END ================================================== -->


                    </div>
                </div>
                <!-- ================================================== FIRST BOX END ================================================== -->




                <!-- ================================================== STUDENT PANEL BOX START ================================================== -->
                <div class="row" id="StudentPanel" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== STUDENT PANEL START ================================================== -->
                        <div class="white_shd full margin_bottom_30">

                            <div class="full graph_head">
                                <div class="heading1 margin_0 w-100 text-center">
                                    <h2>Student Attendance</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="attendace_container d-flex justify-content-around">
                                    <div class="attendace_box text-center">
                                        <div class="circle btn-primary rounded-circle">
                                            <h3 id="TotalPresent" runat="server"></h3>
                                        </div>
                                        <span class="mt-2">Present</span>
                                    </div>
                                    <div class="attendace_box text-center">
                                        <div class="circle btn-danger rounded-circle">
                                            <h3 id="TotalAbsent" runat="server"></h3>
                                        </div>
                                        <span class="mt-2">Absent</span>
                                    </div>
                                    <div class="attendace_box text-center">
                                        <div class="circle btn-success rounded-circle">
                                            <h3 id="TotalLeave" runat="server"></h3>
                                        </div>
                                        <span class="mt-2">Leave</span>
                                    </div>
                                </div>
                            </div>


                        </div>
                        <!-- ================================================== STUDENT PANEL END ================================================== -->
                    </div>
                </div>
                <!-- ================================================== STUDENT PANEL BOX START ================================================== -->


                



            </div>
        </div>
    </div>

    <script>
        function alertSuccess(){
            swal({
                  title: 'Success',
                  icon: 'success',
            });
        };
        function alertError(){
            swal({
                  title: 'Un Success',
                  icon: 'error',
            });
        };
        function alertEmpty(){
            swal({
                  title: 'Blank Record',
                  text: 'Please, Enter The All Values In Field',
                  icon: 'warning',
            });
        };
        function alertReady(){
            swal({
                  title: 'All Ready Exists',
                  text: 'Sorry! This Record Is All Ready Exists',
                  icon: 'warning',
            });
        };
        function modelShow(){
            $("#viewModel").modal("show");
        };
    </script>
</asp:Content>



<%--String fetchQuery;
        if (DisplaySearchCourse.Text == "" || DisplayStartDate.Text == "" || DisplayEndDate.Text =="")
        {
            if (userrole == "Student")
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SName='" + username + "' AND ADate='" + CurrentDate + "' AND AttendanceTB.remove_status='0'";
            }
            else
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SCourse='" + DisplaySearchCourse.Text + "' AND ADate='" + CurrentDate + "' AND AttendanceTB.remove_status='0'";
            }
        }
        else
        {
            string StartDate = DateTime.Parse(DisplayStartDate.Text.Trim()).ToString("dd/mm/yyyy");
            string EndDate = DateTime.Parse(DisplayEndDate.Text.Trim()).ToString("dd/mm/yyyy");

            if(userrole == "Student")
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SName='" + username + "' AND ADate BETWEEN '" + StartDate + "' AND '" + EndDate + "' AND remove_status='0'";
            }
            else
            {
                fetchQuery = "SELECT StudentTB.SRNo, StudentTB.SName, StudentTB.SCourse, AttendanceTB.ADate, AttendanceTB.AAttendance FROM StudentTB INNER JOIN AttendanceTB ON StudentTB.SRNo = AttendanceTB.SRNo WHERE SCourse='" + DisplaySearchCourse.Text + "' AND ADate BETWEEN '" + StartDate + "' AND '" + EndDate + "' AND AttendanceTB.remove_status='0'";
            }
        }--%>