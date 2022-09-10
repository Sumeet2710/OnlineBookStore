<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="ViewUser.aspx.cs" Inherits="Admin_ViewUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br />
 <div class="container col-lg-12">
  <div class="table-responsive-sm">
   <table class="table table-hover table-bordered" style="margin-top:10px;">
     <thead class="thead-dark">
     <tr>
      <th scope="col">User ID</th>
      <th scope="col">First Name</th>
      <th scope="col">Last Name</th>
      <th scope="col">Contact No.:</th>
      <th scope="col">Email ID.:</th>
      <th scope="col">Date of Register</th>
    </tr>
  </thead>
<asp:Repeater ID="RptTable" runat="server">
<ItemTemplate>
  <tbody>
    <tr>
      <td><%#Eval("usrID") %></td>
      <td><%#Eval("fname") %></td>
      <td><%#Eval("lname") %></td>
      <td><%#Eval("cont") %></td>
      <td><%#Eval("email") %></td>
      <td><%#Eval("date") %></td>
    </tr>
  </tbody>
      </ItemTemplate>
 </asp:Repeater>
</table>
    </div>
 </div><br /><br /><br /><br />
</asp:Content>

