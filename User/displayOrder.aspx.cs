using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_displayOrder : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    string amount, qty, addr1, state, city, zipcode, oid;

    protected void Page_Load(object sender, EventArgs e)
    {
        myConnection.Open();

        SqlCommand cmd4 = myConnection.CreateCommand();
        cmd4.CommandType = CommandType.Text;
        cmd4.CommandText = "SELECT * FROM [dbo].[Tbl5_Order] where usrid='" + Session["usrID"] + "'";
        cmd4.ExecuteNonQuery();
        DataTable dt4 = new DataTable();
        SqlDataAdapter sda = new SqlDataAdapter(cmd4);
        sda.Fill(dt4);
      
        Repeater1.DataSource = dt4;
        Repeater1.DataBind();

        SqlCommand cmd2 = myConnection.CreateCommand();
        cmd2.CommandType = CommandType.Text;
        cmd2.CommandText = "SELECT * FROM [dbo].[Tbl7_ShipDetails] where usrID='" + Session["usrID"].ToString() + "'";
        cmd2.ExecuteNonQuery();

        DataTable dt2 = new DataTable();
        SqlDataAdapter da2 = new SqlDataAdapter(cmd2);
        da2.Fill(dt2);
        foreach (DataRow dr1 in dt2.Rows)
        {
            addr1 = dr1["addr"].ToString();
            state = dr1["state"].ToString();
            city = dr1["city"].ToString();
            zipcode = dr1["zipcode"].ToString();
        }

        if (dt2.Rows.Count != 0)
        {
            foreach (RepeaterItem ri in Repeater1.Items)
            {
                Label lbladdr = ri.FindControl("lbladdr") as Label;
                lbladdr.Text = addr1.ToString();

                Label lblstate = ri.FindControl("lblstate") as Label;
                lblstate.Text = state.ToString();

                Label lblcity = ri.FindControl("lblcity") as Label;
                lblcity.Text = city.ToString();

                Label lblzipcode = ri.FindControl("lblzipcode") as Label;
                lblzipcode.Text = zipcode.ToString();
            }
        }
        myConnection.Close();
        LUser.Text = Session["usrID"].ToString();
    }
}