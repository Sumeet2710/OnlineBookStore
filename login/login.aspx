<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="utf-8"/>
     <meta http-equiv="X-UA-Compatible" content="IE=edge"/>

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1"/> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/script.js"></script>
    <script src="../js/script1.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../css/style.css" />
    <link rel="stylesheet" href="../css/style1.css" />
    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <br />
     <div class="wrapper">
    <h3 style="text-align:center">Login</h3>
    <div class="container">
            <div class="input-name">
                <i class="fa fa-user lock"></i>
                <asp:TextBox ID="usrid" CSSclass="text-name" placeholder="UserName" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="input-name">
                <i class="fa fa-lock lock"></i> 
                <asp:TextBox ID="password" CSSclass="text-name" placeholder="Password" runat="server" ClientIDMode="Static" TextMode="Password"></asp:TextBox>
            </div>
               <asp:HyperLink ID="forgetpass" runat="server" NavigateUrl="~/login/ForgetPassword.aspx"  ForeColor="#D33B33" CssClass="spell">Forget Password?</asp:HyperLink>
        <div class="bttn">
        <asp:Button ID="loginbtn" Class="login" CssClass="button" runat="server" Text="Login" ClientIDMode="Static" OnClick="loginbtn_Click"/>
        </div>
        <div class="divider"></div>
         <div class="spell">
        <asp:Label ID="Label1" runat="server" ForeColor="#999999" Text="Not Registered?"></asp:Label>
&nbsp;  <asp:HyperLink ID="HyperLink1" runat="server" ForeColor="#D33B33" NavigateUrl="~/login/register.aspx">Create an Account</asp:HyperLink>
            </div>
        </div>
           </div>
    </div>
    </form>
</body>
</html>
