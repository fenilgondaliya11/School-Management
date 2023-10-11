<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/feePage.aspx.cs" Inherits="feePages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="content">
        <div class="midde_cont">
            <div class="container-fluid">

                <!-- ================================================== TITLE BAR START ================================================== -->
                <div class="row column_title">
                    <div class="col-md-12">

                        <div class="page_title">
                            <h2>Fees</h2>
                            <div class="menuicon" id="menuicon" runat="server">
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
                <div class="row" id="newBox" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== NEW FEES FORM START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>New Student Fees</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Roll No</label>
                                            <asp:TextBox ID="EditRNo" runat="server" placeholder="Enter Roll No" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="EditName" runat="server" placeholder="Name" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <asp:TextBox ID="EditDate" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="modal-footer">
                                            <asp:Button ID="EditReset" runat="server" CssClass="btn btn-primary" Text="Reset" OnClick="reset_Click" />
                                            <asp:Button ID="EditNext" runat="server" CssClass="btn btn-primary" Text="Next" OnClick="next_Click" />
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Student Fees</label>
                                            <asp:TextBox ID="EditFees" runat="server" placeholder="Enter Student Fees" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="close" runat="server" CssClass="btn btn-secondary" Text="Close" OnClick="close_Click" />
                                    <asp:Button ID="saveFees" runat="server" CssClass="btn btn-primary" Text="Save Fees" Enabled="false" OnClick="saveFees_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== NEW FEES FORM END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== FIRST BOX END ================================================== -->



                <!-- ================================================== SECOND BOX START ================================================== -->
                <div class="row" id="StaffContainer" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== SEARCH BAR START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Search Name</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="searchbar">
                                        <div class="searchbox">
                                            <asp:TextBox ID="searchName" runat="server" class="searchbox-input" Width="100%" placeholder="Enter Your Name"></asp:TextBox>
                                        </div>
                                        <div class="searchbtn">
                                            <asp:Button ID="searchbtn" runat="server" CssClass="btn btn-primary" Text="Search" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== SEARCH BAR END ================================================== -->
                    

                        <!-- ================================================== ALL STUDENT DATA START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>All Students Fees Data</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="FeesDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="FeesDATA_RowCommand1">
                                        <Columns>
                                            <asp:BoundField DataField="SRNo" HeaderText="ID" ReadOnly="True" SortExpression="SRNo" />
                                            <asp:BoundField DataField="SName" HeaderText="Name" SortExpression="SName" />
                                            <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" />
                                            <asp:BoundField DataField="SCourse" HeaderText="Course" SortExpression="SCourse" />
                                            <asp:BoundField DataField="FDate" HeaderText="Date" SortExpression="FDate" />
                                            <asp:BoundField DataField="FMoney" HeaderText="Money" SortExpression="FMoney" />
                                            <asp:ButtonField HeaderText="View" Text="View" ControlStyle-CssClass="btn btn-primary text-white w-100" CommandName="viewBtn" />
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" ID="gvUpdateTitle" Text="Update" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="GVBtnUpdate" runat="server" OnClick="GVBtnUpdate_Click" Text="Update" CssClass="btn btn-primary" Width="100%"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="Dtitle" runat="server" Text="Delete"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger text-white w-100" OnClick="btnDelete_Click" OnClientClick="return confirm('Are You Sure This Record Is Delete?');"></asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
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
                        <!-- ================================================== ALL STUDENT DATA END ================================================== -->


                        <!-- ================================================== VIEW UPDATE MODEL BOX START ================================================== -->
                        <div class="modal fade" id="viewModel">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Update Fees</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <asp:Label ID="viewEmptyFees" runat="server" Visible="false"></asp:Label>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">ID</label>
                                                <asp:TextBox ID="viewID" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Name</label>
                                                <asp:TextBox ID="viewName" runat="server" placeholder="Enter Name" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:TextBox ID="viewTDate" runat="server" placeholder="Enter Name" ReadOnly="true" CssClass="form-control" Visible="false"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Money</label>
                                                <asp:TextBox ID="viewMoney" runat="server" placeholder="Enter Money" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                            </div>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                        <asp:Button ID="btnViewUpdate" runat="server" OnClick="btnViewUpdate_Click" CssClass="btn btn-primary" Text="Update" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== VIEW UPDATE MODEL BOX END ================================================== -->


                    </div>
                </div>
                <!-- ================================================== SECOND BOX END ================================================== -->





                <!-- ================================================== STUDENT BOX START ================================================== -->
                <div class="row" id="StudentBox" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== STUDENT FEES START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0 text-center">
                                    <h2>Student Fees</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="feesContainer d-flex justify-content-around">
                                        <div class="feesBox">
                                            <div class="fees">
                                                <h3 id="payFees" runat="server"></h3>
                                            </div>
                                            <span>Pay - Fees</span>
                                        </div>
                                        <div class="feesBox">
                                            <div class="fees">
                                                <h3 id="emptyFees" runat="server"></h3>
                                            </div>
                                            <span>Empty Fees</span>
                                        </div><div class="feesBox">
                                            <div class="fees">
                                                <h3>22,500</h3>
                                            </div>
                                            <span>Total Fees</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="full graph_head border-top d-flex justify-content-between">
                                <div class="w-100">
                                    <asp:Button ID="viewDetail" runat="server" Text="View Details" CssClass="btn btn-primary w-100" OnClick="viewDetail_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== STUDENT FEES END ================================================== -->
                        

                        <!-- ================================================== STUDENT FEES DETAILS START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="feesDetails" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0 text-center">
                                    <h2>Student Fees Details</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="feesContainer text-left">
                                        <div class="rows d-flex justify-content-between">
                                            <h4>Education Fees</h4>
                                            <h4 id="STFees" runat="server"></h4>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h4>Development Fees</h4>
                                            <h4>2,000</h4>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h4>Uni. Development Fees</h4>
                                            <h4>1,700</h4>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h4>Enrollment Fees</h4>
                                            <h4>500</h4>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h4>Other Fees</h4>
                                            <h4>300</h4>
                                        </div>
                                        <div class="rows border-top border-bottom pt-3 d-flex justify-content-between">
                                            <h4>Total Fees</h4>
                                            <h4 id="SDFTotal" runat="server"></h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== STUDENT FEES DETAILS END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== STUDENT BOX END ================================================== -->



                <!-- ================================================== VIEW FEES MODEL BOX START ================================================== -->
                <div class="modal fade" id="viewFModel">
                    <div class="modal-dialog modal-dialog-centered" role="document" style="max-width: 700px">
                        <div class="modal-content">
                            <div class="modal-header justify-content-around w-100">
                                <asp:Image ID="VImage" runat="server" Width="35" ImageUrl="~/images/logo/icon.png" />
                                <h1 class="modal-title text-uppercase">Patel School IN Ahemedabad</h1>
                            </div>
                            <div class="modal-header">
                                <h4 class="modal-title text-primary" id="viewTitle" runat="server"></h4>
                                <h6 id="viewDate" runat="server"></h6>
                            </div>
                            <div class="modal-body">
                                <div id="viewBody" runat="server">
                                    <div class="feesContainer text-left">
                                        <div class="rows d-flex justify-content-between">
                                            <h5>Education Fees</h5>
                                            <h5 id="STVModel" runat="server"></h5>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h5>Development Fees</h5>
                                            <h5>2,000</h5>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h5>Uni. Development Fees</h5>
                                            <h5>1,700</h5>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h5>Enrollment Fees</h5>
                                            <h5>500</h5>
                                        </div>
                                        <div class="rows d-flex justify-content-between">
                                            <h5>Other Fees</h5>
                                            <h5>300</h5>
                                        </div>
                                        <div class="rows border-top pt-3 d-flex justify-content-between">
                                            <h5>Total Fees</h5>
                                            <h5 id="SVTModel" runat="server"></h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ================================================== VIEW FEES MODEL BOX END ================================================== -->

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
        function alertReady(){
            swal({
                    title: 'All Ready',
                    text: 'Sorry!, This Record Is All Ready Exists!..',
                    icon: 'warning',
            });
        };
        function alertEmpty(){
            swal({
                  title: 'Blank Record',
                  text: 'Please, Enter The All Values In Field',
                  icon: 'warning',
            });
       };
       function modelUShow(){
            $("#viewModel").modal("show");
        };
        function modelShow(){
            $("#viewFModel").modal("show");
        };        
        function newShow(){
            document.getElementById("newBox").style.display="block";
            document.getElementById("updateStaff").style.display="none";
        };

        function updateShow(){
            document.getElementById("newBox").style.display="none";
            document.getElementById("updateStaff").style.display="block";
        };

        function Hide(){
            document.getElementById("newBox").style.display="none";
            document.getElementById("updateStaff").style.display="none";
        };
    </script>
</asp:Content>

