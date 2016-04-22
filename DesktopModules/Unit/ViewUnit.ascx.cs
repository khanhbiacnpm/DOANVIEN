using System;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Configuration;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;

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
using DevExpress.Web.ASPxNavBar;
using DevExpress.Web.ASPxHtmlEditor;
using DotNetNuke.UI.Utilities;
using VNPT.Modules.Employees;
using VNPT.Modules;
using Microsoft.ApplicationBlocks.Data;

namespace VNPT.Modules.Unit
{    
    partial class ViewUnit : PortalModuleBase, IActionable
    {       
        #region Event Handlers
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        UnitController objUnit = new UnitController();
        UnitInfo unit = new UnitInfo();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            DotNetNuke.Framework.jQuery.RequestRegistration();
            if (!this.IsPostBack)
            {                
                establishdate.Date = DateTime.Now;
                treelist_donvi.ExpandToLevel(1);
                hienthi_donvi();
            }
        }
        void hienthi_donvi(){
            ddlParentUnit.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0]; //SqlHelper.ExecuteDataset(strconn, "sp_get_don_vi_hierachy", 14).Tables[0];
            ddlParentUnit.ValueField = "id";
            ddlParentUnit.TextField = "ten";
            ddlParentUnit.DataBind();
        }        
        protected void treeList_VirtualModeCreateChildren(object sender, TreeListVirtualModeCreateChildrenEventArgs e)
        {
            decimal ma_unit = Convert.ToDecimal(SqlHelper.ExecuteScalar(strconn, "QLDV_DONVI_USERNAME"));
            if (e.NodeObject == null)
            {
                DataTable tb_dstt = SqlHelper.ExecuteDataset(strconn, "sp_get_donvi", ma_unit, 0).Tables[0];
                e.Children = new DataView(tb_dstt);
            }
            else
            {
                decimal id_cha = Convert.ToDecimal(((DataRowView)e.NodeObject)["id"]);
                DataTable tb_dstt = SqlHelper.ExecuteDataset(strconn, "sp_get_donvi", id_cha, 1).Tables[0];
                e.Children = new DataView(tb_dstt);
            }           
        }
        protected void ddlParentUnit_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            hienthi_donvi();
        }
        protected void treeList_VirtualModeNodeCreating(object sender, TreeListVirtualModeNodeCreatingEventArgs e)
        {
            var node = (DataRowView)e.NodeObject;
            e.IsLeaf = !(bool)node["HasChild"];
            e.NodeKeyValue = node["id"];
            e.SetNodeValue("ten_donvi", node["ten_donvi"]);
            e.SetNodeValue("viet_tat", node["viet_tat"]);
            e.SetNodeValue("ngay_lap", node["ngay_lap"]);
            e.SetNodeValue("so_qd_lap", node["so_qd_lap"]);
            e.SetNodeValue("chuc_nang", node["chuc_nang"]);
            e.SetNodeValue("ngay_huy", node["ngay_huy"]);
            e.SetNodeValue("so_qd_huy", node["so_qd_huy"]);
            e.SetNodeValue("dia_chi", node["dia_chi"]);
            e.SetNodeValue("dien_thoai", node["dien_thoai"]);
            e.SetNodeValue("so_thue", node["so_thue"]);
            e.SetNodeValue("thu_tu", node["thu_tu"]);                        
            e.SetNodeValue("dinh_bien", node["dinh_bien"]);
            e.SetNodeValue("loai_dv", node["loai_dv"]);
            e.SetNodeValue("id_cha", node["id_cha"]);
        }
        protected void treelist_donvi_OnCustomCallback(object sender, TreeListCustomCallbackEventArgs e)
        {
            ASPxTreeList tree = sender as ASPxTreeList;
            tree.RefreshVirtualTree();           
            TreeListNode node = tree.FindNodeByKeyValue(e.Argument);
            while (node.ParentNode != null)
            {
                node.Expanded = true;
                node = node.ParentNode;
            }
        }        
        protected void luuthongtin_OnCallback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            string[] keys = e.Parameter.Split(';');
            string dieukien = keys[0];
            if (dieukien == "them")
            {
                int thutu = 0, dinhbien = 0;
                Object id_cha = hdf_key.Get("id_cha");
                Object tendonvi = hdf_key.Get("tendonvi");
                Object viettat = hdf_key.Get("viettat");
                Object qd_thanhlap = hdf_key.Get("qdthanhlap");
                DateTime ngaylap = Convert.ToDateTime(hdf_key.Get("ngaythanhlap"));
                Object chucnang = hdf_key.Get("chucnang");
                DateTime ngayhuy = Convert.ToDateTime(hdf_key.Get("ngayhuy") == null ? "01/01/1900" : hdf_key.Get("ngayhuy"));
                Object qd_huy = hdf_key.Get("qdhuy");
                Object diachi = hdf_key.Get("diachi");
                Object dienthoai = hdf_key.Get("dienthoai");
                Object sothue = hdf_key.Get("sothue");
                Object loai_donvi = hdf_key.Get("loaidv");

                int.TryParse(hdf_key.Get("thutu").ToString(), out thutu);
                int.TryParse(hdf_key.Get("dinhbien").ToString(), out dinhbien);

                SqlHelper.ExecuteNonQuery(strconn, "HRM_Unit", 0,
                         tendonvi, DateTime.Now, qd_thanhlap, ngaylap, chucnang,
                         ngayhuy, DateTime.Now, qd_huy, "", id_cha, diachi, dienthoai, sothue, thutu, 1, 0, viettat, dinhbien, loai_donvi, 0);
                callback_luuthongtin.JSProperties["cpOp"] = 0;
            }
            else if (dieukien == "sua")
            {
                int thutu = 0, dinhbien = 0;
                Object id_cha = hdf_key.Get("id_cha");
                Object iddonvi = hdf_key.Get("iddonvi");
                Object tendonvi = hdf_key.Get("tendonvi");
                Object viettat = hdf_key.Get("viettat");
                Object qd_thanhlap = hdf_key.Get("qdthanhlap");
                DateTime ngaylap = Convert.ToDateTime(hdf_key.Get("ngaythanhlap"));
                Object chucnang = hdf_key.Get("chucnang");
                DateTime ngayhuy = Convert.ToDateTime(hdf_key.Get("ngayhuy") == null ? "01/01/1900" : hdf_key.Get("ngayhuy"));
                Object qd_huy = hdf_key.Get("qdhuy");
                Object diachi = hdf_key.Get("diachi");
                Object dienthoai = hdf_key.Get("dienthoai");
                Object sothue = hdf_key.Get("sothue");
                Object loai_donvi = hdf_key.Get("loaidv");

                int.TryParse(hdf_key.Get("thutu").ToString(), out thutu);
                int.TryParse(hdf_key.Get("dinhbien").ToString(), out dinhbien);

                SqlHelper.ExecuteNonQuery(strconn, "HRM_Unit", iddonvi,
                         tendonvi, DateTime.Now, qd_thanhlap, ngaylap, chucnang,
                         ngayhuy, DateTime.Now, qd_huy, "", id_cha, diachi, dienthoai, sothue, thutu, 1, 0, viettat, dinhbien, loai_donvi, 1);

                callback_luuthongtin.JSProperties["cpOp"] = 1;
            }
            else if (dieukien == "xoa")
            {
                object iddonvi = keys[1];
                SqlHelper.ExecuteNonQuery(strconn, "sp_Unit_delete", iddonvi);
                callback_luuthongtin.JSProperties["cpOp"] = 2;
            }
        }

        #endregion

        #region Optional Interfaces

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Registers the module actions required for interfacing with the portal framework
        /// </summary>
        /// <value></value>
        /// <returns></returns>
        /// <remarks></remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }

        #endregion
    }
}

