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
    public partial class SearchResults : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["pqr"].ToString());
        protected void populateList(String query)
        {
            lbl_NoResults.Visible = false;
            DataTable dt = new DataTable();
            SqlDataAdapter adpt = new SqlDataAdapter(query, con);
            adpt.Fill(dt);
            DataTable dt1 = new DataTable();
            dt1.Columns.Add("Image", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_name", Type.GetType("System.String"));
            dt1.Columns.Add("Price", Type.GetType("System.String"));
            dt1.Columns.Add("AddToCart", Type.GetType("System.String"));
            dt1.Columns.Add("Prod_id", Type.GetType("System.String"));
            DataRow dr;
            int p = dt.Rows.Count;
            if (p == 0)
            {
                lbl_NoResults.Visible = true;
                drpdwn_Sort.Visible = false;
                lbl_SortBy.Visible = false;                
            }
            for (int i = 0; i < p; i++)
            {
                dr = dt1.NewRow();
                dr[0] = dt.Rows[i].ItemArray[3].ToString();
                dr[1] = dt.Rows[i].ItemArray[0].ToString();
                dr[2] = dt.Rows[i].ItemArray[1].ToString();
                dr[3] = "Add to Cart";
                dr[4] = dt.Rows[i].ItemArray[2].ToString();
                dt1.Rows.Add(dr);
            }
            SearchList.DataSource = dt1;
            SearchList.DataBind();
            SearchList.Visible = true;
        
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lbl_NoStock.Visible = false;
                lbl_AddedToCart.Visible = false;
                if (Session["id"] == null)
                    imgbtn_ViewCart.Visible = false;
                String key = Request.QueryString["k"].ToString();
                if(key.Equals("-1")){
                    //empty search string
                    lbl_NoResults.Visible = true;
                    drpdwn_Sort.Visible = false;
                    lbl_SortBy.Visible = false; 
                }
                else{
                    String query = "select Prod_name,Price,Prod_id,Image from Product where Prod_name like '%" + key + "%'";
                    populateList(query);
                }
            }
        }
          
        protected void lbtn_ProductName_Click(object sender, EventArgs e)
        {
            Label lb=(Label)((LinkButton)sender).FindControl("lbl_Prod_id");
            Response.Redirect("~/Pages/ProductDetails.aspx?pid=" + lb.Text);
        }

        protected void imgbtn_Thumbnail_Click(object sender, ImageClickEventArgs e)
        {
            Label lb = (Label)((ImageButton)sender).FindControl("lbl_Prod_id");
            Response.Redirect("~/Pages/ProductDetails.aspx?pid=" + lb.Text);
        }

        protected void drpdwn_Sort_SelectedIndexChanged(object sender, EventArgs e)
        {
            String key = Request.QueryString["k"].ToString();
            String query = "";
            if(drpdwn_Sort.SelectedItem.Text.Equals("Name")){
                query = "select Prod_name,Price,Prod_id,Image from Product where Prod_name like '%" + key + "%' order by Prod_name";
            }
            if (drpdwn_Sort.SelectedItem.Text.Equals("Price"))
            {
                query = "select Prod_name,Price,Prod_id,Image from Product where Prod_name like '%" + key + "%' order by Price";
            }
            if (drpdwn_Sort.SelectedItem.Text.Equals("Category"))
            {
                query = "select Prod_name,Price,Prod_id,Image from Product where Prod_name like '%" + key + "%' order by Cat_id";
            }
            else return;
            populateList(query);
        }

        protected void lbtn_AddToCart_Click(object sender, EventArgs e)
        {
            if (Session["id"] == null)
            {
                Response.Redirect("~/Default.aspx?login=false");
            }
            else
            {
                Label lb = (Label)((LinkButton)sender).FindControl("lbl_Prod_id");
                String prod_id = lb.Text;
                String user_id = Session["id"].ToString();
                SalesHandler sales = new SalesHandler();
                Boolean flag = sales.addToCart(user_id, prod_id);
                if (flag == false)
                    lbl_NoStock.Visible = true;
                else
                    lbl_AddedToCart.Visible = true;
            }
        }

        protected void imgbtn_ViewCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Pages/Cart.aspx");
        }     
    }
}