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
    public partial class AdminViewFeedback : System.Web.UI.Page
    {
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["id"] != null && Session["id"].ToString().Equals("admin"))
            {
                GridView1.RowDeleting += new GridViewDeleteEventHandler(GridView1_RowDeleting);
                GridView1.PageIndexChanging += new GridViewPageEventHandler(GridView1_PageIndexChanging);
                GridView1.Sorting += new GridViewSortEventHandler(GridView1_Sorting);
                if (!IsPostBack)
                {
                    DataSet ds = new DataSet();
                    ds = obj.Data_inventer("select * from Feedback");
                    GridView1.DataSource = ds;
                    GridView1.DataBind();
                }
            }
        }

        void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Feedback");
            if (ds != null)
            {
                ds = obj.Data_inventer("select * from Feedback order by " + e.SortExpression);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }            
        }

        void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex=e.NewPageIndex;
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Feedback");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        
        void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            obj.INUPDE("delete from  Feedback where UserID='" + GridView1.Rows[e.RowIndex].Cells[1].Text + "'");
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Feedback");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}