using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;
using System.IO;

namespace OnlineShopping.Pages
{
    public partial class Profile : System.Web.UI.Page
    {
        [WebMethod]
        [ScriptMethod]
        public static Slide[] GetImages()
        {
            List<Slide> slides = new List<Slide>();
            string path = HttpContext.Current.Server.MapPath("~/Pages/images");
            if (path.EndsWith("\\"))
            {
                path = path.Remove(path.Length - 1);
            }
            Uri pathUri = new Uri(path, UriKind.Absolute);
            string[] files = Directory.GetFiles(path);
            foreach (string file in files)
            {
                Uri filePathUri = new Uri(file, UriKind.Absolute);
                slides.Add(new Slide
                {

                    ImagePath = pathUri.MakeRelativeUri(filePathUri).ToString()
                });
            }
            return slides.ToArray();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_PassChange.Visible=false;
            if (Session["id"] == null)//session doesnt exist
                Response.Redirect("~/Default.aspx");
            if (Request.QueryString["changePass"]!=null && Request.QueryString["changePass"].Equals("1"))
            {
                lbl_PassChange.Visible = true;
                lbl_PassChange.Text = "Password Changed!";
            }
            lbl_Name.Text = Session["name"].ToString();

        }

        protected void ImgBtnViewCart_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Cart.aspx");
        }

        protected void ImgBtnViewProfile_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("View_Profile.aspx");
        }

        protected void ImgBtnChangePwd_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("Change_Password.aspx");
        }

        protected void ImgBtnRecentPurchases_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/Pages/RecentPurchases.aspx");
        }
    }
}