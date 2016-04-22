using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using VNPT.Modules.Employees;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web.ASPxEditors;
using DotNetNuke.Entities.Modules;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxHiddenField;
using DevExpress.Web.ASPxUploadControl;

using VNPT.Modules.Unit;
using System.Threading;
using System.Globalization;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DevExpress.Web.ASPxSiteMapControl;

namespace DotNetNuke.Modules.DIEUCHUYENNV
{
    public partial class DIEUCHUYENNV: PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        public int IdEmp = 0;
        public decimal Unitid = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
            if (!IsPostBack)
            {
                DotNetNuke.Framework.jQuery.RequestRegistration();
                
                date_hieuluc.Date = DateTime.Now;

                if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined.undefined")
                {
                    string[] keys = Request.Params["IdNv"].Split('.');
                    IdEmp = Convert.ToInt32(keys[0]);
                    string ma_dv = keys[1];
                    LoadComBobox(Convert.ToDecimal(ma_dv));
                    LoadEmp(IdEmp, ma_dv);                
                }
            }
        }
      
        private void LoadComBobox(decimal ma_dv)
        {
            DataTable tb_biendong =SqlHelper.ExecuteDataset(strconn,"QLDVIEN_LOAIVIENDONG_GET",0,"",0).Tables[0];
            cmb_biendong.DataSource = tb_biendong;
            cmb_biendong.ValueField = "MA_BIENDONG";
            cmb_biendong.TextField = "TEN_BIENDONG";
            cmb_biendong.DataBind();
            cmb_biendong.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_biendong.SelectedIndex = 0;

            object ma_unit = SqlHelper.ExecuteScalar(strconn, "QLDVIEN_QUYEN_GET", UserInfo.Username);
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_loaihinhtochuc]", ma_unit,ma_dv).Tables[0];
            cmb_tochuc.DataSource = tb;
            cmb_tochuc.TextField = "TEN_TOCHUC";
            cmb_tochuc.ValueField = "MA_DV";
            cmb_tochuc.DataBind();
            cmb_tochuc.Items.Insert(0, new ListEditItem("-- Chọn --", "0"));
            cmb_tochuc.SelectedIndex = 0;
        }
       
        private void LoadEmp(int id,string ma_dv)
        {            
            var item_ToChuc = cmb_tochuc.Items.FindByValue(ma_dv);
            if (item_ToChuc != null)
                item_ToChuc.Selected = true;
        }
        protected void CallbackPanel_DieuChuyen_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (Request.Params["IdNv"] != null && Request.Params["IdNv"] != "undefined")
            {
                string[] keys = Request.Params["IdNv"].Split('.');

                IdEmp = Convert.ToInt32(keys[0]);                             
                Unitid = Convert.ToDecimal(keys[1]);

                string fileqd = "";
                if (Session["fileDieuDong"] != null)
                {
                    fileqd = Session["fileDieuDong"].ToString();
                    Session.Remove("fileDieuDong");
                }
                SqlHelper.ExecuteNonQuery(strconn, "QLDVIEN_LICHSU_BIENDONG_UI",
                    0, IdEmp, Unitid, cmb_tochuc.Value, cmb_biendong.Value, txt_lydo.Text, txtQuyetDinh.Text,
                    fileqd, date_hieuluc.Value, 0);
                CallbackPanel_DieuChuyen.JSProperties["cpResult"] = true;
            }
        }
        
        protected void uploadFileDinhKem_Load(object sender, FileUploadCompleteEventArgs e)
        {
            ASPxUploadControl upload = sender as ASPxUploadControl;
            if (!upload.FileName.ToString().Trim().Equals(""))
            {
                string filename = string.Format("{0:ddMMyyyyhhmmss_}{1}", DateTime.Now, upload.FileName);
                string fullFilePath = Server.MapPath(DotNetNuke.Common.Globals.ApplicationPath + "/images/fileQD/") + filename;
                (sender as ASPxUploadControl).SaveAs(fullFilePath);
                Session["fileDieuDong"] = filename;
            }
        }
        
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                Entities.Modules.Actions.ModuleActionCollection Actions = new Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }       
    }
}
