<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="viewRequest.aspx.cs" Inherits="Admin_viewReques" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br />

    <div class="container col-lg-12">
  <div class="table-responsive-sm">
   <table class="table table-hover table-bordered" style="margin-top:10px;">
     <thead class="thead-dark">
     <tr>
      <th scope="col">Book Name</th>
      <th scope="col">Book ISBN</th>
      <th scope="col">Book Author</th>
      <th scope="col">Book Quantity</th>
      <th scope="col">Email</th>
      <th scope="col">Contact</th>
    </tr>
  </thead>
<asp:Repeater ID="RptTable" runat="server">
<ItemTemplate>
  <tbody>
    <tr>
      <td><%#Eval("BName") %></td>
      <td><%#Eval("BISBN") %></td>
      <td><%#Eval("BAuthor") %></td>
      <td><%#Eval("Qty") %></td>
      <td><%#Eval("Email") %></td>
      <td><%#Eval("contact") %></td>
    </tr>
  </tbody>
      </ItemTemplate>
 </asp:Repeater>
</table>
    </div>
 </div>

</asp:Content>

