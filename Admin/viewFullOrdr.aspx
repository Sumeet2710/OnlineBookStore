<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" 
    CodeFile="viewFullOrdr.aspx.cs" Inherits="Admin_viewFullOrdr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br /><br />

 <asp:Repeater ID="Repeater2" runat="server">
   <ItemTemplate>
<table class="table table-bordered">
  <thead class="table-dark">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">Address</th>
      <th scope="col">Contact</th>
      <th scope="col">Email</th>
      <th scope="col">Payment Mode</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><%#Eval("id") %></td>
      <td><%#Eval("fname") %> <%#Eval("lname") %></td>
      <td><%#Eval("addr") %><br /><%#Eval("state") %>, <%#Eval("city") %>- <%#Eval("zipcode") %></td>
      <td><%#Eval("cont") %></td>
      <td><%#Eval("email") %></td>
      <td><%#Eval("payment") %></td>
    </tr>  
  </tbody>
</table>
</ItemTemplate>
</asp:Repeater>
<br />

<asp:Repeater ID="Repeater1" runat="server">
  <ItemTemplate>
  <table class="table table-bordered">
   <thead class="table-dark">
    <tr>
      <th scope="col">Book Image</th>
      <th scope="col">Book Name</th>
      <th scope="col">Book Price</th>
      <th scope="col">Book Quantity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img src="../images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %>.jpg" height="150" width="100" /></td>
      <td><%#Eval("BName") %></td>
      <td><%#Eval("BAmount") %></td>
      <td><%#Eval("BQty") %></td>
    </tr>  
  </tbody>
</table>
  </ItemTemplate>
</asp:Repeater>

<table class="table table-bordered">
   <thead class="table-dark">
    <tr>
     <th style="text-align:right;"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></th>
    </tr>
   </thead>
</table>
<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>

