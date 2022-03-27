<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="AddMember.aspx.cs" Inherits="MessManagement.Admin.AddMember" %>
<%@ Register Src="~/Forms/FormControls.ascx" TagPrefix="uc1" TagName="FormControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../Scripts/jquery-3.6.0.min.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="bodyContent" runat="server">

    
    <uc1:FormControl runat="server" id="FormControls" />

</asp:Content>
