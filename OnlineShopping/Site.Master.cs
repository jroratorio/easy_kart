using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShopping
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"]== null)
                lbtn_Logout.Visible = false;
            else
                lbtn_Logout.Visible = true;
        }

        protected void btn_Search_Click(object sender, EventArgs e)
        {
            if (tb_Search.Text.Length == 0)            
                Response.Redirect("~/pages/SearchResults.aspx?k=-1");            
            else
                Response.Redirect("~/pages/SearchResults.aspx?k="+tb_Search.Text);
        }

        protected void lbtn_Logout_Click(object sender, EventArgs e)
        {
            ClassDataConnection obj = new ClassDataConnection();
            obj.INUPDE("delete from Cart where UserID='" + Session["id"].ToString() + "'");
            Session.Clear();
            Session.Abandon();            
            Response.Redirect("~/Default.aspx");
        }
    }
}
