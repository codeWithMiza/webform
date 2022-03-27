<%@ Page Title="Shadhin Bangla Mess" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="MessManagement.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="section">
        
    <div class="container my-2 pt-5">
        <h3 class="text-capitalize text-center mb-3">Data List of Member </h3>
        <div class="row my-2">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="CardNumber" DataSourceID="SqlDataSource1" RepeatColumns="3" Width="1073px">
                <ItemTemplate>
                    CardNumber:
                    <asp:Label ID="CardNumberLabel" runat="server" Text='<%# Eval("CardNumber") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                    <br />
                    RoomNumber:
                    <asp:Label ID="RoomNumberLabel" runat="server" Text='<%# Eval("RoomNumber") %>' />
                    <br />
                    Block:
                    <asp:Label ID="BlockLabel" runat="server" Text='<%# Eval("Block") %>' />
                    <br />
                    Department:
                    <asp:Label ID="DepartmentLabel" runat="server" Text='<%# Eval("Department") %>' />
                    <br />
                    PhoneNumber:
                    <asp:Label ID="PhoneNumberLabel" runat="server" Text='<%# Eval("PhoneNumber") %>' />
<br />
                    Picture:
                   
                    <asp:Image ID="Image1" runat="server"  ImageUrl='<%# Eval("Picture") %>' Width="100" Height="100" />
                    <br />
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <br />
            <br />


        

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" SelectCommand="SELECT * FROM [Purchage]"></asp:SqlDataSource>

        </div>
        
    </div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SqlConString %>" SelectCommand="SELECT * FROM [Member]"></asp:SqlDataSource>
    </div>


    <div class="container my-5">
        <h2 class="text-center mb-3"> Purchage list Render with Repeater</h2>
 
    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                <ItemTemplate>
                    SerialNumber:
                    <asp:Label ID="SerialNumberLabel" runat="server" Text='<%# Eval("SerialNumber") %>' />
                    <br />
                    Date:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    <br />
                    items:
                    <asp:Label ID="itemsLabel" runat="server" Text='<%# Eval("items") %>' />
                    <br />
                    Amount:
                    <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                    <br />
                    SessionNumber:
                    <asp:Label ID="SessionNumberLabel" runat="server" Text='<%# Eval("SessionNumber") %>' />
                    <br />
                    <br />
                </ItemTemplate>
        </asp:Repeater>
       </div>
</asp:Content>
