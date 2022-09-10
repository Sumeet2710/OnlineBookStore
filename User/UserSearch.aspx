<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserHomemaster.master" AutoEventWireup="true" CodeFile="UserSearch.aspx.cs" Inherits="User_UserSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container"><br /><br />
        <div class="bookHead">
        <h5><b><a href="#">Searched Results are:</b></h5></div>
        <div class="row">
            <asp:Repeater ID="RepeatBooks" runat="server">
                <ItemTemplate>      
                    <div class="col-md-3 col-sm-6 col-xs-12 product-grid">
				<div class="image">
					<a href="UserBookDetails.aspx?bid=<%#Eval("BID") %>">
						<img src="../images/Books//<%#Eval("BName") %>/<%#Eval("BImage") %><%#Eval("BExtension") %>" alt="<%#Eval("BName") %>" class="img-thumbnail">
						<div class="overly">
							<div class="detail">View Details</div>
						</div>
					</>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="bookName"><a href="#"><%#Eval("BName") %></a></div>
                <div class="bookAuthor"><%#Eval("BAuthor") %></div>
				<div class="bookPrice"><span class="bookOrgPrice"><%#Eval("BPrice") %></span> <%#Eval("BSPrice") %><span class="bookDisc"> (Rs.<%#Eval("BDisc") %>Off)</span></div>
				<br /><a class="btn btn-primary" href="#" role="button">Buy Book</a>
                </div>
              </ItemTemplate>
          </asp:Repeater>
          </div>
             </div>
</asp:Content>

