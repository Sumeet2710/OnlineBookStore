using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;
using System.Net;

public partial class ForgetPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ForgetBtn_Click(object sender, EventArgs e)
    {
        SqlConnection myConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["OBSConnectionString"].ConnectionString);
        var text1 = resetemail.Text;

        string query = "Select * from Tbl1_User where email='" + text1 + "'";
        SqlCommand cmd = new SqlCommand(query, myConnection);
        myConnection.Open();
        SqlDataAdapter sda = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        sda.Fill(dt);

        if (dt.Rows.Count != 0)
			{
				String myGUID = Guid.NewGuid().ToString();
                String ToEmailAddress = dt.Rows[0]["email"].ToString().Trim();
                SqlCommand cmd1 = new SqlCommand("insert into ForgetPass values('" + myGUID + "','" + ToEmailAddress + "',getdate())", myConnection);
				cmd1.ExecuteNonQuery();

				//send email
					String Username = dt.Rows[0]["fname"].ToString();
                    String EmailBody = "Hi " + Username + ",<br/><br/> Click the link below to reset your password <br/><br/> http://localhost:51118/login/resetPass.aspx?Uid=" + myGUID;
                    MailMessage PassRecMail = new MailMessage("rahulkhedekar956@gmail.com", ToEmailAddress);
					PassRecMail.Body = EmailBody;
					PassRecMail.IsBodyHtml = true;
					PassRecMail.Subject = "Reset Password";
					PassRecMail.Priority = MailPriority.High;
					SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
					SMTP.DeliveryMethod = SmtpDeliveryMethod.Network;
					SMTP.UseDefaultCredentials = false;
					SMTP.Credentials = new NetworkCredential()
					{
                        UserName = "rahulkhedekar956@gmail.com",
                        Password = "95khedekarrahul6$"
					};
					SMTP.EnableSsl = true;
					SMTP.Send(PassRecMail);
					Response.Write("<script>alert('Check your email to reset your password.');</script>");
					resetemail.Text = "";
				}
    else
        {
            Response.Write("<script>alert('OOPS This email id DOES NOT  exist in our database !');</script>");
        }

    }
}