<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FormControls.ascx.cs" Inherits="MessManagement.Forms.FormControls" %>
<div class="card col-md-12">
    <h2 class="text-center py-5, my-5"> Add New Member</h2>

    <div class="row">   
    <div class="form-group col-md-6">
         <asp:Label ID="Label1" runat="server" Text="Card Number" CssClass="form-label"></asp:Label>
         <asp:TextBox ID="txtCard" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Card Number must be in Number" Display="None" ControlToValidate="txtCard" Type="Integer" Operator="DataTypeCheck"/>
        <asp:RangeValidator ID="rav" runat="server" ErrorMessage="Card Number must between 1 and 1000" ControlToValidate="txtCard" Display="None" Type="Integer" MaximumValue="1000" MinimumValue="1" />
        <asp:RequiredFieldValidator ID="rv" runat="server" ControlToValidate="txtCard" ErrorMessage="Card Number is Required" Display="None" />
    </div>

    <div class="form-group col-md-6">
         <asp:Label ID="Label2" runat="server" Text=" Member Name" CssClass="form-label"></asp:Label>
         <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name is Required" Display="None" />
    </div>
</div>

<div class="row">   
     <div class="form-group col-md-6">
         <asp:Label ID="Label4" runat="server" Text=" Room Number" CssClass="form-label"></asp:Label>
         <asp:TextBox ID="txtRoom" runat="server" CssClass="form-control"></asp:TextBox>
         <asp:RegularExpressionValidator ID="rev" ControlToValidate="txtRoom" runat="server" ErrorMessage="Room number must append after Block fisrt letter; like [P-3001]" Display="None" ValidationExpression="\w{1}(-\d{4})?"/>
    </div>

    <div class="form-group col-md-6">
         <asp:Label ID="Label3" runat="server" Text="Block" CssClass="form-label"></asp:Label>
         <asp:DropDownList ID="ddlBlock" runat="server"  CssClass="form-control" >
             <asp:ListItem >Padma</asp:ListItem>
             <asp:ListItem >Jamuna</asp:ListItem>
             <asp:ListItem >Meghna</asp:ListItem>
         </asp:DropDownList>
    </div>
</div>

<div class="row">   
    <div class="form-group col-md-6">
         <asp:Label ID="Label5" runat="server" Text=" Department Name" CssClass="form-label"></asp:Label>
         <asp:TextBox ID="txtDept" runat="server" CssClass="form-control"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDept" ErrorMessage="Department is Required" Display="None" />
    </div>

     <div class="form-group col-md-6">
         <asp:Label ID="Label6" runat="server" Text="Phone Number" CssClass="form-label"></asp:Label>
         <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPhone" ErrorMessage="Phone Number is Required" Display="None" />
    </div>

</div>

<div class="row">   
    <div class="form-group col-md-6">
         <asp:Label ID="Label7" runat="server" Text="Picture" CssClass="form-label"></asp:Label>
         <asp:FileUpload runat="server" CssClass="form-control"  ID="picLoad"></asp:FileUpload>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="picLoad" ErrorMessage="Image is Required" Display="None" />
    </div>
    
    <asp:Button ID="btnSave" runat="server" Text="Save"  CssClass="btn btn-info form-control col-md-5 my-3 ml-5" OnClick="btnSave_Click"/>

</div>
    <asp:ValidationSummary ID="vs" runat="server" CssClass="text-danger" />
</div>






<div class="card col-md-12 py-5 my-5">

     <asp:GridView ID="gvMember" runat="server" CssClass="table table-bordered table-hover" AllowPaging="True" PageSize="5" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1" DataKeyNames="CardNumber"  OnSelectedIndexChanged="gvMember_SelectedIndexChanged" OnPreRender="gvMember_PreRender"> 
                <Columns>
                    <asp:CommandField ButtonType="Button" HeaderText="Action" ShowSelectButton="True"  ControlStyle-CssClass="btn btn-success"/>
                    <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" SortExpression="CardNumber" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
                    <asp:BoundField DataField="Block" HeaderText="Block" SortExpression="Block" />
                    <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
                    <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Bind("Picture") %>'   Width="100" Height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
     </asp:GridView>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetMembers" TypeName="MessManagement.Controller"></asp:ObjectDataSource>

</div>
<div class="card col-md-12 py-5 my-5"> 

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" OnDataBinding="UpdatePanel1_DataBinding">
        <ContentTemplate>
             <asp:DetailsView ID="dvMember" runat="server"  DataKeyNames="CardNumber" 
                 AutoGenerateRows="False" DataSourceID="ObjectDataSource2" 
                 OnItemDeleted="dvMember_ItemDeleted" OnItemUpdated="dvMember_ItemUpdated"
                 OnItemUpdating="dvMember_ItemUpdating" >
       <Fields>
           <asp:BoundField DataField="CardNumber" HeaderText="CardNumber" SortExpression="CardNumber" />
           <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
           <asp:BoundField DataField="RoomNumber" HeaderText="RoomNumber" SortExpression="RoomNumber" />
           <asp:BoundField DataField="Block" HeaderText="Block" SortExpression="Block" />
           <asp:BoundField DataField="Department" HeaderText="Department" SortExpression="Department" />
           <asp:BoundField DataField="PhoneNumber" HeaderText="PhoneNumber" SortExpression="PhoneNumber" />
           <asp:TemplateField HeaderText="Picture" SortExpression="Picture">
               <EditItemTemplate>
                   <asp:Image ID="myImg" runat="server"  ImageUrl='<%# Bind("Picture") %>' Width="100" Height="100" />
                  <asp:FileUpload ID="myload" runat="server" /> <asp:Button ID="btn" runat="server" Text="Upload" OnClick="btn_Click"  CausesValidation="false"/>
               
               </EditItemTemplate>
               <ItemTemplate>
                  
                   <asp:Image ID="Image2" runat="server" ImageUrl='<%# Bind("Picture") %>' Width="100" Height="100" />
               </ItemTemplate>
           </asp:TemplateField>
           <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false" />
       </Fields>
    </asp:DetailsView>

      

        

    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DeleteMethod="DeleteMember" InsertMethod="InsertMember"  SelectMethod="SingleMember" TypeName="MessManagement.Controller" UpdateMethod="UpdateMember">
        <DeleteParameters>
            <asp:Parameter Name="CardNumber" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="CardNumber" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="RoomNumber" Type="String" />
            <asp:Parameter Name="Block" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="gvMember" DefaultValue="0" Name="CardNumber" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="CardNumber" Type="Int32" />
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="RoomNumber" Type="String" />
            <asp:Parameter Name="Block" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="PhoneNumber" Type="String" />
            <asp:Parameter Name="Picture" Type="String" />
        </UpdateParameters>
    </asp:ObjectDataSource>

        </ContentTemplate>
        <Triggers>

            <asp:PostBackTrigger ControlID="dvMember"  />
            <asp:AsyncPostBackTrigger ControlID="gvMember" EventName="SelectedIndexChanged" />
        </Triggers>
    </asp:UpdatePanel>
  

</div>