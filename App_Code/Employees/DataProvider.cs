using System;
using DotNetNuke;
using System.Data;
using System.Data.SqlClient;
using DotNetNuke.Framework;

using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;

using DotNetNuke.Common.Utilities;
using DotNetNuke.Entities.Modules;
using DotNetNuke.Entities.Modules.Actions;
using DotNetNuke.Security;
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxHtmlEditor;

using DevExpress.Web.ASPxUploadControl;
using DotNetNuke.Common;
using DevExpress.Web.ASPxHiddenField;
using System.Text.RegularExpressions;
using System.Text;

namespace VNPT.Modules.Employees
{
    public abstract class DataProvider
    {        
        static DataProvider objProvider = null;
        static string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        static DataProvider()
        {
            CreateProvider();
        }
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        
        public static string BindName(string username)
        {
            DataTable dt = SqlHelper.ExecuteDataset(strconn, "[HRM_GetEmployeesSearch_1]", username).Tables[0];
            StringBuilder output = new StringBuilder();
            output.Append("[");
            for (int i = 0; i < dt.Rows.Count; ++i)
            {
                string text = "{\"label\" :\"" + dt.Rows[i]["manv"].ToString().Trim() + "-" + dt.Rows[i]["hoten"].ToString() + " - " + dt.Rows[i]["chucvu"].ToString() + "-" + dt.Rows[i]["tento"].ToString() + "-" + dt.Rows[i]["tentt"].ToString() + "\" ,\"value\": \"" + dt.Rows[i]["manv"].ToString().Trim() + " - " + dt.Rows[i]["hoten"].ToString() + " - " + dt.Rows[i]["chucvu"].ToString() + " - " + dt.Rows[i]["tento"].ToString() + " - " + dt.Rows[i]["tentt"].ToString() + "\" ,\"id\": " + dt.Rows[i]["id"].ToString() + "}";
                output.Append("" + text + "");

                if (i != (dt.Rows.Count - 1))
                {
                    output.Append(",");
                }
            }
            output.Append("]");
            return output.ToString();
        }        
        public static int GetMaxId()
        {
            string sql = "SELECT max(id) as id FROM Employees";

            object obj = SqlHelper.ExecuteScalar(strconn, CommandType.Text, sql);
            return Convert.ToInt32(obj);

        }
        private static void CreateProvider()
        {
            objProvider = (DataProvider)Reflection.CreateObject("data", "VNPT.Modules.Employees", "");
        }

        public static DataProvider Instance()
        {
            return objProvider;
        }
        
        public abstract void AddEmployees(EmployeesInfo objEmployees);
        public abstract void UpdateEmployees(EmployeesInfo objEmployees);
        public abstract void DeleteEmployees(EmployeesInfo objEmployees);
        public abstract IDataReader GetEmployees(int itemId);   
        public abstract IDataReader GetColleaguesEmployee(int unitid);
        public abstract IDataReader GetEmployeess();
        public abstract IDataReader GetEmployeesEmpcode(int unitid);
        public abstract IDataReader GetEmployeesSearch();
        public abstract IDataReader GetEmptyEmp();
        public abstract IDataReader GetEmployeeByCode(string code);
        public abstract IDataReader GetEmployeeByCardId(string code);
        public abstract IDataReader GetBirthDay();
        public abstract IDataReader GetEmployeesByUnit(decimal unitId);
        public abstract IDataReader GetEmployeesById(int Id);
        public abstract IDataReader GetEmployeesByIdMax();
        public abstract IDataReader Get_GiamDocTT(int idUnit);
    }
}
