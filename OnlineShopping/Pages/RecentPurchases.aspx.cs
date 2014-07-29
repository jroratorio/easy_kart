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
    public partial class RecentPurchases : System.Web.UI.Page
    {

        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] == null)
                Response.Redirect("~/Default.aspx");
            GridView1.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
            GridView1.Sorting += new GridViewSortEventHandler(GridView1_Sorting);
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Purchase where UserID='" + Session["id"] + "'");
            if (ds.Tables[0].Rows.Count >= 1)
            {
                ds = obj.Data_inventer("select Brand,Prod_name, Quantity,Purchase.Price,Date,Status from Purchase,Product where Purchase.Prod_id=Product.Prod_id and Purchase.UserID='" + Session["id"].ToString() + "' order by Purchase.Date");
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                lbl_NoPurchases.Visible = true;
                GridView1.Visible = false;
            }
        }

        void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select Brand,Prod_name, Quantity,Purchase.Price,Date,Status from Purchase,Product where Purchase.Prod_id=Product.Prod_id and Purchase.UserID='" + Session["id"].ToString() + "' order by Purchase.Date");
            if (ds != null)
            {
                ds = obj.Data_inventer("select Brand,Prod_name, Quantity,Purchase.Price,Date,Status from Purchase,Product where Purchase.Prod_id=Product.Prod_id and Purchase.UserID='" + Session["id"].ToString() + "' order by " + e.SortExpression);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select Brand,Prod_name, Quantity,Purchase.Price,Date,Status from Purchase,Product where Purchase.Prod_id=Product.Prod_id and Purchase.UserID='" + Session["id"].ToString() + "' order by Purchase.Date");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }
    }
}