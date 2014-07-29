using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineShopping.Pages
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("~/Default.aspx");
            lbl_Feedback.Visible = false;
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            ClassDataConnection obj = new ClassDataConnection();
            obj.INUPDE("insert into feedback values('" + Session["id"] + "','" + tb_FeedBack.Text + "',GETDATE())");
            lbl_Feedback.Visible = true;
            lbl_Feedback.Text = "Thank you for your valuable words";
        }
    }
}