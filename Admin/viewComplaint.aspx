<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="viewComplaint.aspx.cs" Inherits="Admin_viewComplaint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br />
 <div class="container col-lg-12">
  <div class="table-responsive-sm">
   <table class="table table-hover table-bordered" style="margin-top:10px;">
     <thead class="thead-dark">
     <tr>
      <th scope="col">Full Name</th>
      <th scope="col">Email</th>
      <th scope="col">Contact</th>
      <th scope="col">Complaint</th>
      <th scope="col">Reason</th>
    </tr>
  </thead>
<asp:Repeater ID="RptTable" runat="server">
<ItemTemplate>
  <tbody>
    <tr>
      <td><%#Eval("FName") %></td>
      <td><%#Eval("Email") %></td>
      <td><%#Eval("Cont") %></td>
      <td><%#Eval("Complaint") %></td>
      <td><%#Eval("Reason") %></td>
    </tr>
  </tbody>
      </ItemTemplate>
 </asp:Repeater>
</table>
    </div>
 </div>
</asp:Content>

