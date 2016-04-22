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
using VNPT.Modules.Unit;
using VNPT.Modules.Employees;
using System.Configuration;

namespace VNPT.Modules.CapUser
{
    partial class ViewNhanVien : PortalModuleBase
    {             
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private string strconn_user = ConfigurationManager.ConnectionStrings["SiteSqlServer"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!IsPostBack)
            {
                treelist_donvi.ExpandToLevel(1);
            }
        }
        #region Tree
        
        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {
            var node = (DataRowView)e.NodeObject;
            e.IsLeaf = !(bool)node["HasChild"];
            e.NodeKeyValue = node["MA_DV"];
            e.SetNodeValue("TEN", node["TEN"]);
        }
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {
            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);

            if (e.NodeObject == null)
            {
                DataTable tb_dstt = SqlHelper.ExecuteDataset(strconn, "SP_CAPTHOCHUC_GET", ma_unit, 0, 0).Tables[0];
                e.Children = new DataView(tb_dstt);
            }
            else
            {
                decimal id_cha = Convert.ToDecimal(((DataRowView)e.NodeObject)["MA_DV"]);
                DataTable tb_dstt = SqlHelper.ExecuteDataset(strconn, "SP_CAPTHOCHUC_GET", "", id_cha, 1).Tables[0];
                e.Children = new DataView(tb_dstt);
            }
        }
        #endregion
        private bool CapUser(string username, string ten)
        {
            try
            {              
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

                SqlConnection conn = new SqlConnection(strconn_user);
                SqlCommand comm = new SqlCommand();
                comm.Connection = conn;
                comm.CommandType = CommandType.Text;
                comm.CommandText = sqlCheckUserExisted;
                comm.Parameters.Add(new SqlParameter("userName", username));
                conn.Open();
                int nCountUser = (int)comm.ExecuteScalar();
                conn.Close();

                int userId;
                if (nCountUser == 0)
                {
                    UserInfo info = new UserInfo();
                    info.PortalID = this.PortalId;
                    info.FirstName = "";
                    info.LastName = "";                 
                    info.DisplayName = ten;
                    info.Username = username;

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
                    string sqlGetUserID = "select UserID from dnn_Users where Username = '" + username + "'";
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

        private void XoaUser(string username)
        {            
            string sqlXoaUser = @"
            delete dnn_UserRoles where UserID = (SELECT UserID FROM dnn_Users where Username = @username);
            delete dnn_Users where Username = @username;
            delete aspnet_Membership where UserId = (SELECT UserId FROM aspnet_Membership WHERE UserID IN (SELECT UserID FROM aspnet_Users WHERE UserName=@username));
            delete aspnet_Users where UserName = @username";
            using (SqlConnection connection = new SqlConnection(strconn_user))
            {
                using (SqlCommand command = new SqlCommand(sqlXoaUser, connection))
                {
                    command.CommandType = CommandType.Text;
                    command.Parameters.Add(new SqlParameter("username", username));
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }
            }
        }

        private bool PhucHoi(string username)
        {
            if (IsUserExisted(username))
            {
                MembershipUser user = Membership.GetUser(username);
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
        public bool IsUserExisted(string username)
        {
            string sqlCheckUser = @"
                SELECT count(Username) 
                FROM dnn_Users u
                WHERE u.Username=@username
            ";
            using (SqlConnection connection = new SqlConnection(strconn_user))
            {
                using (SqlCommand command = new SqlCommand(sqlCheckUser, connection))
                {
                    command.CommandType = CommandType.Text;
                    command.Parameters.Add(new SqlParameter("username", username));
                    connection.Open();
                    int nCount = (int)command.ExecuteScalar();
                    connection.Close();
                    return nCount > 0;
                }
            }
        }
        protected void gridThanhVien_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string[] keys = e.Parameters.Split(';');
            string dieukien = keys[0];

            if (dieukien == "cap")
            {
                string username = keys[1];
                string ten = keys[2];
                CapUser(username, ten);                
            }
            else if (dieukien == "xoa")
            {
                string username = keys[1];
                XoaUser(username);
            }
            else if (dieukien == "phuchoi")
            {
                string username = keys[1];
                PhucHoi(username);
            }
            else if (dieukien == "thanhvien")
            {
                string username = keys[1];
                SqlHelper.ExecuteNonQuery(strconn, "QLDV_NHANVIEN", username, 1);
                gridThanhVien.JSProperties["cpXoa"] = 1;
            }
            else
            {
                decimal ma_dv = Convert.ToDecimal(dieukien);
                DataTable ls_thanhvien = SqlHelper.ExecuteDataset(strconn, "sp_qldv_thanhvien_get", ma_dv, 0).Tables[0];
                gridThanhVien.DataSource = ls_thanhvien;
                gridThanhVien.DataBind();
            }
        }
        protected void gridThanhVien_HtmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='#D8E8FF';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
        }
        protected void gridThanhVien_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.Caption == "Cấp/xóa tài khoản")
            {
                LinkButton linkTaiKhoan = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "linkTaiKhoan") as LinkButton;
                if (linkTaiKhoan != null)
                {
                    string username = e.GetValue("ma_thanhvien").ToString();
                    if (!IsUserExisted(username))
                    {
                        linkTaiKhoan.Text = "Cấp";
                        linkTaiKhoan.OnClientClick = "taikhoan_nhanvien(0,'" + e.GetValue("ma_thanhvien") + ";" + e.GetValue("ten_thanhvien") + "');return false;";
                    }
                    else
                    {
                        linkTaiKhoan.Text = "Xóa";
                        linkTaiKhoan.OnClientClick = "taikhoan_nhanvien(1,'" + e.GetValue("ma_thanhvien") + "');return false;";
                    }
                }
            }
            else if (e.DataColumn.Caption == "Mật khẩu")
            {
                LinkButton linkMatkhau = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "linkMatkhau") as LinkButton;

                if (linkMatkhau != null)
                {
                    linkMatkhau.Text = "Phục hồi";
                    linkMatkhau.OnClientClick = "taikhoan_nhanvien(2,'" + e.GetValue("ma_thanhvien") + "');return false;";
                }
            }
            else if (e.DataColumn.Caption == "Cấp quyền")
            {                
                LinkButton linkCapQuyen = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "linkCapQuyen") as LinkButton;

                if (linkCapQuyen != null)
                {
                    linkCapQuyen.Text = "Cấp";
                    linkCapQuyen.OnClientClick = "capquyen_taikhoan('" + e.GetValue("ma_thanhvien") + "');return false;";
                }
            }
            else if (e.DataColumn.Caption == "Hủy thành viên")
            {
                LinkButton linkHuyThanhVien = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "linkHuyThanhVien") as LinkButton;

                if (linkHuyThanhVien != null)
                {
                    linkHuyThanhVien.Text = "Hủy thành viên";
                    linkHuyThanhVien.OnClientClick = "taikhoan_nhanvien(3,'" + e.GetValue("ma_thanhvien") + "');return false;";
                }
            } 
        }
        DataTable LoadAllRoleList()
        {
            string sqlGetUserByPortal = @"
                SELECT R.RoleID, 
                    (SELECT TOP 1 (R.Description) FROM dnn_PortalLocalization AS A WHERE A.PortalId = R.PortalID) as RoleName
                FROM  dnn_Roles AS R
                WHERE R.PortalID = 3 and R.RoleName != 'Administrators' and R.RoleName != 'Registered Users'
                ";
            using (SqlConnection connection = new SqlConnection(strconn_user))
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
        DataTable LoadAllUserRoleList(string username)
        {
            string sqlGetUserRole = @"
                SELECT R.RoleID, R.RoleName
                FROM  dbo.dnn_UserRoles AS UR INNER JOIN
                      dbo.dnn_Users AS U ON UR.UserID = U.UserID INNER JOIN
                      dbo.dnn_Roles AS R ON UR.RoleID = R.RoleID
                WHERE U.Username = @username and R.PortalID = 3 and R.RoleName != 'Administrators' and R.RoleName != 'Registered Users'
                ";
            using (SqlConnection connection = new SqlConnection(strconn_user))
            {
                using (SqlCommand command = new SqlCommand(sqlGetUserRole, connection))
                {
                    command.Parameters.Add(new SqlParameter("username", username));
                    SqlDataAdapter da = new SqlDataAdapter(command);
                    DataSet ds = new DataSet();
                    connection.Open();
                    da.Fill(ds);
                    connection.Close();
                    return ds.Tables[0];
                }
            }
        }
        void hienthi_quyen()
        {
            DataTable tb = LoadAllRoleList();
            listbox_quyen.DataSource = tb;
            listbox_quyen.ValueField = "roleid";
            listbox_quyen.TextField = "rolename";
            listbox_quyen.DataBind();
        }
        protected void listbox_quyen_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string[] keys = e.Parameter.Split(';');
            string dieukien = keys[0];
            string username = keys[1];

            if (dieukien =="hienthi")
            {
                hienthi_quyen();
                DataTable tb = LoadAllUserRoleList(username);
                object[] roleid = new object[listbox_quyen.Items.Count];
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    roleid[i] = tb.Rows[i]["roleid"];
                }
                listbox_quyen.JSProperties["cpDataRole"] = roleid;
                listbox_quyen.JSProperties["cpOp"] = 0;
            }
            else if (e.Parameter.StartsWith("capquyen"))
            {
                int userid = GetUserByUserName(username);

                var data = (object[])hdf_data.Get("data");
                foreach (Dictionary<string, object> item in data)
                {
                    int roleid = Convert.ToInt32(item["id"]);
                    RemoveRole(roleid, userid);

                    if (Convert.ToBoolean(item["chon"]))
                        InsertRole(userid, roleid);
                    
                }
                listbox_quyen.JSProperties["cpOp"] = 1;                
            }
        }
        public void RemoveRole(int roleId, int userId)
        {
            string sqlRemoveRole = @"
                DELETE FROM  dnn_UserRoles
                WHERE RoleID = @roleId AND UserID = @userID
                ";
            using (SqlConnection connection = new SqlConnection(strconn_user))
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
        public void InsertRole(int userid, int roleid)
        {           
            string sql = @"INSERT INTO DNN_UserRoles (Userid,Roleid,ExpiryDate,IsTrialUsed,EffectiveDate,CreatedByUserID,CreatedOnDate,LastModifiedByUserID,LastModifiedOnDate)
	            VALUES(@userid, @roleid,@expiryDate, @isTrialUsed,@effectiveDate,@createdByUserID,@createdOnDate,@lastModifiedByUserID,@lastModifiedOnDate)";
            using (SqlConnection Cnn = new SqlConnection(strconn_user))
            {
                using (SqlCommand Cmd = new SqlCommand(sql, Cnn))
                {
                    Cmd.CommandType = CommandType.Text;
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
            }
        }
        public int GetUserByUserName(string username)
        {           
            string sql = "SELECT UserID FROM [dnn_Users] WHERE Username=@username";
            using (SqlConnection conn = new SqlConnection(strconn_user))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = sql;
                    comm.Parameters.Add(new SqlParameter("username", username));
                    conn.Open();
                    int? oId = (int?)comm.ExecuteScalar();
                    conn.Close();
                    return oId ?? 0;
                }
            }
        }
    }
}

