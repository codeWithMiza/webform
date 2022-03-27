<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MoneyCollect.aspx.cs" Inherits="MessManagement.Forms.MoneyCollect" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
       <h2 class="text-center py-5, my-5"> Add money receieved from members</h2>
    <div class="container my-5 pt-5">
        <div class="row mb-2">
            <div class="form-group col-md-12">
                Session Name
                <asp:DropDownList ID="ddlSession" runat="server" CssClass="form-control col-md-6" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="SessionName" DataValueField="SessionNumber"></asp:DropDownList> <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" SelectCommand="SELECT [SessionNumber], [SessionName] FROM [Session]"></asp:SqlDataSource> 
                <br />
                 <asp:Button runat="server" PostBackUrl="~/Forms/AddManager.aspx"  Text="See Again Session List" CssClass=" btn btn-success"/> 
            </div>
            </div>

            <div class="row mb-2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                         <asp:ListView ID="listCollection" runat="server" DataSourceID="SqlDataSource2" InsertItemPosition="LastItem" >
                    <LayoutTemplate>
                        <table runat="server" class="table table-bordered table-hover">
                            <tr runat="server">
                                <td runat="server"> 
                                 <table runat="server" id="itemPlaceholderContainer" >
                                        <tr runat="server">
                                            <th runat="server" >Action</th>
                                            <th runat="server" >Receipt Number</th>
                                            <th runat="server" >Amount</th>
                                            <th runat="server" >Session Number</th>
                                             <th runat="server" >Card Number</th>
                                         </tr>
                                        <tr runat="server" id="itemPlaceholder"></tr>
                                    </table>
                                </td>
                            </tr>
                              <tr runat="server">
                                <td class="text-center"> 
                                   <asp:DataPager runat="server" PageSize="2" ID="pager">
                                       <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="true" ShowLastPageButton="true" ButtonCssClass="btn btn-info" />
                                        </Fields>
                                    </asp:DataPager>
                                 </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                     <ItemTemplate>
                        <tr>
                            <td> <asp:Button runat="server" CommandName="Delete" Text="Delete" />
                                <asp:Button runat="server" CommandName="Edit" Text="Edit" />
                            </td>
                            <td> <asp:Label runat="server" Text= '<%# Eval("ReceiptNumber") %>' /> </td>
                            <td> <asp:Label runat="server" Text= '<%# Eval("Amount") %>' /> </td>
                            <td> <asp:Label runat="server" Text= '<%# Eval("SessionNumber") %>' /> </td>
                            <td> <asp:Label runat="server" Text= '<%# Eval("CardNumber") %>' /> </td>
                        </tr>
                    </ItemTemplate>
                    <InsertItemTemplate>
                           <tr>
                            <td> 
                                <asp:Button runat="server" CommandName="Insert" Text="Insert" />
                                <asp:Button runat="server" CommandName="Cancel" Text="Clear" />
                            </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("ReceiptNumber") %>'  ID="txtId" /> </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("Amount") %>' ID="txtA" /> </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("SessionNumber") %>' ID="txtss" /> </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("CardNumber") %>'  ID="txtc"/> </td>
                        </tr>
                    </InsertItemTemplate>
                      <EditItemTemplate>
                           <tr>
                            <td> 
                                <asp:Button runat="server" CommandName="Update" Text="Update" />
                                <asp:Button runat="server" CommandName="Cancel" Text="Cancel" />
                            </td>
                            <td> <asp:Label runat="server" Text= '<%# Eval("ReceiptNumber") %>' /> </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("Amount") %>'  ID="txta"/> </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("SessionNumber") %>'  ID="txtss"/> </td>
                            <td> <asp:TextBox runat="server" Text= '<%# Bind("CardNumber") %>'  ID="txtc"/> </td>
                        </tr>
                    </EditItemTemplate>

                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" DeleteCommand="DELETE FROM [CollectedMoney] WHERE [ReceiptNumber] = @ReceiptNumber" InsertCommand="INSERT INTO [CollectedMoney] ([ReceiptNumber], [Amount], [SessionNumber], [CardNumber]) VALUES (@ReceiptNumber, @Amount, @SessionNumber, @CardNumber)" SelectCommand="SELECT * FROM [CollectedMoney] WHERE ([SessionNumber] = @SessionNumber)" UpdateCommand="UPDATE [CollectedMoney] SET [Amount] = @Amount, [SessionNumber] = @SessionNumber, [CardNumber] = @CardNumber WHERE [ReceiptNumber] = @ReceiptNumber">
                    <DeleteParameters>
                        <asp:Parameter Name="ReceiptNumber" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="ReceiptNumber" Type="Int32" />
                        <asp:Parameter Name="Amount" Type="Int32" />
                        <asp:Parameter Name="SessionNumber" Type="Int32" />
                        <asp:Parameter Name="CardNumber" Type="Int32" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlSession" DefaultValue="0" Name="SessionNumber" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Amount" Type="Int32" />
                        <asp:Parameter Name="SessionNumber" Type="Int32" />
                        <asp:Parameter Name="CardNumber" Type="Int32" />
                        <asp:Parameter Name="ReceiptNumber" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>


                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="ddlSession" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        
    </div>
</asp:Content>
