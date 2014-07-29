using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineShopping
{
    public class ClassDataConnection
    {
        SqlConnection Tcon;
        public SqlConnection Conn_String()
        {
            Tcon = new SqlConnection(ConfigurationManager.ConnectionStrings["pqr"].ToString());
            return Tcon;
        }

        public void INUPDE(string ss)
        {
            SqlCommand com = new SqlCommand();
            com.Connection = Conn_String();
            com.CommandText = ss;
            Tcon.Open();
            com.ExecuteNonQuery();
            Tcon.Close();
        }

        public DataSet Data_inventer(String str)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adpt = new SqlDataAdapter(str, Conn_String());
            adpt.Fill(ds);
            return ds;
        }
    }
}