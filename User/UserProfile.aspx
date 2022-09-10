<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserHomemaster.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="User_UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br />
   <div class="wrapper">
       <div style="text-align:center;font-size:80px;margin-bottom:30px;" class="text-danger"><i class="fa fa-user-circle-o" aria-hidden="true"></i></div>
<asp:Repeater ID="RepeatUsr" runat="server">
<ItemTemplate>
<table class="table table-borderless" style="text-align:center">
  <tbody>
    <tr>
      <td class="font-weight-bold">UserID:</td>
      <td><%#Eval("usrID") %></td>
    </tr>
    <tr>
      <td class="font-weight-bold">Full Name:</td>
      <td><%#Eval("fname") %> <%#Eval("lname") %></td>
    </tr>
    <tr>
      <td class="font-weight-bold">Phone No.:</td>
      <td><%#Eval("cont") %></td>
    </tr>
    <tr>
      <td class="font-weight-bold">Email.:</td>
      <td><%#Eval("email") %></td>
    </tr>
    <tr>
     <td class="font-weight-bold">Registration Date:</td>
     <td><%#Eval("date").ToString().Length>=10?Eval("date").ToString().Substring(0,10):Eval("date").ToString() %></td>
    </tr>
  </tbody>
</table>
 </ItemTemplate>
</asp:Repeater>
<a href="../login/ForgetPassword.aspx">Click Here to change your Password</a>
   </div>

</asp:Content>

