using paytm;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_checkout : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    string s;
    string t;
    string[] a = new string[6];
    decimal tot = 0;
    int dis = 0;
    decimal rp = 0;
    int count = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[7] { new DataColumn("BName"), new DataColumn("BPrice"), new DataColumn("BSPrice"), new DataColumn("BDisc"), new DataColumn("BQty"), new DataColumn("BImage"), new DataColumn("BID") });

            if (Request.Cookies["bk"] != null)
            {
                s = Convert.ToString(Request.Cookies["bk"].Value);

                string[] strArr = s.Split('|');

                for (int j = 0; j < strArr.Length; j++)
                {
                    t = Convert.ToString(strArr[j].ToString());
                    string[] strArr1 = t.Split(',');

                    for (int i = 0; i < strArr1.Length; i++)
                    {
                        a[i] = strArr1[i].ToString();
                    }
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString(), j.ToString());

                    tot = tot + (Convert.ToDecimal(a[2].ToString()) * Convert.ToDecimal(a[4].ToString()));
                    dis = dis + (Convert.ToInt32(a[3].ToString()) * Convert.ToInt32(a[4].ToString()));
                    rp = rp + (Convert.ToDecimal(a[1].ToString()) * Convert.ToDecimal(a[4].ToString()));
                    count = count + 1;
                    LCount.Text = count.ToString();
                    LT.Text = tot.ToString();
                    LP.Text = rp.ToString();
                    LD.Text = dis.ToString();
                }

            }
        }
    }
    protected void checkoutBtn_Click(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        try
        {
            myConnection.Open();
            SqlCommand cmd = myConnection.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "Insert INTO [dbo].[Tbl7_ShipDetails] (fname, lname, cont, altcont, email, addr, city, state, zipcode, landmark) VALUES('" + Fname.Text + "','" + Lname.Text + "', '" + contact.Text + "', '" + altcontact.Text + "', '" + email.Text + "', '" + address.Text + "', '" + city.Text + "', '" + state.Text + "', '" + zipcode.Text + "', '" + Landmark.Text + "')";
            cmd.ExecuteNonQuery();
            myConnection.Close();

            Fname.Text = "";
            Lname.Text = "";
            altcontact.Text = "";
            contact.Text = "";
            email.Text = "";
            address.Text = "";
            city.Text = "";
            state.Text = "";
            zipcode.Text = "";
            Landmark.Text = "";



            var order_no = findorderid();
            var paymode = "";
            Session["order_no"] = order_no.ToString();
            Session["tot"] = tot.ToString();
            string total = tot.ToString();
            if(cashRadio.Checked)
            {
                 paymode = "Cash";
                //Response.Redirect("orderDetails.aspx?orderid=" + order_no);
                Response.Redirect("orderDetails.aspx?orderid=" + order_no + "&paymode=" + paymode);
            }
            else
            {
     
                String merchantKey = "JW4X2tl4agwYEeHw";
                Dictionary<string, string> parameters = new Dictionary<string, string>();
                parameters.Add("MID", "bIQNNf74419150815721");
                parameters.Add("CHANNEL_ID", "WEB");
                parameters.Add("INDUSTRY_TYPE_ID", "Retail");
                parameters.Add("WEBSITE", "WEBSTAGING");
                parameters.Add("EMAIL", email.Text);
                parameters.Add("MOBILE_NO", contact.Text);
                parameters.Add("CUST_ID", "C123");
                parameters.Add("ORDER_ID", order_no.ToString());
                parameters.Add("TXN_AMOUNT",LT.Text);
                parameters.Add("CALLBACK_URL", "http://localhost:51118/User/PaymentCallBack.aspx?orderid=" + order_no.ToString()); //This parameter is not mandatory. Use this to pass the callback url dynamically.
                string checksum = CheckSum.generateCheckSum(merchantKey, parameters);
                string paytmURL = "https://securegw-stage.paytm.in/order/process?orderid=" + order_no.ToString();
                string outputHTML = "<html>";
                outputHTML += "<head>";
                outputHTML += "<title>Merchant Check Out Page</title>";
                outputHTML += "</head>";
                outputHTML += "<body>";
                outputHTML += "<center>Please do not refresh this page...</center>"; //you can put h1 tag here
                outputHTML += "<form method='post' action='" + paytmURL + "' name='f1'>";
                outputHTML += "<table border='1'>";
                outputHTML += "<tbody>";
                foreach (string key in parameters.Keys)
                {
                    outputHTML += "<input type='hidden' name='" + key + "' value='" + parameters[key] + "'>";
                }
                outputHTML += "<input type='hidden' name='CHECKSUMHASH' value='" + checksum + "'>";
                outputHTML += "</tbody>";
                outputHTML += "</table>";
                outputHTML += "<script type='text/javascript'>";
                outputHTML += "document.f1.submit();";
                outputHTML += "</script>";
                outputHTML += "</form>";
                outputHTML += "</body>";
                outputHTML += "</html>";
                Response.Write(outputHTML);




                //Response.Write("<form action='https://sandboxsecure.payu.in/_payment' method='post' name='buyCredits' id='buyCredits'>");
                //Response.Write("<input type='hidden' name='key' value='gtKFFx'>");
                //Response.Write("<input type='hidden' name='salt' value='eCwWELxi'>");
                //Response.Write("<input type='hidden' name='txnid' value='T123'>");
                //Response.Write("<input type='hidden' name='amount' value='200'>");
                //Response.Write("<input type='hidden' name='productinfo' value='Book'>");
                //Response.Write("<input type='hidden' name='firstname' value='Sumit'>");
                //Response.Write("<input type='hidden' name='email' value='sum@gmail.com'>");
                //Response.Write("<input type='hidden' name='phone' value='7066014960'>");
                //Response.Write("<input type='hidden' name='surl' value='www.google.com'>");
                //Response.Write("<input type='hidden' name='furl' value='www.youtube.com'>");
                //Response.Write("<input type='hidden' name='hash' value=''>");

                //Response.Write("</form>");

                //Response.Write("<script type='text/javascript'>");
                //Response.Write("document.getElementById('buyCredits').submit();");
                //Response.Write("</script>");
                //Response.Redirect("orderDetails.aspx?orderid=" + order_no + "&paymode=" + paymode);
            }

        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Something went Wrong')</script>");
        }
    }
    public string findorderid()
    {
        string oid = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        Random r = new Random();
        char[] myoid = new char[5];

        for (int i = 0; i < 5; i++) 
        {
            myoid[i] = oid[(int)(35 * r.NextDouble())];
        }
        string orderid;
        orderid = "OD" + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + new string(myoid);
        return orderid;
    }
}