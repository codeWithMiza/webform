<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="Purchage.aspx.cs" Inherits="MessManagement.Forms.Purchage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
 
       <h2 class="text-center py-5, my-5"> Add Purchase </h2>
    <div class="container my-5 pt-5">
        <div class="row mb-2">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="SerialNumber" DataSourceID="SqlDataSource1" Height="201px" CellPadding="4" ForeColor="#333333" GridLines="None" Width="680px">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" ButtonType="Button" HeaderText="Action" />
                    <asp:BoundField DataField="SerialNumber" HeaderText="SerialNumber" ReadOnly="True" SortExpression="SerialNumber" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="items" HeaderText="items" SortExpression="items" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="SessionNumber" HeaderText="SessionNumber" SortExpression="SessionNumber" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" SelectCommand="SELECT * FROM [Purchage]"></asp:SqlDataSource>
            <br />
            <br />
            </div>
        <div class="row mb-2 mt-5">

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                          <asp:FormView ID="FormView1" runat="server" DataKeyNames="SerialNumber" DataSourceID="SqlDataSource2" Height="188px" Width="307px" OnItemDeleted="FormView1_ItemDeleted" OnItemInserted="FormView1_ItemInserted" OnItemUpdated="FormView1_ItemUpdated">
                <EditItemTemplate>
                    SerialNumber:
                    <asp:Label ID="SerialNumberLabel1" runat="server" Text='<%# Eval("SerialNumber") %>' />
                    <br />
                    Date:
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date") %>' TextMode="Date"  />
                    <asp:CustomValidator ID="custom" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtDate"></asp:CustomValidator>
                    <br />
                    items:
                    <asp:TextBox ID="itemsTextBox" runat="server" Text='<%# Bind("items") %>' />
                    <br />
                    Amount:
                    <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                    <br />
                    SessionNumber:
                    <asp:TextBox ID="SessionNumberTextBox" runat="server" Text='<%# Bind("SessionNumber") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    SerialNumber:
                    <asp:TextBox ID="SerialNumberTextBox" runat="server" Text='<%# Bind("SerialNumber") %>' />
                    <br />
                    Date:
                    <asp:TextBox ID="txtDate" runat="server" Text='<%# Bind("Date") %>' TextMode="Date"  />
                    <br />
                    items:
                    <asp:TextBox ID="itemsTextBox" runat="server" Text='<%# Bind("items") %>' />
                    <br />
                    Amount:
                    <asp:TextBox ID="AmountTextBox" runat="server" Text='<%# Bind("Amount") %>' />
                    <br />
                    SessionNumber:
                    <asp:TextBox ID="SessionNumberTextBox" runat="server" Text='<%# Bind("SessionNumber") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    SerialNumber:
                    <asp:Label ID="SerialNumberLabel" runat="server" Text='<%# Eval("SerialNumber") %>' />
                    <br />
                    Date:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' />
                    <br />
                    items:
                    <asp:Label ID="itemsLabel" runat="server" Text='<%# Bind("items") %>' />
                    <br />
                    Amount:
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>' />
                    <br />
                    SessionNumber:
                    <asp:Label ID="SessionNumberLabel" runat="server" Text='<%# Bind("SessionNumber") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" DeleteCommand="DELETE FROM [Purchage] WHERE [SerialNumber] = @SerialNumber" InsertCommand="INSERT INTO [Purchage] ([SerialNumber], [Date], [items], [Amount], [SessionNumber]) VALUES (@SerialNumber, @Date, @items, @Amount, @SessionNumber)" SelectCommand="SELECT * FROM [Purchage] WHERE ([SerialNumber] = @SerialNumber)" UpdateCommand="UPDATE [Purchage] SET [Date] = @Date, [items] = @items, [Amount] = @Amount, [SessionNumber] = @SessionNumber WHERE [SerialNumber] = @SerialNumber">
                <DeleteParameters>
                    <asp:Parameter Name="SerialNumber" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="SerialNumber" Type="Int32" />
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="items" Type="String" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="SessionNumber" Type="Int32" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="SerialNumber" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="items" Type="String" />
                    <asp:Parameter Name="Amount" Type="Decimal" />
                    <asp:Parameter Name="SessionNumber" Type="Int32" />
                    <asp:Parameter Name="SerialNumber" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="GridView1" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>

      
            </div>

        </div>
</asp:Content>
