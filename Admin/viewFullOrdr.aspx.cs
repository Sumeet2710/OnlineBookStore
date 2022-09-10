using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_viewFullOrdr : System.Web.UI.Page
{
    SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
    int id;
    decimal tot = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Convert.ToInt32(Request.QueryString["id"].ToString());

        myConnection.Open();

        SqlCommand cmd1 = myConnection.CreateCommand();
        cmd1.CommandType = CommandType.Text;
        cmd1.CommandText = "SELECT * FROM [dbo].[Tbl7_ShipDetails] WHERE id=" + id + "";
        cmd1.ExecuteNonQuery();

        DataTable dt1 = new DataTable();
        SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
        da1.Fill(dt1);
        Repeater2.DataSource = dt1;
        Repeater2.DataBind();
        myConnection.Close();
        
        
        myConnection.Open();
        SqlCommand cmd = myConnection.CreateCommand();
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM [dbo].[Tbl5_Order] WHERE orderID=" + id + "";
        cmd.ExecuteNonQuery();

        DataTable dt = new DataTable();
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(dt);
        foreach (DataRow dr in dt.Rows)
        {
            tot = tot + (Convert.ToDecimal(dr["BAmount"].ToString()) * Convert.ToInt32(dr["BQty"].ToString()));
        }
        Repeater1.DataSource = dt;
        Repeater1.DataBind();

        myConnection.Close();
        Label1.Text = "Total Order Price: " + tot.ToString();
    }
}