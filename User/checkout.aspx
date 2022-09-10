<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserHomemaster.master" AutoEventWireup="true" CodeFile="checkout.aspx.cs" Inherits="User_checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br /><br />
<div class="container">
<%--<div class="py-5">
    <h2>Checkout</h2>
 </div>--%>

  <div class="row">
    <div class="col-md-4 order-md-2 mb-4">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="text-danger font-weight-bold">Your cart</span>
        <span class="badge badge-danger badge-pill"><asp:Label ID="LCount" runat="server" Text="Label"></asp:Label></span>
      </h4>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between bg-danger text-light">
          <div>
            <h5 class="my-0">Price Details</h5>
          </div>
        </li>
       
        <li class="list-group-item d-flex justify-content-between lh-condensed">
          <div>
            <h6 class="my-0">Cart Price</h6>
          </div>
          <span class="text-muted">&#8377;<asp:Label ID="LP" runat="server" Text=""></asp:Label></span>
        </li>
        <li class="list-group-item d-flex justify-content-between bg-light">
          <div class="text-success">
            <h6 class="my-0">Discount</h6>
          </div>
          <span class="text-success">- &#8377;<asp:Label ID="LD" runat="server" Text=""></asp:Label></span>
        </li>
        <li class="list-group-item d-flex justify-content-between">
          <h6>Total Amount Payable</h6>
          <strong>&#8377;<asp:Label ID="LT" runat="server" Text=""></asp:Label></strong>
        </li>
      </ul>
    </div>
    <div class="col-md-8 order-md-1">
      <h4 class="mb-3 text-danger">Billing Address</h4>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">First name</label>
              <asp:TextBox ID="Fname" runat="server" CssClass="form-control" required="required"></asp:TextBox>
                </div>
          <div class="col-md-6 mb-3">
            <label for="lastName">Last name</label>
           <asp:TextBox ID="Lname" runat="server" CssClass="form-control" required="required"></asp:TextBox>
          </div>
        </div>

        <div class="mb-3">
          <label for="username">Contact</label>
          <div class="input-group">
            <asp:TextBox ID="contact" runat="server" CssClass="form-control" required="required"></asp:TextBox>
        </div>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="danger" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Please Enter Proper Contact Number" ControlToValidate="contact" ValidationGroup="check" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>
        <div class="mb-3">
          <label for="altcontact">Alternate Contact</label> <small class="text-muted">(Optional)</small>
          <div class="input-group">
            <asp:TextBox ID="altcontact" runat="server" CssClass="form-control"></asp:TextBox>
            </div>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" CssClass="danger" ValidationExpression="^[0-9]{10}$" runat="server" ErrorMessage="Please Enter Proper Alternate Number" ControlToValidate="altcontact" ValidationGroup="check" Display="Dynamic"></asp:RegularExpressionValidator>
        </div>

        <div class="mb-3">
          <label for="email">Email</label>
          <asp:TextBox ID="email" runat="server" CssClass="form-control" TextMode="Email" required="required"></asp:TextBox>
        </div>

        <div class="mb-3">
          <label for="address">Address <span class="text-muted">(Apartment Name, Building Name)</span></label>
          <asp:TextBox ID="address" runat="server" CssClass="form-control" TextMode="MultiLine" required="required"></asp:TextBox>
        </div>

        <div class="row">
          <div class="col-md-5 mb-3">
            <label for="country">State</label>
            <asp:TextBox ID="state" runat="server" CssClass="form-control" required="required"></asp:TextBox>
          </div>
          <div class="col-md-4 mb-3">
            <label for="state">City</label>
           <asp:TextBox ID="city" runat="server" CssClass="form-control" required="required"></asp:TextBox>
          </div>
             <div class="col-md-3 mb-3">
            <label for="land">Landmark<span class="text-muted"> (Optional)</span></label>
            <asp:TextBox ID="Landmark" runat="server" CssClass="form-control"></asp:TextBox>
           </div>
          <div class="col-md-3 mb-3">
            <label for="zip">ZipCode</label>
            <asp:TextBox ID="zipcode" runat="server" CssClass="form-control" required="required"></asp:TextBox>
           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" CssClass="danger" ValidationExpression="^[0-9]{6}$" runat="server" ErrorMessage="Please Enter Proper Zipcode" ControlToValidate="zipcode" ValidationGroup="check" Display="Dynamic"></asp:RegularExpressionValidator>
          </div>
        </div>
        <hr class="mb-4">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="same-address">
          <label class="custom-control-label" for="same-address">Shipping address is the same as my billing address</label>
        </div>
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="save-info">
          <label class="custom-control-label" for="save-info">Save this information for next time</label>
        </div>
        <hr class="mb-4">

        <h4 class="mb-3">Payment</h4>

        <div class="d-block my-3">
          <div>
            <asp:RadioButton ID="cashRadio" runat="server" GroupName="payment" Checked="true" /> Cash On Delivery
          </div>
          <div>
            <asp:RadioButton ID="onlineRadio" runat="server" GroupName="payment" /> Online Payment
          </div>
        </div>      
        <hr class="mb-4">
         <asp:Button ID="checkoutBtn" CssClass="btn btn-primary btn-lg btn-block" runat="server" Text="Continue to checkout" ValidationGroup="check" OnClick="checkoutBtn_Click"/>
    </div>
  </div>
</div>
</asp:Content>

