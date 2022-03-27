<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="MessManagement.Admin.adminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">
    <div class="section mt-5 pt-5">
        <div class="row"> 
            <div class="col-5 card mx-auto p-5">
                <div class="form-group">
                     <asp:Label Text="Name" runat="server" CssClass="col-form-label"/>
                     <asp:TextBox ID="txt_Name" runat="server" CssClass="form-control"></asp:TextBox>
                 </div>
                  <div class="form-group">
                     <asp:Label Text="Password" runat="server" CssClass="col-form-label" />
                      <asp:TextBox ID="txt_Password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                  </div>
                   <asp:Button ID="btn_login" runat="server" Text="LogIn" OnClick="btn_login_Click" CausesValidation="true" CssClass="btn btn-info"/>
                    <asp:CheckBox ID="rememberme" runat="server" CssClass="mt-2" />Remember me
                    <asp:Label ID="msg" runat="server" Text=""  CssClass="text-danger"></asp:Label>

                <asp:CustomValidator ID="Custom" runat="server" ErrorMessage="Password not match from coustom validation" ControlToValidate="txt_Password" OnServerValidate="Custom_ServerValidate" ></asp:CustomValidator>
                </div>
        </div>
        </div>
</asp:Content>
