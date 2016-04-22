using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

using System.Text;
using System.Xml;
using System.Xml.Xsl;
using System.Data.SqlClient;

public partial class admin_Skins_menu5 : DotNetNuke.Entities.Modules.PortalModuleBase
{
    DataTable dt = new DataTable();
    int tabId = 0;
    private static string getConnectionString()
    {
        return DotNetNuke.Common.Utilities.Config.GetConnectionString();
    }

    public static DataTable Select(string strSQL)
    {
        string strConn = getConnectionString();
        SqlConnection conn = new SqlConnection(strConn);
        conn.Open();
        SqlDataAdapter da = new SqlDataAdapter(strSQL, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        conn.Close();
        return dt;
    }

    private void Menu()
    {
        ASPxMenu1.Items.Clear();
        string portalId = this.PortalId.ToString();
        string strSQL = "";
        if (this.UserId > 0)
        {
            if (this.UserId < 3)
            {
                strSQL = "SELECT TabID, TabName,Tabs.TabPath, Title, ParentId, IsVisible,Tabs.taborder,Tabs.hinh_anh  FROM dnn_Tabs Tabs WHERE (Tabs.PortalID = " + portalId + ") and (IsVisible = 1) and (isdeleted = 0) and parentid is null and Tabs.ParentId is null order by taborder asc";
            }
            else
            {
                strSQL = "declare @userid int ";
                strSQL += "select @userid = " + this.UserId + "";
                strSQL += " select Tabs.tabid,Tabs.TabPath, Tabs.title,Tabs.ParentId,Tabs.TabName,Tabs.taborder, Tabs.hinh_anh from dnn_Tabs Tabs";
                strSQL += " inner join (select distinct TabPermission.tabid";
                strSQL += " from dnn_TabPermission TabPermission left outer join";
                strSQL += " dnn_UserRoles UserRoles on TabPermission.roleid = UserRoles.roleid";
                strSQL += " left outer join dnn_Users Users on Users.userid = UserRoles.userid";
                strSQL += " where TabPermission.permissionid=3  and (Users.userid = @userid";
                strSQL += " or TabPermission.roleid=-1 or @userid=1)) as perm";
                strSQL += " on perm.tabid=Tabs.tabid";
                strSQL += " where (Tabs.PortalID = " + portalId + ") and Tabs.isdeleted=0 and parentid is null and IsVisible=1";
                strSQL += " order by taborder asc";
            }
        }
        else
        {
            strSQL += " select distinct Tabs.TabID, Tabs.TabName,Tabs.TabPath, Tabs.Title, Tabs.ParentId,Tabs.taborder,Tabs.hinh_anh  from dnn_Tabs Tabs";
            strSQL += " inner join dnn_TabPermission TabPermission on Tabs.tabid = TabPermission.tabid and (isdeleted = 0)";
            strSQL += " where (Tabs.PortalID = " + portalId + ") and roleid=-1 and IsVisible=1 and parentid is null order by taborder asc";
        }
        dt = Select(strSQL);

        string menu = "";

        string image = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string tabName = Convert.ToString(dt.Rows[i]["Title"]);
            image = dt.Rows[i]["hinh_anh"]+"";
            int tabId = Convert.ToInt32(dt.Rows[i]["TabID"]);
            string link = DotNetNuke.Common.Globals.ApplicationPath + Convert.ToString(dt.Rows[i]["TabPath"]).Replace("//", "/") + "/tabid/" + tabId + "/Default.aspx";

            string sql = "declare @userid int ";
            sql += "select @userid = " + this.UserId + "";
            sql += " select Tabs.tabid, Tabs.title,Tabs.ParentId,Tabs.TabName,Tabs.taborder,Tabs.TabPath,Tabs.hinh_anh ";
            sql += " from dnn_Tabs Tabs inner join (select distinct TabPermission.tabid";
            sql += " from dnn_TabPermission TabPermission left outer join";
            sql += " dnn_UserRoles UserRoles on TabPermission.roleid = UserRoles.roleid";
            sql += " left outer join dnn_Users Users on Users.userid = UserRoles.userid";
            sql += " where TabPermission.permissionid=3 and (Users.userid = @userid";
            sql += " or TabPermission.roleid=-1 or @userid=1)) as perm";
            sql += " on perm.tabid=Tabs.tabid";
            sql += " where Tabs.isdeleted=0 and Tabs.IsVisible=1 and parentid=" + tabId + " order by taborder asc ";
            DataTable dt1 = Select(sql);


            if (dt1.Rows.Count <= 0)
            {

                ASPxMenu1.Items.Add(CreateItem(tabName, link, DotNetNuke.Common.Globals.ApplicationPath + "/images/Menu/" + image));

            }
            else
            {
                DevExpress.Web.ASPxMenu.MenuItem item = new DevExpress.Web.ASPxMenu.MenuItem();
                item.Text = tabName;
                item.Image.Url = DotNetNuke.Common.Globals.ApplicationPath + "/images/Menu/" + image;
                ASPxMenu1.Items.Add(item);
                //menu += "<ul class=\"level2 dropdown\">";
                for (int j = 0; j < dt1.Rows.Count; j++)
                {
                    int tabId1 = Convert.ToInt32(dt1.Rows[j]["TabID"]);
                    string sql1 = "declare @userid int ";
                    sql1 += "select @userid = " + this.UserId + "";
                    sql1 += " select Tabs.tabid, Tabs.title,Tabs.ParentId,Tabs.TabName,Tabs.taborder,Tabs.TabPath,Tabs.hinh_anh ";
                    sql1 += " from dnn_Tabs Tabs inner join (select distinct TabPermission.tabid";
                    sql1 += " from dnn_TabPermission TabPermission left outer join";
                    sql1 += " dnn_UserRoles UserRoles on TabPermission.roleid = UserRoles.roleid";
                    sql1 += " left outer join dnn_Users Users on Users.userid = UserRoles.userid";
                    sql1 += " where TabPermission.permissionid=3  and (Users.userid = @userid";
                    sql1 += " or TabPermission.roleid=-1 or @userid=1)) as perm";
                    sql1 += " on perm.tabid=Tabs.tabid where parentid=" + tabId1 + " order by taborder asc";

                    string tabName1 = Convert.ToString(dt1.Rows[j]["Title"]);
                    string image1 = dt.Rows[i]["hinh_anh"] + "";
                    string link1 = DotNetNuke.Common.Globals.ApplicationPath + Convert.ToString(dt1.Rows[j]["TabPath"]).Replace("//", "/") + "/tabid/" + tabId1 + "/Default.aspx";
                    DataTable dt2 = Select(sql1);
                    DevExpress.Web.ASPxMenu.MenuItem item1 = new DevExpress.Web.ASPxMenu.MenuItem();
                    item1.Text = tabName1;                    
                    if (dt2.Rows.Count <= 0)
                    {
                        item.Items.Add(item1);
                        item1.NavigateUrl = link1;
                    }
                    else
                    {
                        item.Items.Add(item1);
                        menu += "<ul class=\"level2 dropdown\">";
                        for (int l = 0; l < dt2.Rows.Count; l++)
                        {
                            int tabId2 = Convert.ToInt32(dt2.Rows[l]["TabID"]);
                            string sql3 = " select Tabs.tabid, Tabs.title,Tabs.ParentId,Tabs.TabName,Tabs.taborder,Tabs.TabPath,Tabs.hinh_anh ";
                            sql3 += " from dnn_Tabs Tabs inner join (select distinct TabPermission.tabid";
                            sql3 += " from dnn_TabPermission TabPermission left outer join";
                            sql3 += " dnn_UserRoles UserRoles on TabPermission.roleid = UserRoles.roleid";
                            sql3 += " left outer join dnn_Users Users on Users.userid = UserRoles.userid";
                            sql3 += " where TabPermission.permissionid=3 ) as perm";
                            sql3 += " on perm.tabid=Tabs.tabid where parentid=" + tabId1 + " order by taborder asc";
                            DataTable dt3 = Select(sql3);
                            if (dt3.Rows.Count > 0)
                            {
                                string tabName3 = Convert.ToString(dt3.Rows[l]["Title"]);
                                string link3 = DotNetNuke.Common.Globals.ApplicationPath + Convert.ToString(dt3.Rows[l]["TabPath"]).Replace("//", "/") + "/tabid/" + tabId2 + "/Default.aspx";
                                DevExpress.Web.ASPxMenu.MenuItem item2 = new DevExpress.Web.ASPxMenu.MenuItem();
                                item2.Text = tabName3;
                                item2.NavigateUrl = link3;
                                item1.Items.Add(item2);
                            }
                        }
                    }
                }
            }
        }

    }
    private DevExpress.Web.ASPxMenu.MenuItem CreateItem(string text, string link, string url_image)
    {
        DevExpress.Web.ASPxMenu.MenuItem item = new DevExpress.Web.ASPxMenu.MenuItem();
        item.Image.Url = url_image;
        item.Text = text;
        item.NavigateUrl = link;
        return item;
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            Menu();
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
    }
}
