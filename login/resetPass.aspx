<%@ Page Language="C#" AutoEventWireup="true" CodeFile="resetPass.aspx.cs" Inherits="resetPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password</title>
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
        <h2>Reset Password</h2>
            <div class="input-name">
                <i class="fa fa-lock lock"></i>
                <asp:TextBox ID="newpass" CSSclass="text-name" placeholder="New Password" runat="server" ClientIDMode="Static" required="required"></asp:TextBox>
            </div>
             <div class="input-name">
                <i class="fa fa-lock lock"></i>
                <asp:TextBox ID="confirmpass" CSSclass="text-name" placeholder="Confirm Password" runat="server" ClientIDMode="Static" required="required"></asp:TextBox>
            </div>
      <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
       <div class="bttn">
        <asp:Button ID="passChange" runat="server" CssClass="button" OnClick="passChange_Click" Text="Send" ClientIDMode="Static" />
       </div>
            </div>
    </div>
    </form>
</body>
</html>
