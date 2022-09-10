<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/UserHomemaster.master" AutoEventWireup="true" CodeFile="displayOrder.aspx.cs" Inherits="User_displayOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style>
p {
    font-size: 14px;
    margin-bottom: 7px;
}
.small {
    letter-spacing: 0.5px !important
}

.card-1 {
    box-shadow: 2px 2px 10px 0px rgb(190, 108, 170)
}

hr {
    background-color: rgba(248, 248, 248, 0.667)
}
.bold {
    font-weight: 500
}

.change-color {
    color: #d33b33 !important
}
.card-2 {
    box-shadow: 1px 1px 3px 0px rgb(112, 115, 139)
}

.fa-circle.active {
    font-size: 8px;
    color: #AB47BC
}

.fa-circle {
    font-size: 8px;
     color: #aaa
}

.rounded {
    border-radius: 2.25rem !important
}

.progress-bar {
    background-color: #AB47BC !important
}
.progress {
    height: 5px !important;
    margin-bottom: 0
}

.invoice {
    position: relative;
    top: -70px
}

.Glasses {
    position: relative;
    top: -12px !important
}
.card-footer {
    background-color: #AB47BC;
    color: #fff
}

h2 {
    color: rgb(78, 0, 92);
    letter-spacing: 2px !important
}

.display-3 {
    font-weight: 500 !important
}
@media (max-width: 479px) {
    .invoice {
        position: relative;
        top: 7px
    }

    .border-line {
        border-right: 0px solid rgb(226, 206, 226) !important
    }
}
@media (max-width: 700px) {
    h2 {
        color: rgb(78, 0, 92);
        font-size: 17px
    }

    .display-3 {
        font-size: 28px;
        font-weight: 500 !important
    }
}
.card-footer small {
    letter-spacing: 7px !important;
    font-size: 12px
}

.border-line {
    border-right: 1px solid rgb(226, 206, 226)
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"><br /><br /><br /><br />
    <div class="container-fluid my-5 d-flex justify-content-center">
    <div class="card card-1">
        <div class="card-header bg-white">
            <div class="media flex-sm-row flex-column-reverse justify-content-between ">
                <div class="col my-auto">
                    <h4 class="mb-0">Thanks for your Order,<span class="change-color"><asp:Label ID="LUser" runat="server" Text=""></asp:Label></span> !</h4>
                </div>
                <div class="col-auto text-center my-auto pl-0 pt-sm-4"> <img class="img-fluid my-auto align-items-center mb-0 pt-3" src="../images/image1.png" width="115" height="115">
                <br /><br /> <p class="mb-4 pt-0 Glasses text-warning"></p>
                </div>
            </div>
        </div>
 <asp:Repeater ID="Repeater1" runat="server">
     <ItemTemplate>
        <div class="card-body">
            <div class="row justify-content-between mb-3">
                <div class="col-auto">
                    <h6 class="color-1 mb-0 change-color">Receipt</h6>
                </div>
                 <div class="col-auto "> <small>Receipt Voucher : </small> </div>
            </div>
            <div class="row">
                <div class="col">
                    <div class="card card-2">
                        <div class="card-body">
                            <div class="media">
                                <div class="sq align-self-center "> <img class="img-fluid my-auto align-self-center mr-2 mr-md-4 pl-0 p-0 m-0" src="../images/Books/<%#Eval("BName") %>/<%#Eval("BImage") %>.jpg" width="80" height="80" /> </div>
                                <div class="media-body my-auto text-right">
                                    <div class="row my-auto flex-column flex-md-row">
                                        <div class="col my-auto">
                                            <h6 class="mb-0"><%#Eval("BName") %></h6>
                                        </div>
                                        <%--<div class="col-auto my-auto"> <small>Golden Rim </small></div>
                                        <div class="col my-auto"> <small>Size : M</small></div>--%>
                                        <div class="col my-auto"> <small>Qty : <%#Eval("BQty") %></small></div>
                                        <div class="col my-auto">
                                            <h6 class="mb-0">&#8377;<%#Eval("totamt") %></h6>
                                        </div>
                                    </div>
                                </div>
                                 </div>
                            <hr class="my-3 ">
                            <%--<div class="row">
                                <div class="col-md-3 mb-3"> <small> Track Order <span><i class=" ml-2 fa fa-refresh" aria-hidden="true"></i></span></small> </div>
                                <div class="col mt-auto">
                                    <div class="progress my-auto">
                                        <div class="progress-bar progress-bar rounded" style="width: 62%" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="media row justify-content-between ">
                                        <div class="col-auto text-right"><span> <small class="text-right mr-sm-2"></small> <i class="fa fa-circle active"></i> </span></div>
                                        <div class="flex-col"> <span> <small class="text-right mr-sm-2">Out for delivary</small><i class="fa fa-circle active"></i></span></div>
                                        <div class="col-auto flex-col-auto"><small class="text-right mr-sm-2">Delivered</small><span> <i class="fa fa-circle"></i></span></div>
                                    </div>
                                </div>
                            </div>--%>
                    <div class="row">
                        <div class="col-auto">
                            <p class="mb-1 text-dark"><b style="font-size:16px;">Order Details</b></p>
                                 <p class="mb-1 text-secondary"> Order ID : <%#Eval("orderno") %></p>
                                 <p class="mb-1 text-secondary"> Payment Method : <%#Eval("paymethod") %></p>
                                 <p class="mb-1 text-secondary">Order Date : <%#Eval("purdate") %></p>
                                 <p class="mb-1 text-secondary">Delivery Estimate: <%#Eval("deldate").ToString().Substring(0,10) %></p>
                             </div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <div style="float:right;">
                               <p class="mb-1 text-dark"><b style="font-size:16px;">Shipping Address</b></p>
                               <p class="mb-1 text-secondary"><asp:Label ID="lbladdr" runat="server" Text=""></asp:Label></p>
                               <p class="mb-1 text-secondary"><asp:Label ID="lblstate" runat="server" Text=""></asp:Label></p>
                               <p class="mb-1 text-secondary"><asp:Label ID="lblcity" runat="server" Text=""></asp:Label> - <asp:Label ID="lblzipcode" runat="server" Text=""></asp:Label></p> 
                                <p class="mb-1 text-secondary"><asp:Label ID="lbllandmark" runat="server" Text=""></asp:Label>
                            </div>
                         </div>
                        </div>
                    </div>
                </div>
            </div>
            </div>
           <%-- <div class="row mt-4">
                <div class="col">
                    <div class="row justify-content-between">
                        <%--<div class="col-auto">
                            <p class="mb-1 text-dark"><b>Order Details</b></p>
                        </div>--%>
                        <%--<div class="flex-sm-col text-right col">
                            <p class="mb-1"><b class="text-dark">Total</b></p>
                        </div>
                        <div class="flex-sm-col col-auto">
                            <p class="mb-1 text-secondary">&#8377;4,835</p>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="flex-sm-col text-right col">
                            <p class="mb-1 text-dark"><b>Delivery Charges</b></p>
                        </div>
                         <div class="flex-sm-col col-auto">
                            <p class="mb-1 text-success">Free</p>
                        </div>
                    </div>
                </div>
            </div>--%>
           <%-- <div class="row invoice ">
                <div class="col">
                    <p class="mb-1 para"> Invoice Number : 788152</p>
                    <p class="mb-1 para">Invoice Date : 22 Dec,2019</p>
                    <p class="mb-1 para">Recepits Voucher:18KU-62IIK</p>
                </div>
            </div>--%>
  </ItemTemplate>
</asp:Repeater>      
     </div>
    </div>

<br /><br />
</asp:Content>

