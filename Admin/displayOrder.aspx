<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="displayOrder.aspx.cs" Inherits="Admin_displayOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br /><br />
 <asp:Repeater ID="Repeater1" runat="server">
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
      <th scope="col">View Order</th>
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
      <td style="text-align:center"><a href="viewFullOrdr.aspx?id=<%#Eval("id") %>"><i style="font-size:50px" class="fa fa-arrow-circle-o-right fa-View Orders" aria-hidden="true"></i></a></td>
    </tr>  
  </tbody>
</table>
<br />
</ItemTemplate>
</asp:Repeater>
</asp:Content>

