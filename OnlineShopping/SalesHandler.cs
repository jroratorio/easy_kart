using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace OnlineShopping
{
    public class SalesHandler
    {
        ClassDataConnection obj=new ClassDataConnection();
        public Boolean addToCart(String user_id, String prod_id)
        {
            DataSet ds = new DataSet();
            ds = obj.Data_inventer("select * from Cart where UserID='" + user_id + "' and Prod_id='" + prod_id + "'");
            if (ds.Tables[0].Rows.Count >= 1)
            {
                ds=obj.Data_inventer("select Stock from Product where Prod_id='"+prod_id+"'");
                if(ds.Tables[0].Rows[0].ItemArray[0].ToString().Equals("0")){
                    //no stock
                    return false;
                }
                else{
                    obj.INUPDE("update Cart set Quantity=Quantity+1 where UserID='" + user_id + "' and Prod_id='" + prod_id + "'");
                    return true;
                }
            }
            else
            {
                ds=obj.Data_inventer("select Stock from Product where Prod_id='"+prod_id+"'");
                if(ds.Tables[0].Rows[0].ItemArray[0].ToString().Equals("0")){
                    //no stock
                    return false;
                }
                else{
                    obj.INUPDE("insert into Cart values('" + user_id + "','" + prod_id.Trim() + "',1,GETDATE())");
                    return true;
                }
            }
        }
    }
}