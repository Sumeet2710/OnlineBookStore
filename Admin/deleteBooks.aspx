<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="deleteBooks.aspx.cs" Inherits="Admin_deleteBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br />
 <div class="container col-lg-12">
 <asp:Button ID="addbook" runat="server" CssClass="btn btn-success" Text="+Add Books" OnClick="addbook_Click" />
  <div class="table-responsive-sm">
   <table class="table table-hover table-bordered" style="margin-top:10px;">
     <thead class="thead-dark">
     <tr>
      <th scope="col">BID</th>
      <th scope="col">Title</th>
      <th scope="col">Author</th>
      <th scope="col">Publisher</th>
      <th scope="col">ISBN</th>
      <th scope="col">Category</th>
      <th scope="col">Price</th>
      <th scope="col">Selling Price</th>
      <th scope="col">Discount</th>
      <th scope="col">Release Date</th>
      <th scope="col">Image</th>
      <th scope="col">Description</th>
      <th scope="col">Delete/Update</th>
    </tr>
  </thead>
<asp:Repeater ID="RptTable" runat="server">
<ItemTemplate>
  <tbody>
    <tr>
      <td><%#Eval("BID") %></td>
      <td><%#Eval("BName") %></td>
      <td><%#Eval("BAuthor") %></td>
      <td><%#Eval("BPublish") %></td>
      <td><%#Eval("BISBN").ToString().Length>=5?Eval("BISBN").ToString().Substring(0,5):Eval("BISBN").ToString() %></td>
      <td><%#Eval("BCatName") %></td>
      <td><%#Eval("BPrice") %></td>
      <td><%#Eval("BSPrice") %></td>
      <td><%#Eval("BDisc") %></td>
      <td><%#Eval("BRelease") %></td>
      <td><img width="60" height="90" src="../images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %><%#Eval("BExtension") %>" /></td>
      <td><%#Eval("BDescription").ToString().PadRight(90).Substring(0,50).TrimEnd() %></td>
     <td>
     <br />
        <a href="update.aspx?id=<%#Eval("BID") %>" role="button" class="btn btn-primary">Edit</a><div style="margin-top:5px;"><a href="delete.aspx?id=<%#Eval("BID") %>" role="button" class="btn btn-danger">Delete</a></div>
  
     </td>
      </tr>
  </tbody>
      </ItemTemplate>
 </asp:Repeater>
</table>
    </div>
 </div>
</asp:Content>

