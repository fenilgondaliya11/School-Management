<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/staffPage.aspx.cs" Inherits="staffPage" %>

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
                            <h2>Staff</h2>
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
                    <!-- table section -->
                    <div class="col-md-12">

                        <!-- ================================================== NEW STAFF FORM START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>New Staff</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Name</label>
                                            <asp:TextBox ID="EditSName" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Email ID</label>
                                            <asp:TextBox ID="EditSEmail" runat="server" placeholder="Enter Email ID" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="validationEmail" runat="server" ControlToValidate="EditSEmail" ErrorMessage="Please, Enter The Proper Email ID" ValidationExpression="\S+\d+@\S+.\S+" ForeColor="Red"></asp:RegularExpressionValidator>  
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Mobile</label>
                                            <asp:TextBox ID="EditSMobile" runat="server" placeholder="Enter Mobile" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                            <asp:RegularExpressionValidator ID="ValidationMobile" runat="server" ControlToValidate="EditSMobile" ErrorMessage="Please, Enter The Current Mobile Number" ValidationExpression="[0-9]{10}" ForeColor="Red"></asp:RegularExpressionValidator>  
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Role</label>
                                            <asp:DropDownList ID="EditSRoles" runat="server" CssClass="form-control">
                                                <asp:ListItem>-- Select Role --</asp:ListItem>
                                                <asp:ListItem Value="Staff">Staff</asp:ListItem>
                                                <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Course</label>
                                            <asp:DropDownList ID="EditSCourse" runat="server" Width="100%" CssClass="selectCourse form-control">
                                                <asp:ListItem>-- Select Course --</asp:ListItem>
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
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Password</label>
                                            <asp:TextBox runat="server" ID="EditSPassword" placeholder="Enter Password" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <asp:Button ID="close" runat="server" CssClass="btn btn-secondary" Text="Close" OnClick="close_Click" />
                                    <asp:Button ID="SaveStaff" runat="server" CssClass="btn btn-primary" ValidationGroup="mo" Text="Save Staff" OnClick="SaveStaff_Click" />
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== NEW STAFF FORM END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== FIRST BOX END ================================================== -->




                <!-- ================================================== THREE BOX START ================================================== -->
                <div class="row">
                    <div class="col-md-12">

                        <!-- ================================================== SEARCH BAR START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Search Course</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="searchbar">
                                        <div class="course" style="width: 100%;">
                                            <asp:TextBox ID="Searchtxt" runat="server" CssClass="selectCourse" Width="100%" placeholder="Enter Search Any Record"></asp:TextBox>
                                        </div>
                                        <div class="searchbtn">
                                            <asp:Button ID="SearchBtn" runat="server" CssClass="btn btn-primary" OnClick="SearchBtn_Click" Text="Search" />
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
                                    <h2>All Staff Data</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="StaffDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False">
                                        <Columns>
                                            <asp:BoundField DataField="EId" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="EId" />
                                            <asp:BoundField DataField="EName" HeaderText="Name" SortExpression="EName" />
                                            <asp:BoundField DataField="ECourse" HeaderText="Course" SortExpression="ECourse" />
                                            <asp:BoundField DataField="EEmail" HeaderText="Email" SortExpression="EEmail" />
                                            <asp:BoundField DataField="EMobile" HeaderText="Mobile" SortExpression="EMobile" />
                                            <asp:BoundField DataField="roles" HeaderText="Roles" SortExpression="roles" />
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
                                                    <asp:Label runat="server" ID="gvDeleteTitle" Text="Delete" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="GVBtnDelete" runat="server" OnClick="GVBtnDelete_Click" Text="Delete" OnClientClick="return confirm('Are You Sure This Record Is Delete?');" CssClass="btn btn-danger" Width="100%" CommandName="btnDelete"></asp:LinkButton>
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
                        <!-- ================================================== GRID VIEW BOX START ================================================== -->


                        <!-- ================================================== VIEW UPDATE MODEL BOX START ================================================== -->
                        <div class="modal fade" id="viewModel">
                            <div class="modal-dialog modal-dialog-centered" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">Update Staff</h5>
                                    </div>
                                    <div class="modal-body">
                                        <form>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">ID</label>
                                                <asp:TextBox ID="viewID" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Name</label>
                                                <asp:TextBox ID="viewName" runat="server" placeholder="Enter Name" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Email ID</label>
                                                <asp:TextBox ID="viewEmail" runat="server" placeholder="Enter Email ID" CssClass="form-control" TextMode="Email"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Role</label>
                                                <asp:DropDownList ID="viewRole" runat="server" CssClass="form-control">
                                                    <asp:ListItem>-- Select Role --</asp:ListItem>
                                                    <asp:ListItem Value="Staff">Staff</asp:ListItem>
                                                    <asp:ListItem Value="Admin">Admin</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                            <div class="form-group">
                                                <label for="message-text" class="col-form-label">Course</label>
                                                <asp:DropDownList ID="viewCourse" runat="server" Width="100%" CssClass="selectCourse form-control">
                                                    <asp:ListItem>-- Select Course --</asp:ListItem>
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
                                            <div class="form-group">
                                                <label for="recipient-name" class="col-form-label">Password</label>
                                                <asp:TextBox ID="viewPassword" runat="server" placeholder="Enter Password" CssClass="form-control"></asp:TextBox>
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
        function modelShow(){
            $("#viewModel").modal("show");
        };
    </script>
</asp:Content>

