<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserHomemaster.master" AutoEventWireup="true" CodeFile="orderDetails.aspx.cs" Inherits="User_orderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
body {
background-color: #eee
}
.fs-12 {
    font-size: 12px
}
.fs-15 {
    font-size: 15px
}
.name {    margin-bottom: -2px
}
.product-details {
    margin-top: 13px
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br />
    <div class="container mt-5 mb-5">
 <asp:Panel ID="Panel1" runat="server">
    <div class="d-flex justify-content-center row">
        <div class="col-md-10">
            <div class="receipt bg-white p-3 rounded"><img src="../images/image1.png" width="120">
                <h4 class="mt-2 mb-3"><br />Your Order is Confirmed!</h4>
                <h6 class="font-weight-bold">Hello <asp:Label ID="user" runat="server" Text=""></asp:Label>,</h6><span class="fs-12 text-black-50">Your Order has been Confirmed and will be Shipped in two days</span>
                <hr>
                <div class="d-flex flex-row justify-content-between align-items-center order-details">
                      <div><span class="d-block fs-12">Shipping Address</span>
                      <span class="font-weight-bold"><asp:Label ID="LAddress" runat="server" Text="Label"></asp:Label><br />
                        <asp:Label ID="LCity" runat="server" Text=""></asp:Label> <asp:Label ID="LZipcode" runat="server" Text=""></asp:Label><br />
                        <asp:Label ID="LLandmark" runat="server" Text=""></asp:Label>
                        <asp:Label ID="LState" runat="server" Text=""></asp:Label><br />
                      </span>&nbsp;
                    </div>
                    <div><span class="d-block fs-12">Order Date</span><span class="font-weight-bold"><asp:Label ID="LDate" runat="server" Text="Label"></asp:Label></span></div>&nbsp;
                    <div><span class="d-block fs-12">Order Number</span><span class="font-weight-bold"><asp:Label ID="LOrder" runat="server" Text="Label"></asp:Label></span></div>&nbsp;
                    <div><span class="d-block fs-12">Payment Method</span><span class="font-weight-bold"><asp:Label ID="Lpayment" runat="server" Text="Label"></asp:Label></span></div>&nbsp;
                </div>
                <hr>
                <span>Total Books: <asp:Label ID="LCount" runat="server" Text=""></asp:Label></span>
            <asp:Repeater ID="RepeatOrder" runat="server">
                <ItemTemplate>
                <div class="d-flex justify-content-between align-items-center product-details">
                    <div class="d-flex flex-row product-name-image"><img class="rounded" src="../images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %>.jpg" width="80">
                        <div class="d-flex flex-column justify-content-between ml-2">
                            <div><span class="d-block font-weight-bold p-name"><%#Eval("BName") %></span><span class="fs-12">Quantity: <%#Eval("BQty") %></span></div>
                        </div>
                    </div>
                    <div class="product-price">
                      <h5><span>&#8377;</span><%#Eval("BAmount") %></h5>Per Book
                    </div>
                </div>
                  </ItemTemplate>
                </asp:Repeater>
                
                <div class="mt-5 amount row">
                    <div class="align-items-center col-md-6"><br /><input id="btnPrint" name="btnPrint" type="button" class="btn btn-danger" value="Download/Print Invoice" onclick="window.print()"/></div>
                    <div class="col-md-6">
                        <div class="billing">
                            <div class="d-flex justify-content-between"><span><b>Subtotal</b></span><span class="font-weight-bold text-muted"><asp:Label ID="LP" runat="server" Text="Label"></asp:Label></span></div>
                            <div class="d-flex justify-content-between mt-2"><span>Shipping fee</span><span class="font-weight-bold text-success">FREE</span></div>
                            <div class="d-flex justify-content-between mt-2"><span class="text-success">Discount</span><span class="text-success"><asp:Label ID="LD" runat="server" Text=""></asp:Label></span></div>
                            <hr>
                            <div class="d-flex justify-content-between mt-1"><span class="font-weight-bold">Total:</span><span class="font-weight-bold">&#8377;<asp:Label ID="LT" runat="server" Text=""></asp:Label></span></div>
                        </div>
                    </div>
                </div><span class="d-block">Expected Delivery Date</span><span class="font-weight-bold"><asp:Label ID="LDDate" runat="server" Text="Label"></asp:Label></span><span class="d-block mt-3 text-black-50 fs-15">We will be sending a shipping confirmation email when the item is shipped!</span>
                <hr>
                <div class="d-flex justify-content-between align-items-center">
                    <div class="thanks"><span class="d-block font-weight-bold">Thanks for shopping</span><span>OBS team</span></div>
                    <div class="d-flex flex-column justify-content-end align-items-end"><span class="d-block font-weight-bold">Need Help?</span><span>Call - 991001000</span></div>
                </div>
            </div>
        </div>
    </div>
    </asp:Panel>
</div>
</asp:Content>
