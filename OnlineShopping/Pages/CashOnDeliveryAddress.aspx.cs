using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShopping.Pages
{
    public partial class CashOnDeliveryAddress : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("~/Default.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (txtbxaddress.Text.Length > 0 && txtbxContctNum.Text.Length > 0 && txtbxName.Text.Length > 0)
            {
                obj.INUPDE("update Purchase set DeliveryAddress='" + txtbxaddress.Text + "'");
                lbl_Message.Visible = true;
                lbl_Message.ForeColor = System.Drawing.Color.Green;
                lbl_Message.Text = "YOUR PRODUCT WILL BE DELIVERED WITHIN 3-5 BUSSINESS DAYS";
            }
            else
            {
                lbl_Message.Text = "FIELS CANT BE  EMPTY";
                lbl_Message.ForeColor = System.Drawing.Color.Red;
                lbl_Message.Visible = true;
            }
        }

        protected void ImgBtnCashOnDelivery_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }        
    }
}