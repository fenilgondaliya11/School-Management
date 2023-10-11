<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="~/CS Files/binPage.aspx.cs" Inherits="binPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <style>
        td[colspan="8"],
        td[colspan="5"],
        td[colspan="7"]{
            font-size: 30px;
            text-align: center;
            color: gray;
            border: none;
        }
    </style>

    <div id="content">
        <div class="midde_cont">
            <div class="container-fluid">

                <!-- ================================================== TITLE BAR START ================================================== -->
                <div class="row column_title">
                    <div class="col-md-12">

                        <div class="page_title">
                            <h2>Bin</h2>
                        </div>

                    </div>
                </div>
                <!-- ================================================== TITLE BAR END ================================================== -->


                <!-- ================================================== THREE BOX START ================================================== -->
                <div class="row">
                    <!-- table section -->
                    <div class="col-md-12">

                        <!-- ================================================== SEARCH BAR START ================================================== -->
                        <div class="white_shd full margin_bottom_30">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2>Search Record</h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <div class="searchbar">
                                        <div class="searchbox">
                                            <asp:DropDownList ID="searchName" runat="server" class="searchbox-input w-100">
                                                <asp:ListItem Value="StaffTB">Staff</asp:ListItem>
                                                <asp:ListItem Value="StudentTB">Student</asp:ListItem>
                                                <asp:ListItem Value="NotificationTB">Notification</asp:ListItem>
                                                <asp:ListItem Value="FeesTB">Fees</asp:ListItem>
                                                <asp:ListItem Value="ResultTB">Results</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                        <div class="searchbtn">
                                            <asp:Button ID="searchbtn" runat="server" CssClass="btn btn-primary" Text="Search" OnClick="searchbtn_Click" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== SEARCH BAR END ================================================== -->

                        <!-- ================================================== GRID VIEW START ================================================== -->
                        <div class="white_shd full margin_bottom_30" id="binGridview" runat="server">
                            <div class="full graph_head">
                                <div class="heading1 margin_0">
                                    <h2 id="tableName" runat="server"></h2>
                                </div>
                            </div>
                            <div class="table_section padding_infor_info">
                                <div class="table-responsive-sm">
                                    <asp:GridView ID="RemoveDATA" runat="server" BackColor="White" CssClass="table" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                                        <Columns>
                                            <asp:TemplateField>
                                                <HeaderTemplate>
                                                    <asp:Label ID="lblRestore" runat="server" Text="Restore"></asp:Label>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="btnRestore" runat="server" Text="Restore" CssClass="btn btn-primary" OnClick="btnRestore_Click" OnClientClick="return confirm('This Record Is Restore');"></asp:LinkButton>
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
                                        <EmptyDataTemplate>Not Found Record</EmptyDataTemplate>
                                    </asp:GridView>
                                    <%--<asp:Label class="d-flex display-4 justify-content-center p-3 text-secondary" id="notFound" runat="server" Visible="false">Not Found Record</asp:Label>--%>
                                </div>
                            </div>
                        </div>
                        <!-- ================================================== GRID VIEW END ================================================== -->

                    </div>
                </div>
                <!-- ================================================== THREE BOX END ================================================== -->


            </div>
        </div>
    </div>
    <script>
        function alertEmpty(){
            swal({
              title: "Blank Record",
              icon: "warning",
            });
        };
        function alertError(){
            swal({
              title: "Un Success",
              icon: "error",
            });
        };
        function alertSuccess(){
            swal({
              title: "Success",
              icon: "success",
            });
        };
    </script>
</asp:Content>

