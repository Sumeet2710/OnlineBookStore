<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="addCategory.aspx.cs" Inherits="Admin_addCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="container imp">
    <div class="wrapper">
        <h3 style="border-bottom:solid gray 1.5px;font-family:sans-serif;"><b>Add Category</b></h3>
        <label class="col-xs-11">Name</label>
        <div class="col-xs-11">
        <asp:TextBox ID="catname" runat="server" CssClass="form-control" placeholder="Book Category"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="danger" ErrorMessage="This Field is Required" ControlToValidate="catname" ValidationGroup="add" Display="Dynamic"></asp:RequiredFieldValidator>
        <div class="col-xs-11 space-vert">
        <asp:Button ID="addcatBtn" runat="server" Text="Add Category" CssClass="btn btn-danger" ValidationGroup="add" OnClick="addcatBtn_Click" />
        
    </div>
   </div>
 </div>
</div>
</asp:Content>

