<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgetPassword.aspx.cs" Inherits="ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forget Password</title>
     <meta charset="utf-8"/>
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/script1.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../css/style1.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="wrapper">
        <h2>Enter Email to reset <br /> your password</h2>
            <div class="input-name">
                <i class="fa fa-envelope email"></i>
                <asp:TextBox ID="resetemail" CSSclass="text-name" placeholder="Email" runat="server" ClientIDMode="Static" TextMode="Email"></asp:TextBox>
            </div>
             <div class="spell">
              <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#D33B33" NavigateUrl="~/login/register.aspx">Create an Account</asp:HyperLink>
             </div>
       <div class="bttn">
        <asp:Button ID="ForgetBtn" runat="server" CssClass="button" Text="Send" OnClick="ForgetBtn_Click" ClientIDMode="Static" />
       </div>
            </div>
        </div>
    </form>
</body>
</html>
