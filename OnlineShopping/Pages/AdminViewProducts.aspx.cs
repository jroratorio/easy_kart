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
    public partial class AdminViewProducts : System.Web.UI.Page
    {

        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null && Session["id"].ToString().Equals("admin"))
            {
                GridView1.RowCancelingEdit += new GridViewCancelEditEventHandler(GridView1_RowCancelingEdit);
                GridView1.RowDeleting += new GridViewDeleteEventHandler(GridView1_RowDeleting);
                GridView1.RowUpdating += new GridViewUpdateEventHandler(GridView1_RowUpdating);
                GridView1.RowEditing += new GridViewEditEventHandler(GridView1_RowEditing);
                GridView1.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
                GridView1.Sorting += new GridViewSortEventHandler(GridView1_Sorting);
                if (!IsPostBack)
                {
                    DataSet ds = new DataSet();
                    ds = obj.Data_inventer("select * from Product");
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }

        void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Product");
            if (ds != null)
            {
                ds = obj.Data_inventer("select * from Product order by " + e.SortExpression);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }    
        }

        void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Product");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Product");
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }

        void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            TextBox t_pid = (TextBox)GridView1.Rows[e.RowIndex].Cells[2].Controls[0];
            TextBox t_cid = (TextBox)GridView1.Rows[e.RowIndex].Cells[3].Controls[0];
            TextBox t_pname = (TextBox)GridView1.Rows[e.RowIndex].Cells[4].Controls[0];
            TextBox t_brand = (TextBox)GridView1.Rows[e.RowIndex].Cells[5].Controls[0];
            TextBox t_price = (TextBox)GridView1.Rows[e.RowIndex].Cells[6].Controls[0];
            TextBox t_specs = (TextBox)GridView1.Rows[e.RowIndex].Cells[7].Controls[0];
            TextBox t_stock = (TextBox)GridView1.Rows[e.RowIndex].Cells[8].Controls[0];
            TextBox t_image = (TextBox)GridView1.Rows[e.RowIndex].Cells[9].Controls[0];
            obj.INUPDE("update Product set Prod_id='" + t_pid.Text + "',Cat_id='" + t_cid.Text + "',Prod_name='" + t_pname.Text + "',Brand='" + t_brand.Text + "',Price='" + t_price.Text + "',Specs='" + t_specs.Text + "',Stock='" + t_stock.Text + "',Image='" + t_image.Text + "'where Prod_id='" + t_pid.Text + "'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Product");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            obj.INUPDE("delete from  Product where Prod_id='" + GridView1.Rows[e.RowIndex].Cells[2].Text + "'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Product");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Product");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}