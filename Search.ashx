<%@ WebHandler Language="C#" Class="Search" %>

using System;
using System.Data.SqlClient;
using System.Text;
using System.Web;

public class Search : IHttpHandler {
    
    public void ProcessRequest (HttpContext context)
    {
        string searchText = context.Request.QueryString["q"];
        SqlConnection con = new SqlConnection("Data Source=10.55.30.10;Initial Catalog=hrm;User ID=sa;Password=mdv!sql@2013;");

        con.Open();
        SqlCommand cmd = new SqlCommand("select FullName,EmpCode,Image from Employees where FullName Like N'%" + searchText + "%'", con);
        
        StringBuilder sb = new StringBuilder();
        using(SqlDataReader dr=cmd.ExecuteReader())
        {
            while(dr.Read())
            {
                sb.Append(string.Format("{0},{1}{2}", dr["FullName"], dr["Image"], Environment.NewLine));
            }
        }
        con.Close();
        context.Response.Write(sb.ToString());
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}

