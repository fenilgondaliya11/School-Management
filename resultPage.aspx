<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/resultPage.aspx.cs" Inherits="resultPage" %>

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
                            <h2>Student Results</h2>
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
                <div class="row" id="newBox" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== NEW STUDENT RESULTS FORM START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>New Student Result</h2>
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
                                            <asp:TextBox ID="EditName" runat="server" placeholder="Name" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <!-- ======================== BUTTON RESET AND NEXT START  ======================== -->
                                        <div class="modal-footer">
                                            <asp:Button ID="EditReset" runat="server" CssClass="btn btn-primary" Enabled="false" Text="Reset" OnClick="EditReset_Click" />
                                            <asp:Button ID="EditNext" runat="server" CssClass="btn btn-primary" Enabled="true" Text="Next" OnClick="EditNext_Click" />
                                        </div>
                                        <!-- ======================== BUTTON RESET AND NEXT END  ======================== -->
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Total</label>
                                            <asp:TextBox ID="EditTotal" runat="server" placeholder="Enter Total" ReadOnly="true" TextMode="Number" CssClass="form-control"></asp:TextBox>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="closeStudent" runat="server" CssClass="btn btn-secondary" Text="Close" OnClick="closeStudent_Click" />
                                    <asp:Button ID="SaveResult" runat="server" CssClass="btn btn-primary" Enabled="false" Text="Save Result" OnClick="SaveResult_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== NEW STUDENT RESULTS FORM END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== FIRST BOX END ================================================== -->





                <!-- ================================================== SECOND BOX START ================================================== -->
                <div class="row" id="adminPanel" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== SEARCH BAR START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Search Data</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="searchbar">
                                        <div class="searchbox">
                                            <asp:TextBox ID="searchBox" runat="server" class="searchbox-input" Width="100%" placeholder="Enter Search Any Data..."></asp:TextBox>
                                        </div>
                                        <div class="searchbtn">
                                            <asp:Button ID="searchbtn" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="searchbtn_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== SEARCH BAR END ================================================== -->

                        <!-- ================================================== GRID VIEW BOX START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>All Students Data</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="ResultDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="SRNo" HeaderText="ID" ReadOnly="True" SortExpression="SRNo" />
                                            <asp:BoundField DataField="SName" HeaderText="Name" SortExpression="SName" />
                                            <asp:BoundField DataField="SEmail" HeaderText="Email" SortExpression="SEmail" />
                                            <asp:BoundField DataField="SCourse" HeaderText="Course" SortExpression="SCourse" />
                                            <asp:BoundField DataField="Total" HeaderText="Total" SortExpression="Total" />
                                            <asp:BoundField DataField="Percentage" HeaderText="Percentage" SortExpression="Percentage" />
                                            <asp:BoundField DataField="Grade" HeaderText="Grade" SortExpression="Grade" />
                                            <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblUpdate" runat="server" Text="Update"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnUpdate" runat="server" Text="Update" CssClass="btn btn-primary w-100" OnClick="btnUpdate_Click"></asp:LinkButton> 
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblDelete" runat="server" Text="Delete"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" CssClass="btn btn-danger w-100" OnClick="btnDelete_Click" OnClientClick="return confirm('Are You Sure This Record Is Delete?');"></asp:LinkButton> 
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
                        <!-- ================================================== GRID VIEW BOX END ================================================== -->

                        <!-- ================================================== VIEW UPDATE MODEL BOX START ================================================== -->
                        <div class="modal fade" id="viewModel">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Update Result</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">RollNo</label>
                                                <asp:TextBox ID="viewRno" runat="server" placeholder="Enter Name" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Name</label>
                                                <asp:TextBox ID="viewName" runat="server" placeholder="Enter Name" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Total</label>
                                                <asp:TextBox ID="viewTotal" runat="server" placeholder="Enter Total" CssClass="form-control" TextMode="number"></asp:TextBox>
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


                <!-- ================================================== THREE BOX START ================================================== -->
                <div class="row" id="StudentPanel" runat="server">
                    <div class="col-md-12">

                        <!-- ================================================== STUDENT RESULT START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Student Result</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Roll Number</h4>
                                            <h4 id="RSRNo" runat="server"></h4>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Name</h4>
                                            <h4 id="RSName" runat="server"></h4>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Email ID</h4>
                                            <h4 id="RSEmail" runat="server"></h4>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Total</h4>
                                            <h4 id="RSTotal" runat="server">500</h4>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Percentage</h4>
                                            <h4 id="RSpercentage" runat="server">83%</h4>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Grade</h4>
                                            <h4 id="RSGrade" runat="server">A</h4>
                                        </div>
                                        <div class="d-flex justify-content-between">
                                            <h4>Status</h4>
                                            <h4 id="RSStatus" runat="server">Pass</h4>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== STUDENT RESULT END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== THREE BOX END ================================================== -->


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
                  title: 'All Ready',
                  text: 'Sorry!, This Record Is All Ready Exists?',
                  icon: 'warning',
            });
        };
        function modelShow(){
            $("#viewModel").modal("show");
        };
    </script>
</asp:Content>

