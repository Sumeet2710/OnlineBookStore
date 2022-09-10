<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaymentCallBack.aspx.cs" Inherits="User_PaymentCallBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
  
</head>
<body>
    <form id="form1" runat="server">
    <div style="background-color:#D3D3D3"><br /><br /><br /><br />
    <h1 runat="server" id="h1Message"></h1>
    <p runat="server" id="pTxnId"></p>
    <asp:Label ID="LName" runat="server" Text=""></asp:Label>
   <asp:Button ID="Home" runat="server" CssClass="btn btn-success" Text="Go Home" Visible="false"  />
   <asp:Button ID="Details" runat="server" CssClass="btn btn-success" Text="View Order" Visible="false" />
   <br /><br /><br /> <br />
    
    </div>
    </form>
</body>
</html>
