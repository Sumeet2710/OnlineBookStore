<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="contus.aspx.cs" Inherits="contus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="wrapper">
    <h4 style="padding-bottom:5px; border-bottom: solid gray 1.5px;margin-bottom:10px"><b>Contact Us</b></h4>
       <h6>We Love to hear you!</h6>
            <div class="input-name">
                <i class="fa fa-user lock"></i>
                <asp:TextBox ID="fullname" CSSclass="text-name" placeholder="Full Name" runat="server" ClientIDMode="Static"></asp:TextBox>
            </div>
       <div class="input-name">
                <i class="fa fa-envelope email"></i>
                <asp:TextBox ID="mail" CSSclass="text-name" placeholder="Email" runat="server" ClientIDMode="Static" TextMode="Email"></asp:TextBox>
       </div>
        <div class="input-name">
            <i class="fa fa-phone lock"></i>
            <asp:TextBox ID="contact" CSSclass="text-name" placeholder="Contact" runat="server" TextMode="Phone" ClientIDMode="Static"></asp:TextBox>
            <asp:Label ID="contlbl" runat="server" Text="" CssClass="text-danger" Font-Bold="true"></asp:Label>
        </div>
      <div class="input-name">
        <label class="col-xs-11"><b>Choose Subject</b></label>
        <div class="col-xs-11">
         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="danger" ErrorMessage="Please Select the Category" ControlToValidate="complaint" ValidationGroup="com" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
        <asp:DropDownList ID="complaint" CssClass="form-control" runat="server">
            <asp:ListItem>Payment Related</asp:ListItem>
            <asp:ListItem>Order Related</asp:ListItem>
            <asp:ListItem>Courier Related</asp:ListItem>
            <asp:ListItem>Corporate Order/Bulk Sale</asp:ListItem>
            <asp:ListItem>Return or Replacement</asp:ListItem>
            <asp:ListItem>Features,Suggesstions & Feedback</asp:ListItem>
            <asp:ListItem>Any Other</asp:ListItem>
            </asp:DropDownList>
       </div>
       </div>

       <div class="msg">
            <span style="margin-left:22px; margin-bottom:10px;font-weight:550;">Write Message:</span>
            <asp:TextBox ID="msgbox" CSSclass="text-name" placeholder="Write Your Message" runat="server" TextMode="MultiLine" ClientIDMode="Static"></asp:TextBox>
           </div>
       <asp:Label ID="labelval" runat="server" ClientIDMode="Static"></asp:Label>
      <div class="input-name">
                <asp:Button ID="submitbtn" CssClass="btn btn-danger" runat="server" Text="Submit" OnClick="submitbtn_Click" ValidationGroup="com" />
            </div>
        </div>
</asp:Content>
