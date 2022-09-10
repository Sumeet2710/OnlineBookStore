<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="SearchBook.aspx.cs" Inherits="SearchBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container">
        <div class="bookHead">
        <h5><b>Searched Results are: <%#Eval("BName") %></b></h5></div>
        <div class="row">
            <asp:Repeater ID="RepeatBooks" runat="server">
                <ItemTemplate>      
                    <div class="col-md-3 col-sm-6 col-xs-12 product-grid">
				<div class="image">
					<a href="BookDetails.aspx?bid=<%#Eval("BID") %>">
						<img src="images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %><%#Eval("BExtension") %>" alt="<%#Eval("BName") %>" class="img-thumbnail">
						<div class="overly">
							<div class="detail">View Details</div>
						</div>
					</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
				<div class="bookName"><a href="BookDetails.aspx?bid=<%#Eval("BID") %>"><%#Eval("BName") %></a></div>
                <div class="bookAuthor"><%#Eval("BAuthor") %></div>
				<div class="bookPrice"><span class="bookOrgPrice"><%#Eval("BPrice") %></span> <%#Eval("BSPrice") %><span class="bookDisc"> (Rs.<%#Eval("BDisc") %>Off)</span></div>
				<br /><a class="btn btn-primary" href="#" role="button">Buy Book</a>
                </div>
              </ItemTemplate>
          </asp:Repeater>
          </div>
             </div>
</asp:Content>

