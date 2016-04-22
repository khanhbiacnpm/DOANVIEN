using System;
using System.Web;
using System.Linq;
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
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class TTKhac : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!IsPostBack)
             
                load_data();
           
        }
        protected void callbackTT_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            if (Request.Params["idNV"] != "null" && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);


            SaveTieuChuan(lstKyNang, idNV, "[HRM_MTCV_KyNang_NhanVien]");
            SaveTieuChuan(listTrinhDoKhac, idNV, "[HRM_MTCV_TrinhDoKhac_NhanVien]");
            
            int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_ThongTinKhac_UI", idNV, txt_sotruong.Text,
                    txt_dinuocngoai.Text, txt_kinhtebanthan.Text, txt_giadinh.Text,"");
            callbackTT.JSProperties["cpresult"] = n;
        }
       
        private void BindTieuChuan(DataTable tb, ASPxListBox lst, string column)
        {
            if (tb.Rows.Count > 0)
            {
                for (int i = 0; i < tb.Rows.Count; i++)
                {
                    foreach (ListEditItem item in lst.Items)
                    {
                        if (tb.Rows[i][column].ToString().Trim() == item.Value.ToString().Trim())
                        {
                            item.Selected = true;
                        }
                    }
                }
            }
        }
        private void SaveTieuChuan(ASPxListBox lst, int idnhanvien, string proc)
        {

            int l = SqlHelper.ExecuteNonQuery(strconn, proc, 0, idnhanvien, 0, 2);
            foreach (ListEditItem sItem in lst.SelectedItems)
            {

                int id = Convert.ToInt32(sItem.Value.ToString());
                int n = SqlHelper.ExecuteNonQuery(strconn, proc, 0, idnhanvien, id, 0);
            }


        }
        private void load_data()
        {
            if (idNV != 0)
            {
                DataTable tb = SqlHelper.ExecuteDataset(strconn, "HRM_Get_ThongTinKhac_U", idNV).Tables[0];
                
                if (tb.Rows.Count > 0)
                {
                    txt_sotruong.Text = tb.Rows[0]["sotruong"].ToString();                    
                    txt_dinuocngoai.Text = tb.Rows[0]["dinuocngoai"].ToString();
                    txt_kinhtebanthan.Text = tb.Rows[0]["kinhtebanthan"].ToString();
                    txt_giadinh.Text = tb.Rows[0]["giadinh"].ToString();
                    
                }
                DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_MTCV_ChucDanh_Combo]", tb.Rows[0]["idCDanh_B"].ToString(), idNV);

                lstKyNang.DataSource = ds.Tables[3];
                lstKyNang.DataBind();


                listTrinhDoKhac.DataSource = ds.Tables[4];
                listTrinhDoKhac.DataBind();
                DataTable tblKyNang = SqlHelper.ExecuteDataset(strconn, "[HRM_GetMoTaCongViec]", idNV).Tables[3];
                DataTable tblTrinhDoKhac = SqlHelper.ExecuteDataset(strconn, "[HRM_GetMoTaCongViec]", idNV).Tables[4];
                BindTieuChuan(tblKyNang, lstKyNang, "IdKyNang");
                BindTieuChuan(tblTrinhDoKhac, listTrinhDoKhac, "IdTrinhDo");


             
            }
        }       
        #region Optional Interfaces
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
