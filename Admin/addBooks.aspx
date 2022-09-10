<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/AdminHomemaster.master" AutoEventWireup="true" CodeFile="addBooks.aspx.cs" Inherits="Admin_addBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br />
    <div class="container imp">
    <div class="wrapper">
        <h3 style="border-bottom:solid gray 1.5px;font-family:sans-serif;"><b>Add Books</b></h3>
        <label class="col-xs-11">Name</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookname" runat="server" CssClass="form-control" placeholder="Book Title"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="danger" ErrorMessage="Title Field is Required" ControlToValidate="bookname" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">ISBN</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookisbn" runat="server" MaxLength="13" CssClass="form-control" placeholder="Book ISBN" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" CssClass="danger" ErrorMessage="ISBN Field is Required" ControlToValidate="bookisbn" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label ID="isbn" runat="server" CssClass="text-danger" Text=""></asp:Label>
       </div>
        <label class="col-xs-11">Author</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookauthor" runat="server" CssClass="form-control" placeholder="Book Author"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="danger" ErrorMessage="Author Field is Required" ControlToValidate="bookauthor" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Publisher</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookpublisher" runat="server" CssClass="form-control" placeholder="Book Publisher"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" CssClass="danger" ErrorMessage="Publisher Field is Required" ControlToValidate="bookpublisher" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Category</label>
        <div class="col-xs-11">
        <asp:DropDownList ID="bookcategory" CssClass="form-control" runat="server"></asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" CssClass="danger" ErrorMessage="Please Select the Category" ControlToValidate="bookcategory" ValidationGroup="req" Display="Dynamic" InitialValue="0"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Price</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookprice" runat="server" CssClass="form-control" placeholder="Book Price" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" CssClass="danger" ErrorMessage="Price Field is Required" ControlToValidate="bookprice" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Selling Price</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookSprice" runat="server" CssClass="form-control" placeholder="Book Selling Price" TextMode="Number"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" CssClass="danger" ErrorMessage="Selling Price Field is Required" ControlToValidate="bookSprice" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Release Date</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookrelease" runat="server" CssClass="form-control" placeholder="Release Date" TextMode="Date"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" CssClass="danger" ErrorMessage="This Field is Required" ControlToValidate="bookrelease" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Description</label>
        <div class="col-xs-11">
        <asp:TextBox ID="bookdesc" runat="server" CssClass="form-control" placeholder="Book Description"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" CssClass="danger" ErrorMessage="Description Field is Required" ControlToValidate="bookdesc" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <label class="col-xs-11">Image</label>
        <div class="col-xs-11">
        <asp:FileUpload ID="bookimg" runat="server" CssClass="form-control" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" CssClass="danger" ErrorMessage="This Field is Required" ControlToValidate="bookimg" ValidationGroup="req" Display="Dynamic"></asp:RequiredFieldValidator>
    </div>
        <div class="col-xs-11 space-vert">
        <asp:Button ID="addbookBtn" runat="server" Text="Add Book" CssClass="btn btn-danger" ValidationGroup="req" OnClick="addbookBtn_Click" />
         </div>
        </div>
        </div>
</asp:Content>

