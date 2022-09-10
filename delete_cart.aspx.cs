using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;


public partial class delete_cart : System.Web.UI.Page
{
    string s;
    string t;
    string[] a = new string[6];
    int BID;
    string bookname, bookprice, booksprice, bookimg, bookdisc, bookqty;
    int count = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        BID = Convert.ToInt32(Request.QueryString["BID"].ToString());

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
            }
        }
        dt.Rows.RemoveAt(BID);

        Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);
        Response.Cookies["bk"].Expires = DateTime.Now.AddDays(-1);

        foreach (DataRow dr in dt.Rows)
        {
            bookname = dr["BName"].ToString();
            bookprice = dr["BPrice"].ToString();
            booksprice = dr["BSPrice"].ToString();
            bookdisc = dr["BDisc"].ToString();
            bookqty = dr["BQty"].ToString();
            bookimg = dr["BImage"].ToString();

            count = count + 1;

            if (count == 1)
            {
                Response.Cookies["bk"].Value = bookname.ToString() + "," + bookprice.ToString() + "," + booksprice.ToString() + "," + bookdisc.ToString() + "," + bookqty.ToString() + "," + bookimg.ToString();
                Response.Cookies["bk"].Expires = DateTime.Now.AddDays(1);
            }
            else
            {
                Response.Cookies["bk"].Value = Response.Cookies["bk"].Value + "|" + bookname.ToString() + "," + bookprice.ToString() + "," + booksprice.ToString() + "," + bookdisc.ToString() + "," + bookqty.ToString() + "," + bookimg.ToString();
                Response.Cookies["bk"].Expires = DateTime.Now.AddDays(1);
            }
        }
        if (Session["usrID"] == null)
        {
            Response.Redirect("AddCart.aspx");
        }
        else
        {
            Response.Redirect("~/User/UsrAddCart.aspx");
        }
    }
}