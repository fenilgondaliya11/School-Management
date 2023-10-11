<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/notificationPage.aspx.cs" Inherits="notificationPage" %>

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
                            <h2>Notification </h2>
                            <div class="menuicon" id="menuIcon" runat="server">
                                <img src="images/logo/menu.png" data-toggle="dropdown" />
                                <div class="dropdown-menu">
                                    <div class="menu_box" onclick="newShow()" style="width: 100%;">
                                        <i class="fas fa-plus-circle"></i>
                                        <p>New</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- ================================================== TITLE BAR END ================================================== -->



                <!-- ================================================== FIRST BOX START ================================================== -->
                <div class="row" id="newBox" style="display: none">
                    <!-- table section -->
                    <div class="col-md-12">

                        <!-- ================================================== NEW STAFF FORM START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>New Notification</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Title</label>
                                            <asp:TextBox ID="EditTitle" runat="server" placeholder="Enter Title" cssclass="form-control"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="recipient-name" class="col-form-label">Date</label>
                                            <asp:TextBox ID="EditDate" runat="server" placeholder="Current Date" cssclass="form-control" ReadOnly="true"></asp:TextBox>
                                        </div>
                                        <div class="form-group">
                                            <label for="message-text" class="col-form-label">Description</label>
                                            <asp:TextBox ID="EditDescription" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Description"></asp:TextBox>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" onclick="Hide()">Close</button>
                                    <asp:Button ID="SaveNotification" runat="server" CssClass="btn btn-primary" OnClick="SaveNotification_Click" Text="Save Notification" />
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== NEW STAFF FORM END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== FIRST BOX END ================================================== -->



                <!-- ================================================== SECOND BOX START ================================================== -->
                <div class="row">
                                        
                    <div class="col-md-12">
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2 id="tt" runat="server">Notification Student & Staff</h2>
                                </div>
                            </div>
                            <div class="full padding_infor_info">
                                <div class="table_row">
                                    <div class="table-responsive">
                                        <asp:GridView ID="notificationDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" AutoGenerateColumns="False" OnRowCommand="notificationDATA_RowCommand">
                                            <Columns>
                                                <asp:BoundField DataField="NId" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="NId" />
                                                <asp:BoundField DataField="NTitle" HeaderText="Title" SortExpression="NTitle" />
                                                <asp:BoundField DataField="NDate" HeaderText="Date" SortExpression="NDate" />
                                                <asp:BoundField DataField="NDescription" HeaderText="Description" SortExpression="NDescription" />
                                                <asp:ButtonField HeaderText="View" Text="View" ControlStyle-CssClass="btn btn-primary text-white w-100" CommandName="viewBtn" />
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <asp:Label ID="lblDelete" Text="Delete" runat="server"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnDelete" runat="server" OnClick="btnDelete_Click" CssClass="btn btn-danger text-white w-100" OnClientClick="return confirm('Are You Sure This Record Delete');" Text="Delete"></asp:LinkButton>
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
                        </div>
                    </div>
                </div>
                <!-- ================================================== SECOND BOX END ================================================== -->



                <!-- ================================================== VIEW NOTIFICATION MODEL BOX START ================================================== -->
                <div class="modal fade" id="viewModel">
                    <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="viewTitle" runat="server"></h5>
                                <h5 id="viewDate" runat="server"></h5>
                            </div>
                            <div class="modal-body">
                                <p id="viewBody" runat="server">hello</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- ================================================== VIEW NOTIFICATION MODEL BOX END ================================================== -->


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

        function newShow(){
            document.getElementById("newBox").style.display="block";
            document.getElementById("updateStaff").style.display="none";
        };

        function Hide(){
            document.getElementById("newBox").style.display="none";
            document.getElementById("updateStaff").style.display="none";
        };
    </script>
</asp:Content>

