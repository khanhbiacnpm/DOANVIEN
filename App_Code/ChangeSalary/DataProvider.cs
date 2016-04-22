/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;
using System.Data.SqlClient;
using DotNetNuke;
using System.Data;

using DotNetNuke.Framework;

namespace VNPT.Modules.ChangeSalary
{
    public abstract class DataProvider
    {

        static DataProvider objProvider = null;

        static DataProvider()
        {
            CreateProvider();
        }

        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.ChangeSalary", "");
        }
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        public static DataTable IncreaseSalary()
        {            
            string strConn = getConnectionString();
            SqlConnection sqlCnn = new SqlConnection(strConn);
            SqlCommand sqlCmd;

            DataTable table = new DataTable();
            DataColumn colum;
            DataRow row;
            SqlDataReader dr;
            sqlCmd = new SqlCommand("HRM_IncreaseSalary", sqlCnn);
            sqlCmd.CommandType = CommandType.StoredProcedure;
            sqlCnn.Open();
            dr = sqlCmd.ExecuteReader(CommandBehavior.CloseConnection);
            sqlCmd.Dispose();
            colum = new DataColumn("empid");
            table.Columns.Add(colum);        
            colum = new DataColumn("unitname");
            table.Columns.Add(colum);
            colum = new DataColumn("qualification");
            table.Columns.Add(colum);
            colum = new DataColumn("changedate");
            table.Columns.Add(colum);            
            
            while (dr.Read())
            {
                row = table.NewRow();
                row[0] = dr["employeeid"].ToString();                
                row[1] = dr["unitid"].ToString() ;
                row[2] = dr["qualification"].ToString();
                row[3] = dr["changedate"].ToString();
                table.Rows.Add(row);
            }
            dr.Close();
            sqlCnn.Close();
            return table;

        }

        public static DataProvider Instance()
        {
            return objProvider;
        }

        public abstract void AddChangeSalary(ChangeSalaryInfo objChangeSalary);
        public abstract IDataReader GetChangeSalary(int itemId);
        
        public abstract IDataReader GetNgachBac(int classId,DateTime changedate);
        //public abstract IDataReader GetChangeSalaryByEmployee(int itemId);
        public abstract IDataReader GetChangeSalarys();
        public abstract IDataReader GetChangeSalaryB();
        public abstract IDataReader GetChangeSalaryByEmployee(int employeeId);
        public abstract IDataReader GetNangBacLuong_QTCongTacByThoiGian(int empId, DateTime tuNgay, DateTime denNgay);
        public abstract IDataReader GetChangeSalaryBByEmployee(int employeeId);
        public abstract void UpdateChangeSalary(ChangeSalaryInfo objChangeSalary);
        public abstract void DeleteChangeSalary(ChangeSalaryInfo objChangeSalary);
        public abstract void DeleteChangeSalarys(int id,int type);
        public abstract IDataReader GetSalaryHistory(int empid, DateTime tuNgay, DateTime denNgay);
    }

}
