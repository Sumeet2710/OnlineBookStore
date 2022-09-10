<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserHomemaster.master" AutoEventWireup="true" CodeFile="ReqBookUsr.aspx.cs" Inherits="User_ReqBookUsr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br />
 <div class="container imp">
    <div class="wrapper">
    <h3 class="text-danger" style="border-bottom:solid 2px">Request a Book</h3>
    <h6>Please fill up the form below to Request a Book. We will informed you as soon as book available.</h6>
        <label class="col-xs-11">Book Title</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookname" runat="server" CssClass="form-control" placeholder="Book Title"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="danger" ErrorMessage="Title Field is Required" ControlToValidate="bookname" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">ISBN</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookisbn" runat="server" MaxLength="13" CssClass="form-control" placeholder="Book ISBN" TextMode="Number"></asp:TextBox>
        <asp:Label ID="bisbn" runat="server" Text="" CssClass="text-danger" Font-Bold="true"></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="danger" ErrorMessage="ISBN Field is Required" ControlToValidate="bookisbn" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label ID="isbn" runat="server" CssClass="text-danger" Text=""></asp:Label>
       </div>
        <label class="col-xs-11">Author:</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookauthor" runat="server" CssClass="form-control" placeholder="Book Author"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="danger" ErrorMessage="Author Field is Required" ControlToValidate="bookauthor" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
       <label class="col-xs-11">Quantity:</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookquantity" runat="server" CssClass="form-control" placeholder="1" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="danger" ErrorMessage="Quantity Field is Required" ControlToValidate="bookquantity" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
         <asp:Label ID="quant" runat="server" Text="" CssClass="text-danger" Font-Bold="true"></asp:Label>
       </div>
        <label class="col-xs-11">Email ID:</label>
        <div class="col-xs-11">
        <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="danger" ErrorMessage="Email Field is Required" ControlToValidate="email" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Phone No.:</label>
        <div class="col-xs-11">
        <asp:TextBox ID="cont" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="danger" ErrorMessage="Contact Field is Required" ControlToValidate="cont" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="danger" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Please Enter Proper Contact Number" ControlToValidate="cont" ValidationGroup="req" Display="Dynamic"></asp:RegularExpressionValidator>
    </div>
        <div class="col-xs-11 space-vert">
        <asp:Button ID="ReqBookBtn" runat="server" Text="Submit" CssClass="btn btn-danger" ValidationGroup="req" OnClick="requestBtn_Click" />
         </div>
        </div>
        </div>
</asp:Content>

