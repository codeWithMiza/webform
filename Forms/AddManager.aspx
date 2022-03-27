<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="AddManager.aspx.cs" Inherits="MessManagement.Admin.AddManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">

    <div class="section">
        <h2 class="text-center py-5, my-5"> Add New Session And Manager</h2>
        <div class="row mb-5 py-5 card">
        <div class="col-md-12">
            <div class="form-group col-md-5 ">
                <asp:Label Text="Manger Name" runat="server" />
                 <asp:DropDownList ID="ddl" runat="server" CssClass="form-control my-5" AutoPostBack="True" DataSourceID="ddlSource" DataTextField="ManagerName" DataValueField="SessionNumber" ></asp:DropDownList>
            </div>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                     <asp:FormView ID="FormView1" runat="server" DataKeyNames="SessionNumber" DataSourceID="SqlDataSource1" Height="152px" Width="220px">
                <EditItemTemplate>
                    SessionNumber:
                    <asp:Label ID="SessionNumberLabel1" runat="server" Text='<%# Eval("SessionNumber") %>' />
                    <br />
                    SessionName:
                    <asp:TextBox ID="SessionNameTextBox" runat="server" Text='<%# Bind("SessionName") %>' />
                    <br />
                    ManagerName:
                    <asp:TextBox ID="ManagerNameTextBox" runat="server" Text='<%# Bind("ManagerName") %>' />
                    <br />
                    CardNumber:
                    <asp:TextBox ID="CardNumberTextBox" runat="server" Text='<%# Bind("CardNumber") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    SessionNumber:
                    <asp:TextBox ID="SessionNumberTextBox" runat="server" Text='<%# Bind("SessionNumber") %>' />
                    <br />
                    SessionName:
                    <asp:TextBox ID="SessionNameTextBox" runat="server" Text='<%# Bind("SessionName") %>' />
                    <br />
                    ManagerName:
                    <asp:TextBox ID="ManagerNameTextBox" runat="server" Text='<%# Bind("ManagerName") %>' />
                    <br />
                    CardNumber:
                    <asp:TextBox ID="CardNumberTextBox" runat="server" Text='<%# Bind("CardNumber") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    SessionNumber:
                    <asp:Label ID="SessionNumberLabel" runat="server" Text='<%# Eval("SessionNumber") %>' />
                    <br />
                    SessionName:
                    <asp:Label ID="SessionNameLabel" runat="server" Text='<%# Bind("SessionName") %>' />
                    <br />
                    ManagerName:
                    <asp:Label ID="ManagerNameLabel" runat="server" Text='<%# Bind("ManagerName") %>' />
                    <br />
                    CardNumber:
                    <asp:Label ID="CardNumberLabel" runat="server" Text='<%# Bind("CardNumber") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
                </ContentTemplate>
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="ddl" EventName="SelectedIndexChanged" />
                </Triggers>
            </asp:UpdatePanel>
           
            <asp:Button ID="Button1" runat="server" Text="Member Form"  PostBackUrl="~/Forms/AddMember.aspx"/>
            <asp:Button ID="Button2" runat="server" Text=" Fund Collection Form" PostBackUrl="~/Forms/MoneyCollect.aspx" />
        </div>
       </div>
    </div>

    <asp:SqlDataSource ID="ddlSource" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" SelectCommand="SELECT * FROM [Session]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" DeleteCommand="DELETE FROM [Session] WHERE [SessionNumber] = @SessionNumber" InsertCommand="INSERT INTO [Session] ([SessionNumber], [SessionName], [ManagerName], [CardNumber]) VALUES (@SessionNumber, @SessionName, @ManagerName, @CardNumber)" SelectCommand="SELECT * FROM [Session] WHERE ([SessionNumber] = @SessionNumber)" UpdateCommand="UPDATE [Session] SET [SessionName] = @SessionName, [ManagerName] = @ManagerName, [CardNumber] = @CardNumber WHERE [SessionNumber] = @SessionNumber">
        <DeleteParameters>
            <asp:Parameter Name="SessionNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="SessionNumber" Type="Int32" />
            <asp:Parameter Name="SessionName" Type="String" />
            <asp:Parameter Name="ManagerName" Type="String" />
            <asp:Parameter Name="CardNumber" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddl" DefaultValue="0" Name="SessionNumber" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="SessionName" Type="String" />
            <asp:Parameter Name="ManagerName" Type="String" />
            <asp:Parameter Name="CardNumber" Type="Int32" />
            <asp:Parameter Name="SessionNumber" Type="Int32" />
        </UpdateParameters>
</asp:SqlDataSource>
</asp:Content>
