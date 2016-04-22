using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using DotNetNuke;
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
using DotNetNuke.UI.Utilities;
using DotNetNuke.Common;
using DevExpress.Web.ASPxHiddenField;
using System.Text.RegularExpressions;
using DotNetNuke.Security.Membership;
using DotNetNuke.Entities.Users;
using System.Web.Security;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxClasses;

namespace VNPT.Modules.NhanVien
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewNhanVien class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewNhanVien : PortalModuleBase
    {

        #region Private Members

        private string strTemplate;

        #endregion

        #region Public Methods

        public bool DisplayAudit()
        {
            bool retValue = false;

            if ((string)Settings["auditinfo"] == "Y")
            {
                retValue = true;
            }

            return retValue;
        }

        #endregion

        #region Event Handlers

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {


        }
        protected void treeList_Callback(object sender, TreeListCustomCallbackEventArgs e)
        {
            //ASPxTreeList tree = sender as ASPxTreeList;
            //tree.RefreshVirtualTree();
        }

        #region Tree

        public DataTable GetTable()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            DataTable customers = new DataTable("Unit");
            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
               "SELECT * FROM hrm.dbo.Unit WHERE  parentid=14 and status = 1  ORDER BY level, sequence DESC ";
                //"select * FROM hrm.dbo.Unit where id=120 ORDER BY level, sequence DESC ";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }
            return customers;
        }
        public DataTable GetTable_DonViCon()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            DataTable customers = new DataTable("Unit");
            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
               "SELECT * FROM hrm.dbo.Unit WHERE   status = 1  ORDER BY level, sequence DESC ";
                //"select * FROM hrm.dbo.Unit where id=120 ORDER BY level, sequence DESC ";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }

            return customers;
        }
        public DataTable GetChild()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            DataTable customers = new DataTable("Unit");

            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
                "SELECT * FROM hrm.dbo.Unit WHERE status = 1 ORDER BY  Name ASC";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }

            return customers;
        }
        public DataTable GetEmployee()
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            DataTable customers = new DataTable("Employees");

            using (SqlConnection connection =
                          new SqlConnection(connectionString))
            {
                SqlCommand selectAllCustomers =
                                   connection.CreateCommand();
                selectAllCustomers.CommandText =
                "SELECT e.unitid ,e.id,e.fullname as name FROM hrm.dbo.Employees e ";

                connection.Open();
                customers.Load(selectAllCustomers.ExecuteReader
                            (CommandBehavior.CloseConnection));
            }
            return customers;
        }

        private DataTable CreateTreeList(string unitid)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
            SqlConnection sqlcnn = new SqlConnection(connectionString);
            DataTable table = new DataTable();
            DataColumn colum;
            DataRow row;
            SqlDataReader dr;
            string id = "";
            if (unitid.ToString().Contains("e") || unitid.ToString().Contains("u"))
            {
                id = unitid.ToString().Substring(1);
            }
            else
            {
                id = unitid.ToString();
            }
            colum = new DataColumn("Id");
            table.Columns.Add(colum);
            colum = new DataColumn("Name");
            table.Columns.Add(colum);
            colum = new DataColumn("ParentId");
            table.Columns.Add(colum);
            if (unitid.Contains("e") == false)
            {
                if (objUnit.GetChildUnits(Int32.Parse(id)).Count > 0)
                {
                    string sql = "SELECT * FROM hrm.dbo.Unit WHERE status = 1 and parentid=" + id + "  and YEAR(FunctionDate) =1900 ORDER BY  Name ASC";
                    //  sqlcnn.Close();
                    SqlConnection sqlcnn1 = new SqlConnection(connectionString);
                    SqlCommand sqlCmd1 = new SqlCommand(sql, sqlcnn1);
                    if (sqlcnn1.State == ConnectionState.Closed)
                    {
                        sqlcnn1.Open();
                    }
                    SqlDataReader dr1;
                    sqlCmd1.CommandText = sql;
                    dr1 = sqlCmd1.ExecuteReader();
                    while (dr1.Read())
                    {
                        row = table.NewRow();
                        row[0] = dr1["id"].ToString();
                        row[1] = dr1["name"].ToString();
                        row[2] = dr1["parentid"].ToString();
                        table.Rows.Add(row);
                    }
                }
            }
            return table;
        }
        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {
            DataRowView rowView = e.NodeObject as DataRowView;
            if (rowView == null) return;
            e.NodeKeyValue = rowView["Id"];
            DataView dv1 = new DataView(GetChild(), "parentid=" + rowView["Id"] + "", "Name", DataViewRowState.CurrentRows);
            if (dv1.Count > 0)
            {
                e.IsLeaf = false;
            }
            else
            {
                e.IsLeaf = true;
            }
            e.SetNodeValue("IconName", "frontpage");
            e.SetNodeValue("Name", rowView["Name"]);
        }
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {
            DataView children = null;
            DataRowView parent = e.NodeObject as DataRowView;
            if (parent == null)
            {
                DataView dv = new DataView(GetTable());
                children = dv;
                e.Children = children;
            }
            else
            {
                string id = parent["id"].ToString();
                DataView dv1 = new DataView(CreateTreeList(id));
                if (dv1.Count > 0)
                {
                    children = dv1;
                    e.Children = children;
                }
            }
        }
        #endregion

        protected string GetIconUrl(TreeListDataCellTemplateContainer container)
        {
            return string.Format("~/Images/Menu/{0}.png", container.GetValue("IconName"));
        }

        
        protected void gridThanhVien_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            if (e.Parameters.Trim() == "update")
            {

            }
            else
            {

                this.gridThanhVien.DataSource = objEmployees.GetEmployeesByUnit(Int32.Parse(e.Parameters.Trim()));
                this.gridThanhVien.DataBind();
                Session["unitId"] = Int32.Parse(e.Parameters.Trim());
            }
        }
        protected void gridThanhVien_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                LinkButton linkTaiKhoan = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "linkTaiKhoan") as LinkButton;
                if (linkTaiKhoan != null)
                {
                    if (CheckUser(objEmployees.GetEmployees(Int32.Parse(e.CellValue.ToString().Trim())).empcode.Trim()).Rows.Count <= 0)
                    {
                        linkTaiKhoan.Text = "Cấp User";

                    }
                    else
                    {
                        linkTaiKhoan.Text = objEmployees.GetEmployees(Int32.Parse(e.CellValue.ToString().Trim())).empcode.Trim();
                    }
                    linkTaiKhoan.OnClientClick = string.Format("cbpnQuyen.PerformCallback('CapUser:{0}'); return false;", e.CellValue) ;
                }
            }
            else if (e.DataColumn.FieldName == "")
            {
                LinkButton linkMatkhau = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "linkMatkhau") as LinkButton;
                if (linkMatkhau != null)
                {
                    linkMatkhau.OnClientClick = string.Format("cbpnQuyen.PerformCallback('PhucHoi:{0}'); return false;", e.KeyValue);
                }
            }
            else if (e.DataColumn.FieldName == "positionid")
            {
                ASPxLabel lblChucVu = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lblChucVu") as ASPxLabel;
                {
                    VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
                    if (objPosition.GetPosition(Int32.Parse(e.CellValue.ToString())) != null)
                    {
                        if (lblChucVu != null)
                        {
                            lblChucVu.Text = objPosition.GetPosition(Int32.Parse(e.CellValue.ToString())).name;
                        }
                    }
                }
            }

        }

        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        public static DataTable Roles()
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[GetRoles]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("roleid");
            Table.Columns.Add(Col);
            Col = new DataColumn("rolename");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["roleid"].ToString();
                Row[1] = Dr["rolename"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();

            return Table;
        }
        public static DataTable CheckUser(string code)
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[TN_CheckUser]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = code;

            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("userid");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["userid"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();

            return Table;
        }
        public static DataTable GetUserRole(int userid, int portalid)
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[GetUserRoles]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = userid;

            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("roleid");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["roleid"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();

            return Table;
        }
        public static int GetUserByUserName(string username)
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();

            SqlDataReader Dr;
            int userid = 0;
            Cmd = new SqlCommand("[TN_GetUserByUserName]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;

            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();



            while (Dr.Read())
            {
                userid = int.Parse(Dr["userid"].ToString());

            }
            Dr.Close();
            Cnn.Close();

            return userid;
        }
        public static DataTable GetPassword()
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
            SqlDataReader Dr;

            Cmd = new SqlCommand("[GetPassWord]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;

            Cnn.Open();

            Dr = Cmd.ExecuteReader(CommandBehavior.CloseConnection);
            Cmd.Dispose();

            Col = new DataColumn("applicationid");
            Table.Columns.Add(Col);
            Col = new DataColumn("userid");
            Table.Columns.Add(Col);
            Col = new DataColumn("password");
            Table.Columns.Add(Col);
            Col = new DataColumn("passwordSalt");
            Table.Columns.Add(Col);
            Col = new DataColumn("createDate");
            Table.Columns.Add(Col);

            while (Dr.Read())
            {
                Row = Table.NewRow();
                Row[0] = Dr["applicationid"].ToString();
                Row[1] = Dr["userid"].ToString();
                Row[2] = Dr["password"].ToString();
                Row[3] = Dr["passwordSalt"].ToString();
                Row[4] = Dr["createDate"].ToString();
                Table.Rows.Add(Row);
            }
            Dr.Close();
            Cnn.Close();

            return Table;
        }

        public static void InsertRole(int userid, int roleid)
        {
            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            Cmd = new SqlCommand("[TN_InsertRole]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userid;
            Cmd.Parameters.Add("@roleid", SqlDbType.Int).Value = roleid;
            Cmd.Parameters.Add("@expiryDate", SqlDbType.DateTime).Value = "1/1/3000";
            Cmd.Parameters.Add("@isTrialUsed", SqlDbType.Bit).Value = true;
            Cmd.Parameters.Add("@effectiveDate", SqlDbType.DateTime).Value = DateTime.Now;
            Cmd.Parameters.Add("@createdByUserID", SqlDbType.Int).Value = 1;
            Cmd.Parameters.Add("@createdOnDate", SqlDbType.DateTime).Value = DateTime.Now;
            Cmd.Parameters.Add("@lastModifiedByUserID", SqlDbType.Int).Value = 1;
            Cmd.Parameters.Add("@lastModifiedOnDate", SqlDbType.DateTime).Value = DateTime.Now;

            Cnn.Open();

            Cmd.ExecuteNonQuery();


            Cnn.Close();
        }

        public static void InsertUser(int userid, string username, string firstname, string displayName)
        {


            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            Cmd = new SqlCommand("[HRM_InsertUser]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userid;
            Cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;
            Cmd.Parameters.Add("@firstname", SqlDbType.NVarChar).Value = firstname;
            Cmd.Parameters.Add("@lastname", SqlDbType.NVarChar).Value = firstname;
            Cmd.Parameters.Add("@displayName", SqlDbType.NVarChar).Value = displayName;
            Cmd.Parameters.Add("@createdOnDate", SqlDbType.DateTime).Value = DateTime.Now;
            Cmd.Parameters.Add("@lastModifiedOnDate", SqlDbType.DateTime).Value = DateTime.Now;

            Cnn.Open();

            Cmd.ExecuteNonQuery();


            Cnn.Close();
        }

        public static void InsertPass(string userid, string appid, string password, string username, string passwordSalt, DateTime createDate)
        {


            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            Cmd = new SqlCommand("[Insert_Password]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@userid", SqlDbType.NVarChar).Value = userid;
            Cmd.Parameters.Add("@applicationid", SqlDbType.NVarChar).Value = appid;
            Cmd.Parameters.Add("@password", SqlDbType.NVarChar).Value = password;
            Cmd.Parameters.Add("@username", SqlDbType.NVarChar).Value = username;
            Cmd.Parameters.Add("@loweredUserName", SqlDbType.NVarChar).Value = username;
            Cmd.Parameters.Add("@passwordSalt", SqlDbType.NVarChar).Value = passwordSalt;
            Cmd.Parameters.Add("@createDate", SqlDbType.DateTime).Value = createDate;

            Cnn.Open();

            Cmd.ExecuteNonQuery();


            Cnn.Close();
        }

        public void RemoveRole(int roleId, int userId)
        {
            string sqlRemoveRole = @"
                DELETE FROM  dnn_UserRoles
                WHERE RoleID = @roleId AND UserID = @userID
                ";
            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand command = new SqlCommand(sqlRemoveRole, connection))
                {
                    command.CommandText = sqlRemoveRole;
                    command.CommandType = CommandType.Text;
                    command.Parameters.Add(new SqlParameter("roleId", roleId));
                    command.Parameters.Add(new SqlParameter("userID", userId));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        public static void DeleteRole(int userid)
        {


            string strConn = getConnectionString();
            SqlConnection Cnn = new SqlConnection(strConn);
            SqlCommand Cmd;
            Cmd = new SqlCommand("[TN_DeleteRole]", Cnn);
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.Parameters.Add("@userid", SqlDbType.Int).Value = userid;

            Cnn.Open();

            Cmd.ExecuteNonQuery();


            Cnn.Close();
        }

        DataTable LoadAllRoleList()
        {
            string sqlGetUserByPortal = @"
                SELECT R.RoleID, (R.RoleName + ' (' + A.HTTPAlias + ')') as RoleName
                FROM  dnn_Roles AS R JOIN dnn_PortalAlias AS A ON R.PortalId = A.PortalId
                ";
            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand command = new SqlCommand(sqlGetUserByPortal, connection))
                {
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    connection.Open();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0];
                }
            }
        }

        DataTable LoadAllUserRoleList(int userId)
        {
            string sqlGetUserRole = @"
                SELECT R.RoleID, R.RoleName
                FROM  dbo.dnn_UserRoles AS UR INNER JOIN
                      dbo.dnn_Users AS U ON UR.UserID = U.UserID INNER JOIN
                      dbo.dnn_Roles AS R ON UR.RoleID = R.RoleID
                WHERE U.UserID = @UserId
                ";
            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand command = new SqlCommand(sqlGetUserRole, connection))
                {
                    command.Parameters.Add(new SqlParameter("UserId", userId));
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    connection.Open();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0];
                }
            }
        }

        protected void lstQuyen_Load(object sender, EventArgs e)
        {
            ASPxListBox lstQuyen = sender as ASPxListBox;

            if (GetText("empcode") != null && GetText("empcode").Trim() != "")
            {
                if (CheckUser(GetText("empcode").Trim()).Rows.Count > 0)
                {
                    lstQuyen.DataSource = Roles();
                    lstQuyen.DataBind();
                    if (GetUserByUserName(GetText("empcode").Trim()) != null)
                    {
                        int userid = GetUserByUserName(GetText("empcode").Trim());
                        for (int j = 0; j < GetUserRole(userid, 0).Rows.Count; j++)
                        {
                            for (int i = 0; i < Roles().Rows.Count; i++)
                            {
                                if (GetUserRole(userid, 0).Rows[j]["roleid"].ToString().Trim() == Roles().Rows[i]["roleid"].ToString().Trim())
                                {
                                    lstQuyen.Items[i].Selected = true;
                                }
                            }
                        }
                    }
                }
            }
        }
        protected void gridThanhVien_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#D8E8FF';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
        }
        public static int GetMaxId()
        {
            string sql = "SELECT max(userid) as id FROM DNN_Users";
            string strConn = getConnectionString();

            object obj = SqlHelper.ExecuteScalar(strConn, CommandType.Text, sql);
            return Convert.ToInt32(obj);

        }
      
        protected void hdId_Load(object sender, System.EventArgs e)
        {
            HiddenField txt = sender as HiddenField;
            if (GetText("id") != null && GetText("id").Trim() != "")
            {
                txt.Value = GetText("id");
            }
        }
        private string GetText(string fieldName)
        {
            int index = gridThanhVien.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                if (gridThanhVien.GetRowValues(index, fieldName) != null)
                {
                    values = gridThanhVien.GetRowValues(index, fieldName).ToString();
                }
            }
            return values;
        }

        protected void loadPortalDestForTransfer(object sender, EventArgs e)
        {
            ASPxComboBox cbbPortal = sender as ASPxComboBox;

            DataTable tblPortal = GetPortalInfoList();
            DataRow row = tblPortal.NewRow();

            row = tblPortal.NewRow();
            row[0] = -1;
            row[1] = "Tất cả portal";
            tblPortal.Rows.InsertAt(row, 0);

            row = tblPortal.NewRow();
            row[0] = -2;
            row[1] = "Chọn portal đích";
            tblPortal.Rows.InsertAt(row, 0);

            cbbPortal.DataSource = tblPortal;
            cbbPortal.DataBind();
            cbbPortal.SelectedIndex = 0;

        }

        protected void loadPortal(object sender, EventArgs e)
        {
            ASPxComboBox cbbPortal = sender as ASPxComboBox;
            GridViewEditFormTemplateContainer container = cbbPortal.NamingContainer as GridViewEditFormTemplateContainer;
            if (!container.Grid.IsNewRowEditing)
            {
                DataTable tblPortal = GetPortalInfoList();
                DataRow row = tblPortal.NewRow();
                row[0] = -1;
                row[1] = "Tất cả portal";
                tblPortal.Rows.InsertAt(row, 0);

                row = tblPortal.NewRow();
                row[0] = -2;
                row[1] = "Chọn portal";
                tblPortal.Rows.InsertAt(row, 0);

                cbbPortal.DataSource = tblPortal;
                cbbPortal.DataBind();

                
            }

        }

        private void LoadQuyen(ASPxListBox lstQuyen, int userId, int portalId)
        {
            if (portalId == -2) return;

            DataTable tblPortalRole;
            DataTable tblUserPortalRole;
            if (portalId == -1)
            {
                tblPortalRole = LoadAllRoleList();
                tblUserPortalRole = LoadAllUserRoleList(userId);
            }
            else
            {
                tblPortalRole = GetRolesByPortal(portalId);

                tblUserPortalRole = GetUserRolesByPortal(userId, portalId);
            }

            lstQuyen.DataSource = tblPortalRole;
            lstQuyen.DataBind();

            for (int j = 0; j < tblPortalRole.Rows.Count; j++)
            {
                DataRow ptRole = tblPortalRole.Rows[j];
                for (int i = 0; i < tblUserPortalRole.Rows.Count; i++)
                {
                    DataRow usRole = tblUserPortalRole.Rows[i];

                    if (Convert.ToInt32(usRole["RoleId"]) == Convert.ToInt32(ptRole["RoleId"]))
                    {
                        lstQuyen.Items[j].Selected = true;
                        break;
                    }
                }
            }
        }

        private DataTable GetPortalInfoList()
        {
            string sqlGetPortalInfo = @"
                SELECT p.PortalId,
                    (SELECT TOP 1 HTTPAlias FROM dnn_PortalAlias WHERE PortalID = p.PortalId) as HTTPAlias
                FROM dnn_Portals p
                ";

            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                
                using (SqlCommand command = new SqlCommand(sqlGetPortalInfo, connection))
                {
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    connection.Open();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0];
                }
            }
        }

        protected void cbpnQuyen_Callback(object sender, CallbackEventArgsBase e)
        {
            if (e.Parameter.StartsWith("CapUser"))
            {
                int empId = Convert.ToInt32(e.Parameter.Split(':')[1]);
                bool bRet = CapUser(empId);
                if (bRet)
                    cbpnQuyen.JSProperties["cpOP"] = 1;
                else
                    cbpnQuyen.JSProperties["cpOP"] = 2;
                return;
            }
            if (e.Parameter.StartsWith("PhucHoi"))
            {
                int empId = Convert.ToInt32(e.Parameter.Split(':')[1]);
                bool bRet = PhucHoi(empId);
                if (bRet) 
                    cbpnQuyen.JSProperties["cpOP"] = 3;
                else
                    cbpnQuyen.JSProperties["cpOP"] = 4;
                return;
            }

            ASPxListBox lstQuyen = gridThanhVien.FindEditFormTemplateControl("lstQuyen") as ASPxListBox;
            ASPxComboBox cbbPortal = gridThanhVien.FindEditFormTemplateControl("cbbPortal") as ASPxComboBox;

            int portalId = Convert.ToInt32(cbbPortal.SelectedItem.Value);

            if (portalId == -2) return;

            string empcode = GetText("empcode");
            int userId = GetUserByUserName(empcode);

            DataTable tblPortalRole;
            if (portalId == -1)
            {
                tblPortalRole = LoadAllRoleList();
            }
            else
            {
                tblPortalRole = GetRolesByPortal(portalId);
            }

            lstQuyen.DataSource = tblPortalRole;
            lstQuyen.DataBind();

            if (e.Parameter == "UpdateRole")
            {
                string strRoles = hdf_RoleId.Get("RoleList").ToString();

                string[] arRoles = strRoles.Split(',');

                for (int j = 0; j < tblPortalRole.Rows.Count; j++)
                {
                    bool bSelected = false;
                    int ptRole = Convert.ToInt32(tblPortalRole.Rows[j]["RoleId"]);
                    foreach (string strRole in arRoles)
                    {
                        if (ptRole == Convert.ToInt32(strRole))
                        {
                            bSelected = true;
                            break;
                        }
                    }
                    RemoveRole(ptRole, userId);
                    lstQuyen.Items[j].Selected = bSelected;
                    if (bSelected)
                    {
                        InsertRole(userId, ptRole);
                    }
                }
            }
            else
            {
                DataTable tblUserPortalRole;
                if (portalId == -1)
                {
                    tblUserPortalRole = LoadAllUserRoleList(userId);
                }
                else
                {
                    tblUserPortalRole = GetUserRolesByPortal(userId, portalId);
                }
                for (int j = 0; j < tblPortalRole.Rows.Count; j++)
                {
                    DataRow ptRole = tblPortalRole.Rows[j];
                    for (int i = 0; i < tblUserPortalRole.Rows.Count; i++)
                    {
                        DataRow usRole = tblUserPortalRole.Rows[i];

                        if (Convert.ToInt32(usRole["RoleId"]) == Convert.ToInt32(ptRole["RoleId"]))
                        {
                            lstQuyen.Items[j].Selected = true;
                            break;
                        }
                    }
                }
            }
            
        }

        protected DataTable GetRolesByPortal(int portalID)
        {
            string sqlGetUserByPortal = @"
                SELECT R.RoleID, R.RoleName
                FROM  dnn_Roles AS R
                WHERE PortalID = @PortalId
                ";
            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand command = new SqlCommand(sqlGetUserByPortal, connection))
                {
                    command.Parameters.Add(new SqlParameter("PortalId", portalID));
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    connection.Open();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0];
                }
            }
        }

        protected DataTable GetUserRolesByPortal(int userId, int portalID)
        {
            string sqlGetUserByPortal = @"
                SELECT R.RoleID, R.RoleName
                FROM  dbo.dnn_UserRoles AS UR INNER JOIN
                      dbo.dnn_Users AS U ON UR.UserID = U.UserID INNER JOIN
                      dbo.dnn_Roles AS R ON UR.RoleID = R.RoleID
                WHERE U.UserID = @UserId AND R.PortalID = @PortalId
                ";
            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand command = new SqlCommand(sqlGetUserByPortal, connection))
                {
                    command.Parameters.Add(new SqlParameter("UserId", userId));
                    command.Parameters.Add(new SqlParameter("PortalId", portalID));
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    connection.Open();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0];
                }                
            }
        }


        #endregion

        protected void cbpnTransfer_Callback(object sender, CallbackEventArgsBase e)
        {
            int destPortal = Convert.ToInt32(e.Parameter);
            
            if (destPortal != -1)
            {
                TransferUser(destPortal);
            }
            else
            {
                List<int> portalIdList = new List<int>();
                string sqlGetAllPortalId = @"SELECT PortalId FROM dnn_Portals";
                SqlConnection conn = new SqlConnection(getConnectionString());
                SqlCommand comm = new SqlCommand();
                //get all portal
                comm.Connection = conn;
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlGetAllPortalId;
                conn.Open();
                var dataReader = comm.ExecuteReader();
                while (dataReader.Read())
                {
                    portalIdList.Add((int)dataReader[0]);
                }
                conn.Close();
                foreach (int portalId in portalIdList)
                {
                    TransferUser(portalId);
                }
            }
        }

        private void TransferUser(int destPortal)
        {
            string sqlGetUser = @"
                            SELECT u.UserId
                            FROM dnn_Users u
                            WHERE u.Username != 'host' AND 
                                u.UserId NOT IN 
                                    ( SELECT DISTINCT u2.UserId 
                                      FROM dnn_Users u2 JOIN dnn_UserRoles ur on u2.UserId = ur.UserId  
                                             JOIN dnn_Roles r on ur.RoleId = r.RoleId
                                      WHERE r.RoleName = 'Administrators'
                                    )
                            ";

            string sqlGetUserFromPortal = @"
                            SELECT UserId
                            FROM dnn_UserPortals
                            WHERE PortalId=@portalId
                            ";

            string sqlAddUserToPortal = @"
                            INSERT INTO dnn_UserPortals (userId, PortalId, CreatedDate) 
                            SELECT Value, @portalId, GetDate()
                            FROM funcListToTableInt(@UserIdList, ',')
                            ";

            string sqlGetRegRole = @"SELECT RoleId FROM dnn_Roles WHERE PortalId=@portalId AND RoleName = 'Registered Users' ";
            string sqlGetSubRole = @"SELECT RoleId FROM dnn_Roles WHERE PortalId=@portalId AND RoleName = 'Subscribers' ";

            string sqlInsertRole = @"
                            INSERT INTO dnn_UserRoles (userId, roleId)
                            SELECT Value, @roleId
                            FROM funcListToTableInt(@UserIdList, ',')
                            ";

            string sqlGetAdminId = @"
                            SELECT UserId
                            FROM dnn_Users 
                            WHERE Username = 'admin'
                            ";
            string sqlGetAdmRole = @"SELECT RoleId FROM dnn_Roles WHERE PortalId=@portalId AND RoleName = 'Administrators' ";
            string sqlCheckAdmRole = @"
                            SELECT Count(*) 
                            FROM dnn_UserRoles ur
                            WHERE ur.UserId=@userId AND ur.RoleId=@roleId";
            string sqlAddAdmRole = @"INSERT INTO dnn_UserRoles (userId, roleId) VALUES(@userId, @roleId)";

            using (SqlConnection connection = new SqlConnection(getConnectionString()))
            {
                using (SqlCommand command = new SqlCommand())
                {
                    List<int> portalUserSrcList = new List<int>();
                    List<int> portalUserDstList = new List<int>();
                    command.Connection = connection;

                    command.CommandText = sqlGetUser;
                    command.CommandType = CommandType.Text;
                    connection.Open();
                    IDataReader usrSrcReader = command.ExecuteReader();
                    while (usrSrcReader.Read())
                    {
                        int pid = (int)usrSrcReader[0];
                        if (!portalUserSrcList.Contains(pid))
                            portalUserSrcList.Add((int)usrSrcReader[0]);
                    }
                    connection.Close();

                    command.CommandText = sqlGetUserFromPortal;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("portalId", destPortal));
                    connection.Open();
                    IDataReader usrDstReader = command.ExecuteReader();
                    while (usrDstReader.Read())
                    {
                        int pid = (int)usrDstReader[0];
                        if (!portalUserDstList.Contains(pid))
                            portalUserDstList.Add(pid);
                    }
                    connection.Close();

                    foreach (int uid in portalUserDstList)
                    {
                        if (portalUserSrcList.Contains(uid))
                            portalUserSrcList.Remove(uid);
                    }

                    //add user to portal
                    string UserIdList = string.Empty;
                    bool bStart = true;
                    foreach (int uid in portalUserSrcList)
                    {
                        if (bStart)
                        {
                            bStart = false;
                            UserIdList = uid.ToString();
                        }
                        else
                        {
                            UserIdList += String.Format(",{0}", uid);
                        }
                    }
                    command.CommandText = sqlAddUserToPortal;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("UserIdList", UserIdList));
                    command.Parameters.Add(new SqlParameter("portalId", destPortal));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    //get reg role
                    command.CommandText = sqlGetRegRole;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("portalId", destPortal));
                    connection.Open();
                    int RegRoleId = (int)command.ExecuteScalar();
                    connection.Close();

                    //get sub role
                    command.CommandText = sqlGetSubRole;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("portalId", destPortal));
                    connection.Open();
                    int SubRoleId = (int)command.ExecuteScalar();
                    connection.Close();

                    //add reg role to all user
                    command.CommandText = sqlInsertRole;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("UserIdList", UserIdList));
                    command.Parameters.Add(new SqlParameter("roleId", RegRoleId));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                    //add sub role to all user
                    command.CommandText = sqlInsertRole;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("UserIdList", UserIdList));
                    command.Parameters.Add(new SqlParameter("roleId", SubRoleId));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();

                    //get portal admin role
                    command.CommandText = sqlGetAdmRole;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("portalId", destPortal));
                    connection.Open();
                    int admRoleId = (int)command.ExecuteScalar();
                    connection.Close();
                    //get admin id
                    command.CommandText = sqlGetAdminId;
                    command.Parameters.Clear();
                    connection.Open();
                    int adminId = (int)command.ExecuteScalar();
                    connection.Close();
                    //check admin role
                    command.CommandText = sqlCheckAdmRole;
                    command.Parameters.Clear();
                    command.Parameters.Add(new SqlParameter("userId", adminId));
                    command.Parameters.Add(new SqlParameter("roleId", admRoleId));
                    connection.Open();
                    int nCountAdmRole = (int)command.ExecuteScalar();
                    connection.Close();
                    //add admin role to admin user
                    if (nCountAdmRole == 0)
                    {
                        command.CommandText = sqlAddAdmRole;
                        command.Parameters.Clear();
                        command.Parameters.Add(new SqlParameter("userId", adminId));
                        command.Parameters.Add(new SqlParameter("roleId", admRoleId));
                        connection.Open();
                        command.ExecuteNonQuery();
                        connection.Close();
                    }
                }
            }
        }

        private bool CapUser(int empId)
        {
            try
            {
                VNPT.Modules.Employees.EmployeesInfo empInfor = objEmployees.GetEmployees(empId);
                if (empInfor == null) return false;

                string sqlCheckUserExisted = "SELECT count(UserId) FROM dnn_Users WHERE Username=@userName";

                string sqlGetAllPortalId = @"
                            SELECT PortalId 
                            FROM dnn_Portals 
                            ";

                string sqlGetUserPortal = @"
                            SELECT p.PortalId
                            FROM dnn_Portals p JOIN dnn_UserPortals pu on p.PortalId = pu.PortalId
                            WHERE pu.UserId = @userId
                        ";

                string sqlAddUserToPortal = @"
                            INSERT INTO dnn_UserPortals (userId, PortalId, CreatedDate) 
                            SELECT @userId, Value, GetDate()
                            FROM funcListToTableInt(@portalIdList, ',') as tblPortalId
                            ";

                string sqlInsertRole = @"
                            INSERT INTO dnn_UserRoles (userId, roleId)
                            SELECT @userId, R.RoleId
                            FROM   funcListToTableInt(@portalIdList,',') as tblPortalId
                                    JOIN dnn_Roles R ON tblPortalId.Value = R.PortalId
                            WHERE  R.RoleName = 'Registered Users' OR R.RoleName = 'Subscribers' ";

                SqlConnection conn = new SqlConnection(getConnectionString());
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlCheckUserExisted;
                comm.Parameters.Add(new SqlParameter("userName", empInfor.empcode.Trim()));
                conn.Open();
                int nCountUser = (int)comm.ExecuteScalar();
                conn.Close();

                int userId;
                if (nCountUser == 0)
                {
                    UserInfo info = new UserInfo();
                    info.PortalID = this.PortalId;
                    info.FirstName = empInfor.empcode.Trim();
                    info.LastName = empInfor.fullname.Trim();
                    info.FullName = empInfor.fullname.Trim();
                    info.DisplayName = empInfor.fullname;
                    info.Username = empInfor.empcode.Trim();

                    info.Profile.PreferredLocale = PortalSettings.DefaultLanguage;
                    info.Profile.TimeZone = PortalSettings.TimeZoneOffset;
                    info.Profile.FirstName = info.FirstName;
                    info.Profile.LastName = info.LastName;

                    info.Membership.Approved = true;
                    info.Membership.CreatedDate = System.DateTime.Now;
                    info.Membership.IsOnLine = false;
                    info.Membership.Password = "abc123456";

                    UserCreateStatus createStatus = UserController.CreateUser(ref info);
                    if (UserCreateStatus.Success == createStatus)
                    {
                        userId = info.UserID;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    string sqlGetUserID = "select UserID from dnn_Users where Username = '" + empInfor.empcode.Trim() + "'";
                    comm.CommandText = sqlGetUserID;
                    comm.Parameters.Clear();
                    conn.Open();
                    userId = (int)comm.ExecuteScalar();
                    conn.Close();
                }

                List<int> portalIdList = new List<int>();
                List<int> portalIdUserList = new List<int>();

                //get all portal
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlGetAllPortalId;
                comm.Parameters.Clear();
                conn.Open();
                var dataReader = comm.ExecuteReader();
                while (dataReader.Read())
                {
                    portalIdList.Add((int)dataReader[0]);
                }
                conn.Close();

                //get user portal
                comm.CommandText = sqlGetUserPortal;
                comm.Parameters.Clear();
                comm.Parameters.Add(new SqlParameter("userId", userId));
                conn.Open();
                dataReader = comm.ExecuteReader();
                while (dataReader.Read())
                {
                    portalIdUserList.Add((int)dataReader[0]);
                }
                conn.Close();

                foreach (int pid in portalIdUserList)
                {
                    portalIdList.Remove(pid);
                }

                string strPortalIdList = string.Empty;
                bool bStart = true;
                foreach (int pid in portalIdList)
                {
                    if (bStart)
                    {
                        bStart = false;
                        strPortalIdList = pid.ToString();
                    }
                    else
                    {
                        strPortalIdList += string.Format(",{0}", pid);
                    }
                }

                //Add user to all portal
                comm.CommandText = sqlAddUserToPortal;
                conn.Open();
                comm.Parameters.Clear();
                comm.Parameters.Add(new SqlParameter("userId", userId));
                comm.Parameters.Add(new SqlParameter("portalIdList", strPortalIdList));
                comm.ExecuteNonQuery();
                conn.Close();

                //add role to portals
                comm.CommandText = sqlInsertRole;
                comm.Parameters.Clear();
                comm.Parameters.Add(new SqlParameter("userId", userId));
                comm.Parameters.Add(new SqlParameter("portalIdList", strPortalIdList));
                conn.Open();
                comm.ExecuteNonQuery();
                conn.Close();
               
                return true;
            }
            catch
            {
                return false;
            }
        }

        private bool PhucHoi(int empId)
        {
            VNPT.Modules.Employees.EmployeesInfo empInfor = objEmployees.GetEmployees(empId);
            
            if (CheckUser(empInfor.empcode.Trim()).Rows.Count > 0)
            {
                MembershipUser user = Membership.GetUser(empInfor.empcode.Trim());
                //user.pas
                string newpass = Server.HtmlEncode("abc123456");
                string oldpass = user.GetPassword();
                if (user.ChangePassword(user.GetPassword(), newpass))
                {
                    return true;
                }
            }
            return false;
        }
    }
}

