using paytm;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_PaymentCallBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var orderid = Request.QueryString["orderid"];

        String merchantKey = "JW4X2tl4agwYEeHw";
        Dictionary<string, string> parameters = new Dictionary<string, string>();
        string paytmChecksum = "";
        foreach (string key in Request.Form.Keys)
        {
            parameters.Add(key.Trim(), Request.Form[key].Trim());
        }
        if (parameters.ContainsKey("CHECKSUMHASH"))
        {
            paytmChecksum = parameters["CHECKSUMHASH"];
            parameters.Remove("CHECKSUMHASH");
        }
        if (CheckSum.verifyCheckSum(merchantKey, parameters, paytmChecksum))
        {
            string paytmStatus = parameters["STATUS"];
            string txnId = parameters["TXNID"];
            pTxnId.InnerText = "Transaction Id : " + txnId;
            if (paytmStatus == "TXN_SUCCESS")
            {
                h1Message.InnerText = "Your payment is success";
                Response.Redirect("http://localhost:51118/User/orderDetails1.aspx?orderid=" + orderid.ToString());
            }
            else if (paytmStatus == "PENDING")
            {
                h1Message.InnerText = "Payment is pending !";
            }
            else if (paytmStatus == "TXN_FAILURE")
            {
                h1Message.InnerText = "Payment Failure !";
            }
        }
        else
        {
            Response.Write("Checksum MisMatch");
        }
    }
}