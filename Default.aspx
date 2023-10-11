<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!-- right content -->
    <div id="content">
        

        <!-- ================================================= COUNT ALL TABLE START ================================================= -->
        <div class="midde_cont">
            <div class="container-fluid">

                <div class="row column_title">
                    <div class="col-md-12">
                        <div class="page_title">
                            <h2>Dashboard</h2>
                        </div>
                    </div>
                </div>

                <div class="row column1">

                    <div class="col-md-6 col-lg-3">
                        <div class="full counter_section margin_bottom_30">
                            <div class="couter_icon">
                                <div>
                                    <i class="fas fa-user-graduate yellow_color"></i>
                                </div>
                            </div>
                            <div class="counter_no">
                                <div>
                                    <p class="total_no" id="StuNO" runat="server"></p>
                                    <p class="head_couter">Students</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="full counter_section margin_bottom_30">
                            <div class="couter_icon">
                                <div>
                                    <i class="fa fa-users blue1_color"></i>
                                </div>
                            </div>
                            <div class="counter_no">
                                <div>
                                    <p class="total_no" id="StaNo" runat="server"></p>
                                    <p class="head_couter">Staffs</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="full counter_section margin_bottom_30">
                            <div class="couter_icon">
                                <div>
                                    <i class="fa fa-award green_color"></i>
                                </div>
                            </div>
                            <div class="counter_no">
                                <div>
                                    <p class="total_no">10</p>
                                    <p class="head_couter">Courses</p>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 col-lg-3">
                        <div class="full counter_section margin_bottom_30">
                            <div class="couter_icon">
                                <div>
                                    <i class="fa fa-bell red_color"></i>
                                </div>
                            </div>
                            <div class="counter_no">
                                <div>
                                    <p class="total_no" id="NotiNO" runat="server"></p>
                                    <p class="head_couter">Notifications</p>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <!-- ================================================= COUNT ALL TABLE end ================================================= -->


        <!-- ================================================== THREE BOX START ================================================== -->
        <div class="midde_cont">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">


                        <!-- ================================================== NOTIFICATION GRID VIEW BOX START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0" style="display: flex; justify-content: space-between; width: 100%;">
                                    <h2>Notification</h2>
                                    <a href="notificationPage.aspx" class="btn btn-primary">View All</a>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="notificationDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== NOTIFICATION GRID VIEW BOX START ================================================== -->



                        <!-- ================================================== STAFF GRID VIEW BOX START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="deshboardStaff" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0" style="display: flex; justify-content: space-between; width: 100%;">
                                    <h2>Staff Record</h2>
                                    <a href="staffPage.aspx" class="btn btn-primary">View All</a>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="StaffDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== STAFF GRID VIEW BOX START ================================================== -->




                        <!-- ================================================== STUDENT GRID VIEW BOX START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="deshboardStudent" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0" style="display: flex; justify-content: space-between; width: 100%;">
                                    <h2>Student Record</h2>
                                    <a href="studentPage.aspx" class="btn btn-primary">View All</a>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="StudentDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                                        <HeaderStyle BackColor="#ffffff" Font-Bold="True" ForeColor="Black" />
                                        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                                        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                                        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                                        <SortedDescendingHeaderStyle BackColor="#242121" />
                                    </asp:GridView>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== STUDENT GRID VIEW BOX START ================================================== -->

                    </div>
                </div>
            </div>
        </div>
        <!-- ================================================== THREE BOX END ================================================== -->

    </div>
</asp:Content>

