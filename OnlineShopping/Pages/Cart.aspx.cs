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
    public partial class Cart : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();

        protected void populateList()
        {
            DataSet ds1 = new DataSet();
            ds1 = obj.Data_inventer("select Prod_id,Quantity from Cart where UserID='" + Session["id"].ToString() + "'");
            DataTable dt1 = new DataTable();
            dt1.Columns.Add(new DataColumn("UserID", Type.GetType("System.String")));
            dt1.Columns.Add(new DataColumn("Prod_id", Type.GetType("System.String")));
            dt1.Columns.Add(new DataColumn("Image", Type.GetType("System.String")));
            dt1.Columns.Add(new DataColumn("Brand", Type.GetType("System.String")));
            dt1.Columns.Add(new DataColumn("Prod_name", Type.GetType("System.String")));
            dt1.Columns.Add(new DataColumn("Price", Type.GetType("System.String")));
            dt1.Columns.Add(new DataColumn("Quantity", Type.GetType("System.String")));

            int p = ds1.Tables[0].Rows.Count;
            if (p == 0)
            {
                lbl_EmptyCart.Visible = true;
                lbl_NetPrice.Visible = false;
                ImqBtnBuyNow.Visible = false;
                ImgBtnCashOnDelivery.Visible= false;
                CartList.Visible = false;
            }
            DataRow dr;
            double price = 0.0;
            for (int i = 0; i < p; i++)
            {
                dr = dt1.NewRow();
                dr[0] = Session["id"].ToString();
                dr[1] = ds1.Tables[0].Rows[i].ItemArray[0].ToString();
                DataSet ds2 = new DataSet();
                ds2 = obj.Data_inventer("select Image,Brand,Prod_name,Price from Product where Prod_id='" + dr[1].ToString() + "'");
                dr[2] = ds2.Tables[0].Rows[0].ItemArray[0].ToString();
                dr[3] = ds2.Tables[0].Rows[0].ItemArray[1].ToString();
                dr[4] = ds2.Tables[0].Rows[0].ItemArray[2].ToString();
                dr[5] = ds2.Tables[0].Rows[0].ItemArray[3].ToString();
                dr[6] = ds1.Tables[0].Rows[i].ItemArray[1].ToString();
                dt1.Rows.Add(dr);
                price += double.Parse(dt1.Rows[i].ItemArray[5].ToString()) * double.Parse(dt1.Rows[i].ItemArray[6].ToString());
            }
            CartList.DataSource = dt1;
            CartList.DataBind();
            lbl_NetPrice.Text = "Net Amount: Rs." + price.ToString();
            if (p != 0)
                lbl_NetPrice.Visible = true;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("~/Default.aspx");
            if (!IsPostBack)
            {
                lbl_EmptyCart.Visible = false;
                lbl_NetPrice.Visible = true;
                lbl_NoStock.Visible = false;
                populateList();                
            }
        }
        
        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            Label lb = (Label)((Button)sender).FindControl("lbl_Prod_id");
            String prod_id = lb.Text;
            String user_id = Session["id"].ToString();
            TextBox tb = (TextBox)((Button)sender).FindControl("tb_Qty");
            String qty = tb.Text;
            if (qty.Length != 0)
            {
                obj.INUPDE("update Cart set Quantity='" + qty + "' where UserID='" + user_id + "' and Prod_id='" + prod_id + "'");
                Response.Redirect("~/Pages/Cart.aspx");                
            }
        }

        protected void lbtn_Remove_Click(object sender, EventArgs e)
        {
            Label lb = (Label)((LinkButton)sender).FindControl("lbl_Prod_id");
            String prod_id = lb.Text;
            String user_id = Session["id"].ToString();
            obj.INUPDE("delete from Cart where UserID='"+user_id+"' and Prod_id='"+prod_id+"'");
            Response.Redirect("~/Pages/Cart.aspx");
        }           

        protected Boolean buy()
        {
            DataSet ds = new DataSet();
            Boolean flag = true;
            ds = obj.Data_inventer("select UserID,Prod_id,Quantity from Cart where UserID='" + Session["id"].ToString() + "'");
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                String user_id = Session["id"].ToString();
                String prod_id = ds.Tables[0].Rows[i].ItemArray[1].ToString();
                String qty = ds.Tables[0].Rows[i].ItemArray[2].ToString();
                DataSet ds2 = new DataSet();
                ds2 = obj.Data_inventer("select Stock from Product where Prod_id='"+prod_id+"'");
                int stock = int.Parse(ds2.Tables[0].Rows[0].ItemArray[0].ToString());
                if (int.Parse(qty) <= stock)
                {
                    DataSet ds1 = new DataSet();
                    ds1 = obj.Data_inventer("select Price from Product where Prod_id='" + prod_id + "'");
                    String unit_price = ds1.Tables[0].Rows[0].ItemArray[0].ToString();
                    String price = (double.Parse(unit_price) * double.Parse(qty)).ToString();
                    String query = "insert into Purchase (UserID,Prod_id,Quantity,Price,Date) values('" + user_id + "','" + prod_id + "'," + qty + "," + price + ",GETDATE())";
                    obj.INUPDE(query);
                    String reduce = "update Product set Stock=Stock-" + qty + " where Prod_id='"+prod_id+"'";
                    obj.INUPDE(reduce);
                    obj.INUPDE("delete from Cart where UserID='"+Session["id"].ToString()+"'");
                }
                else
                {
                    flag = false;
                    if (stock == 0)
                    {
                        lbl_NoStock.Text = "Product out of stock";
                    }
                    else
                    {
                        lbl_NoStock.Text = "Only " + stock + " items  left!";
                    }
                    lbl_NoStock.Visible = true;
                    lbl_NoStock.ForeColor = System.Drawing.Color.Red;
                }
            }
            return flag;
        }

        protected void ImqBtnBuyNow_Click(object sender, ImageClickEventArgs e)
        {
            if(buy())
                Response.Redirect("https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=wd.pra_1317033108_biz@gmail.com&image_url=http://server.myspace-shack.com/d20/nf165327.jpg");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if(buy())
                Response.Redirect("~/Pages/CashOnDeliveryAddress.aspx");
        }

        protected void ImageButton1_Click1(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void CartList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}