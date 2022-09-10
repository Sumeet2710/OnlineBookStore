<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <meta name="viewport" content="width=device-width, initial-scale=1"/> 

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="../js/script1.js"></script>
    <script src="../js/script.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous"/>
    <link rel="stylesheet" href="../css/style1.css" />
    <link rel="stylesheet" href="../css/style.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server" ClientIDMode="Static">
    <br /> 
    <div class="wrapper">
    <h3>User Registration Form</h3>
    <div class="container">
            <div class="input-name">
                <i class="fa fa-user lock"></i>
                <asp:TextBox ID="usrid" CSSclass="text-name" placeholder="UserID" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="input-name">
                <i class="fa fa-lock lock"></i> 
                <asp:TextBox ID="password" CSSclass="text-name" placeholder="Password" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
         <div class="input-name">
                <i class="fa fa-lock lock"></i>
                <asp:TextBox ID="password1" CSSclass="text-name" placeholder="Confirm Password" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
          <asp:Label ID="passlbl" runat="server" CssClass="danger"></asp:Label>
            <div class="input-name">
                <i class="fa fa-user lock"></i>
                <asp:TextBox ID="firstname" CSSclass="name" placeholder="First Name" runat="server" ClientIDMode="Static"></asp:TextBox>
                <span>
                <i class="fa fa-user lock"></i>
                <asp:TextBox ID="lastname" CSSclass="name" placeholder="Last Name" runat="server" ClientIDMode="Static"></asp:TextBox>
                </span>
            </div>
             <div class="input-name">
                <i class="fa fa-phone lock"></i>
                <asp:TextBox ID="contact" CSSclass="text-name" placeholder="Contact" runat="server" TextMode="Number" ClientIDMode="Static"></asp:TextBox> 
            </div>
            <div class="input-name">
                <i class="fa fa-envelope email"></i>
                <asp:TextBox ID="mail" CSSclass="text-name" placeholder="Email" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
            <div class="input-name">
                <asp:Button ID="registerbtn" CssClass="button" runat="server" Text="Register" OnClick="registerbtn_Click" />
                <asp:Button ID="clearbtn" CssClass="button" runat="server" Text="Clear" OnClick="clearbtn_Click" />
            </div>
    </div>
           </div>

</asp:Content>

