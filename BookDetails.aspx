<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br />
 
<div class="container">
  <div class="row">
<asp:Repeater ID="RepeatBooks" runat="server">
    <ItemTemplate>      
    <div class="col-md-6">
          <div class="image" style="max-width:450px;"> <img class="d-block w-100" src="images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %><%#Eval("BExtension") %>" alt="<%#Eval("BName") %>" /> </div>
        </div>
    <div class="col-md-6">
      <div class="row">
        <h2 class="bookNameView" style="margin-top:20px;"><%#Eval("BName") %></h2>
      </div>
     <hr class="bg-dark mb-4 mt-0 d-inline-block mx-auto" style="width: 100px; height: 3px"/>
        
    <div class="row">
       <h4 class="bookOrgPriceView"><i class="fa fa-inr" aria-hidden="true"></i><%#Eval("BPrice") %></h4>
    </div>
     <div class="row">
       <h4 class="bookPriceView"><i class="fa fa-inr" aria-hidden="true"></i><%#Eval("BSPrice") %></h4>&nbsp;
       <h6 class="bookDiscView">(Rs.<%#Eval("BDisc") %> Off)</h6>
     </div>
      <h6 class="bookAuthorView" style="margin-top:15px;"><i class="fa fa-pencil-square-o" style="font-size:15px;" aria-hidden="true"></i> <b>Author:</b> &nbsp;<%#Eval("BAuthor") %></h6>
      <h6 class="bookPublishView"><i class="fa fa-building-o" style="font-size:15px;" aria-hidden="true"></i>  <b> Publisher:</b> &nbsp;<%#Eval("BPublish") %></h6>
      <h6 class="bookPublishView"><i class="fa fa-barcode" style="font-size:15px;" aria-hidden="true"></i> <b> ISBN:</b> &nbsp;<%#Eval("BISBN") %></h6>
      <h6 class="bookPublishView"><i class="fa fa-calendar" style="font-size:15px;" aria-hidden="true"></i> <b> Release Date:</b> &nbsp;<%#Eval("BRelease").ToString().Length>=10?Eval("BRelease").ToString().Substring(0,10):Eval("BRelease").ToString() %></h6><br />
      <div class="row">
        <h6><i class="fa fa-map-marker text-info" aria-hidden="true"></i>&nbsp; Delivery by 10-12 Working Days |&nbsp;<span class="text-success">FREE</span></h6> 
      </div><br />
     <div class="row" style="border-bottom:solid #a9a9a9 2px;"></div> 

    <div class="row">
        <h6 class="bookDesc"><b>About this Book:</b></h6>
        <p style="color:#000;font-family:sans-serif;font-size:15px;line-height:28px;"><%#Eval("BDescription") %></p>
    </div>
   <div class="row" style="border-top:dashed #a9a9a9 2px;"> </div><br />
    <h6 class="stk"><b><i class="fa fa-check-circle text-danger" style="font-size:21px;" aria-hidden="true"></i> Available:</b> In Stock</h6>
    <h6 class="stk"><b><i class="fa fa-check-circle text-danger" style="font-size:21px;" aria-hidden="true"></i> Category:</b> <%#Eval("BCatName") %></h6>
    <h6 class="stk"><b><i class="fa fa-check-circle text-danger" style="font-size:21px;" aria-hidden="true"></i> Shipping Area:</b> All over India</h6>
    <h6 class="stk"><b><i class="fa fa-check-circle text-danger" style="font-size:21px;" aria-hidden="true"></i> Shipping Fee:</b> Free</h6>      
 </div>
   </ItemTemplate>
</asp:Repeater>
  </div>
</div>
<table class="table table-borderless">
  <tbody>
    <tr>
      <td><div class="row" style="margin-left:60px;"><h6 class="bookPublishView"><b>Quantity:</b></h6>&nbsp;
         <asp:DropDownList ID="DropDownList1" runat="server" Height="25px">
             <asp:ListItem>1</asp:ListItem>
             <asp:ListItem>2</asp:ListItem>
             <asp:ListItem>3</asp:ListItem>
             <asp:ListItem>4</asp:ListItem>
             <asp:ListItem>5</asp:ListItem>
             <asp:ListItem>6</asp:ListItem>
             <asp:ListItem>7</asp:ListItem>
             <asp:ListItem>8</asp:ListItem>
             <asp:ListItem>9</asp:ListItem>
             <asp:ListItem>10</asp:ListItem>
         </asp:DropDownList> &nbsp;
        <asp:Label ID="Label1" CssClass="danger" Font-Bold="true" runat="server" Text=""></asp:Label>
    </div>
      </td>
       
    </tr>
    <tr>
     <td><div class="row" style="margin-left:60px;">
   <a class="btn btn-danger"><asp:Button ID="buyBtn" runat="server" OnClick="buyBtn_Click" Text="Buy Book" CssClass="btn btn-danger" ClientIDMode="Static" /></a>
   <a class="btn btn-secondary" style="margin-left:10px;"><i class="fa fa-shopping-cart" style="color:#fff" aria-hidden="true"></i><asp:Button ID="cartBtn" runat="server" OnClick="cartBtn_Click" Text="Add Cart" CssClass="btn btn-secondary" ClientIDMode="Static" /></a>
 </div></td>
    </tr>
   </tbody>
</table>


</asp:Content>

