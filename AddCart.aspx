<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage.master" AutoEventWireup="true" CodeFile="AddCart.aspx.cs" Inherits="AddCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br />
<!--Section: Block Content-->
<section>

  <!--Grid row-->
  <div class="row">

    <!--Grid column-->
    <div class="col-lg-8">

      <!-- Card -->
      <div class="mb-3">
        <div class="pt-4 wish-list">

<h5 class="text-danger font-weight-bold">My Cart (<span><asp:Label ID="LCount" runat="server" Text="0"></asp:Label></span> Books)</h5>
<a href="#">Continue Shopping</a><br />
<asp:Repeater ID="R1" runat="server">
<ItemTemplate>
          <div class="row mb-4" style="margin-bottom:10px;border:solid 1px #ccc">
            <div class="col-md-5 col-lg-3 col-xl-3">
              <div class="view zoom overlay z-depth-1 rounded mb-3 mb-md-0">
                <img class="img-fluid w-75" src="images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %>.jpg" alt="Sample">
                
              </div>
            </div>
            <div class="col-md-7 col-lg-9 col-xl-9">
              <div>
                <div class="d-flex justify-content-between">
                  <div>
                    <h5 class="cartView"><%#Eval("BName") %></h5>
                    <span class="bookOrgPrice"><%#Eval("BSPrice") %></span>&nbsp;
                    <span class="bookDisc">(Rs.<%#Eval("BDisc") %> Off)</span>
                    <h6 class="font-weight-bold"><%#Eval("BPrice") %></h6>
                     <span><b>Quantity:</b> <%#Eval("BQty") %></span>
                  </div>
                </div>
                <div class="d-flex justify-content-between align-items-center">
                  <div><br />
                    <a href="delete_cart.aspx?BID=<%#Eval("BID") %>" type="button" class="btn btn-danger mr-3">Remove</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <hr class="mb-4">
</ItemTemplate>
</asp:Repeater>
         <br /> <p class="text-primary mb-0"><i class="fa fa-info-circle mr-1"></i> Do not delay the purchase, adding items to your cart does not mean booking them.</p>
        <br /><h5>Expected Shipping Delivery within 10-15 Working Days</h5>
        </div>
      </div>
   </div>
    <!--Grid column-->

    <!--Grid column-->
    <div class="col-lg-4">

      <!-- Card -->
      <div class="mb-3">
        <div class="pt-4">
          <h4 class="mb-3"><b>Price Details</b></h4>
          <ul class="list-group list-group-flush">
            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">Cart Price
              <span><asp:Label ID="LP" runat="server" Text=""></asp:Label></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center px-0">
              Cart Discount
              <span>- <asp:Label ID="LD" runat="server" Text=""></asp:Label></span>
            </li>
            <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
              <div>
                <strong>Total Amount</strong>
              </div>
              <span><strong>
                  <asp:Label ID="LT" runat="server" Text=""></asp:Label></strong></span>
            </li>
          </ul>
           <asp:Button ID="CheckoutBtn" CssClass="btn btn-success btn-block" runat="server" Text="Checkout" OnClick="CheckoutBtn_Click" />
        </div>
      </div>
    </div>
    <!--Grid column-->

  </div>
  <!-- Grid row -->

</section>
<!--Section: Block Content-->
       <%-- <div class="col-sm-4">
          <div>
              <h5 style="font-weight:bold" >PRICE DETAILS</h5>
              <div>
                  <label><b>Cart Price</b></label>
                  <span class="pull-right"><asp:Label runat="server" Text=""></asp:Label></span>                      
              </div>
              <div>
                  <label><b>Cart Discount</b></label>
                  <span class="pull-right">- <asp:Label runat="server" Text=""></asp:Label></span>
              </div>
            <div style="border-top:2px solid #ccc;">
               <label class="font-weight-bold">Total</label>
               <span class="pull-right text-primary font-weight-bold"><asp:Label  runat="server" Text=""></asp:Label></span>
            </div> 
        <asp:Button ID="BuyBtn" CssClass="btn btn-success" runat="server" Text="Checkout" />
          </div>
        </div>--%>
</asp:Content>

