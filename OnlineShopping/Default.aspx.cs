using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using AjaxControlToolkit;
using System.Web.Services;
using System.Web.Script.Services;
using System.IO;

namespace OnlineShopping
{
    public partial class _Default : System.Web.UI.Page
    {
        [WebMethod]
        [ScriptMethod]
        public static Slide[] GetImages()
        {
            List<Slide> slides = new List<Slide>();
            string path = HttpContext.Current.Server.MapPath("~/images");
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

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["pqr"].ToString());
        ClassDataConnection obj = new ClassDataConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["id"] != null)
                Response.Redirect("~/Pages/Profile.aspx");
            lbl_PassChange.Visible=false;
            lbl_Login.Visible = false;
            if (Request.QueryString["changePass"]!=null && Request.QueryString["changePass"].Equals("1"))
            {
                lbl_PassChange.Visible = true;
                lbl_PassChange.Text = "Password changed!";
            }
            if (Request.QueryString["login"] != null && Request.QueryString["login"].Equals("false"))
            {
                lbl_Login.Visible = true;
            }
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Login_Authenticate(object sender, AuthenticateEventArgs e)
        {
            SqlCommand com = new SqlCommand("Select * from User_Info", con);
            SqlDataReader dr;
            con.Open();
            dr = com.ExecuteReader();
            while (dr.Read())
            {
                if (Login.UserName == dr["UserID"].ToString() && Login.Password == dr["Password"].ToString())
                {
                    DataSet ds = new DataSet();
                    ds = obj.Data_inventer("select FName from User_Info where UserID='" + Login.UserName + "'");
                    String name = ds.Tables[0].Rows[0][0].ToString();
                    Session.Add("name", name);
                    Session.Add("id", Login.UserName);
                    if (Login.UserName.Equals("admin"))
                    {                        
                        Response.Redirect("~/Pages/AdminProfile.aspx?user=" + Login.UserName);
                    }
                    Response.Redirect("~/Pages/Profile.aspx?user=" + Login.UserName);
                }        
            }
            dr.Close();
            con.Close();
        }
    }
}
