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
using DotNetNuke.Services.Exceptions;
using DotNetNuke.Services.Localization;
using DevExpress.Web;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxUploadControl;
using DevExpress.Web.ASPxGridView;
using VNPT.Modules.Employees;
using DevExpress.Web.ASPxHiddenField;
using System.IO;
using System.Threading;
using System.Globalization;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace VNPT.Modules.ThongTinNhanVien
{
    partial class HopDong : PortalModuleBase, IActionable    
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.LaborContractType.LaborContractTypeController objContracType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        VNPT.Modules.EmployeeContract.EmployeeContractInfo contract = new VNPT.Modules.EmployeeContract.EmployeeContractInfo();
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();
        SqlConnection conn = null;
        VNPT.Modules.SalaryType.SalaryTypeController objSalaryType = new VNPT.Modules.SalaryType.SalaryTypeController();
        private int idNV = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Thread.CurrentThread.CurrentCulture = new CultureInfo("vi-VN");
            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!this.IsPostBack)
            {
                BindGridContract(idNV);
            }
        }
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
        private int NgayKetThuc(int loaihd)
        {
             if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            string sql = "select [dbo].[funcNgayKetThucHopDong](" + loaihd + ","  + idNV +")";//'8/8/2013',13,1,'8/8/1983')";
            string strConn = getConnectionString();

            object obj=SqlHelper.ExecuteScalar(strConn, CommandType.Text, sql);
            return Convert.ToInt32(obj);

       
        }
        #region Contract
        protected void callback_DenNgay_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            DevExpress.Web.ASPxCallbackPanel.ASPxCallbackPanel callback = sender as DevExpress.Web.ASPxCallbackPanel.ASPxCallbackPanel;
            ASPxDateEdit calContractDateEnd = callback.FindControl("calContractDateEnd") as ASPxDateEdit;            
            ASPxHiddenField hf_LoaiHopDong = callback.FindControl("hf_LoaiHopDong") as ASPxHiddenField;
            HiddenField hiddenNgayKetThuc = callback.FindControl("hiddenNgayKetThuc") as HiddenField;
          
            int idLoaiHopDong = hf_LoaiHopDong.Count > 0 ? Convert.ToInt32(hf_LoaiHopDong.Get("idLoaiHD")) : 0;            
            DateTime calDateStart = Convert.ToDateTime(e.Parameter);
            try
            {
                
                int thang = NgayKetThuc(idLoaiHopDong);
                hiddenNgayKetThuc.Value = Convert.ToDateTime(e.Parameter.ToString()).AddMonths(thang).ToString();
                calContractDateEnd.Date = Convert.ToDateTime(e.Parameter.ToString()).AddMonths(thang);
                callback.JSProperties["cpdateend"] = Convert.ToDateTime(e.Parameter.ToString()).AddMonths(thang).ToString();
            }
            catch { }
        }
        protected void grdContract_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox txtContractNum = grdContract.FindEditFormTemplateControl("txtContractNum") as ASPxTextBox;


            ASPxTextBox txtRepresent = grdContract.FindEditFormTemplateControl("txtRepresent") as ASPxTextBox;
            ASPxTextBox txtRepresentAdd = grdContract.FindEditFormTemplateControl("txtRepresentAdd") as ASPxTextBox;
            ASPxTextBox txtRepresentPhone = grdContract.FindEditFormTemplateControl("txtRepresentPhone") as ASPxTextBox;
            ASPxTextBox txtRepresentUnit = grdContract.FindEditFormTemplateControl("txtRepresentUnit") as ASPxTextBox;

            ASPxDateEdit calDateStart = grdContract.FindEditFormTemplateControl("calDateStart") as ASPxDateEdit;
            ASPxDateEdit calContractDateEnd = grdContract.FindEditFormTemplateControl("callback_DenNgay").FindControl("calContractDateEnd") as ASPxDateEdit;
            ASPxComboBox ddlContractType = grdContract.FindEditFormTemplateControl("ddlContractType") as ASPxComboBox;
            //HiddenField hiddenNgayKetThuc = grdContract.FindEditFormTemplateControl("callback_DenNgay").FindControl("hiddenNgayKetThuc") as HiddenField;


            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_EmployeeContract", e.Keys["id"], idNV, txtContractNum.Text, txtRepresent.Text, txtRepresentUnit.Text,
                    txtRepresentPhone.Text, txtRepresentAdd.Text, calDateStart.Value,calContractDateEnd.Value,  Int32.Parse(ddlContractType.Value.ToString()), 1);
            }
            

            grdContract.CancelEdit();
            e.Cancel = true;

            BindGridContract(idNV);
        }
        protected void grdContract_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            
            
            ASPxTextBox txtContractNum = grdContract.FindEditFormTemplateControl("txtContractNum") as ASPxTextBox;
            
            
            ASPxTextBox txtRepresent = grdContract.FindEditFormTemplateControl("txtRepresent") as ASPxTextBox;
            ASPxTextBox txtRepresentAdd = grdContract.FindEditFormTemplateControl("txtRepresentAdd") as ASPxTextBox;
            ASPxTextBox txtRepresentPhone = grdContract.FindEditFormTemplateControl("txtRepresentPhone") as ASPxTextBox;
            ASPxTextBox txtRepresentUnit = grdContract.FindEditFormTemplateControl("txtRepresentUnit") as ASPxTextBox;

            ASPxDateEdit calDateStart = grdContract.FindEditFormTemplateControl("calDateStart") as ASPxDateEdit;
            ASPxDateEdit calContractDateEnd = grdContract.FindEditFormTemplateControl("callback_DenNgay").FindControl("calContractDateEnd") as ASPxDateEdit;
            ASPxComboBox ddlContractType = grdContract.FindEditFormTemplateControl("ddlContractType") as ASPxComboBox;
            HiddenField hiddenNgayKetThuc = grdContract.FindEditFormTemplateControl("callback_DenNgay").FindControl("hiddenNgayKetThuc") as HiddenField;
            
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_EmployeeContract", -1, idNV, txtContractNum.Text, txtRepresent.Text, txtRepresentUnit.Text,
                    txtRepresentPhone.Text, txtRepresentAdd.Text,calDateStart.Value,calContractDateEnd.Value, Int32.Parse(ddlContractType.Value.ToString()), 0);
            }

            grdContract.CancelEdit();
            e.Cancel = true;
            BindGridContract(idNV);
        }
       
       
        protected void grdContract_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

            
            if (idNV > 0)
            {
                int n = SqlHelper.ExecuteNonQuery(strconn, "HRM_EmployeeContract", e.Keys["id"], idNV, "", "","",
                    "", "", "1/1/1900", "1/1/1900", 0, 2);
            }

            grdContract.CancelEdit();
            e.Cancel = true;
            BindGridContract(idNV);

        }
        private void BindGridContract(int ItemId)
        {
            if (ItemId != 0)
            {
                
                this.grdContract.DataSource = objContract.GetContractsByEmployess(ItemId).OrderByDescending(d => d.dateend);
                this.grdContract.DataBind();
            }

        }
        protected void ddlContractType_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox ddlContractType = grdContract.FindEditFormTemplateControl("ddlContractType") as ASPxComboBox;
            if (ddlContractType != null)
            {
                ddlContractType.Items.Clear();
                List<VNPT.Modules.LaborContractType.LaborContractTypeInfo> list = objContracType.GetLaborContractTypes();
                foreach (VNPT.Modules.LaborContractType.LaborContractTypeInfo l in list)
                {
                    ddlContractType.Items.Add(new ListEditItem(l.name, l.id.ToString()));
                }


                if (GetContractText("contracttype") != null && GetContractText("contracttype").Trim() != "")
                {
                    ListEditItem item = ddlContractType.Items.FindByValue((object)GetContractText("contracttype"));
                    if (item != null)
                    {
                        item.Selected = true;
                    }
                }
                else { ddlContractType.SelectedIndex = 0; }
            }
        }

        protected void txtContractEmpId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("employeeid") != null && GetContractText("employeeid").Trim() != "")
            {
                txt.Text = GetContractText("employeeid");
            }
        }
        protected void txtContractId_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("id") != null && GetContractText("id").Trim() != "")
            {
                txt.Text = GetContractText("id");
            }
        }

        protected void txtRepresent_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("represent") != null && GetContractText("represent").Trim() != "")
            {
                txt.Text = GetContractText("represent");
            }
        }

        protected void txtContractNum_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("contractnum") != null && GetContractText("contractnum").Trim() != "")
            {
                txt.Text = GetContractText("contractnum");
            }
        }
       
        protected void txtRepresentUnit_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("representunit") != null && GetContractText("representunit").Trim() != "")
            {
                txt.Text = GetContractText("representunit");
            }
        }
        protected void txtRepresentAdd_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("representaddress") != null && GetContractText("representaddress").Trim() != "")
            {
                txt.Text = GetContractText("representaddress");
            }
        }
        protected void txtRepresentPhone_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetContractText("representphone") != null && GetContractText("representphone").Trim() != "")
            {
                txt.Text = GetContractText("representphone");
            }
        }

        protected void calDateStart_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetContractText("datestart") != null && GetContractText("datestart").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetContractText("datestart"));
            }
            else
            {
                txt.Value = DateTime.Now;
            }
        }
        protected void calContractDateEnd_Load(object sender, System.EventArgs e)
        {
            ASPxDateEdit txt = sender as ASPxDateEdit;
            if (GetContractText("dateend") != null && GetContractText("dateend").Trim() != "")
            {
                txt.Value = Convert.ToDateTime(GetContractText("dateend"));                
            }
            else
            {
                txt.Value = DateTime.Now;
            }
        }

        private string GetContractText(string fieldName)
        {
            int index = grdContract.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grdContract.GetRowValues(index, fieldName).ToString();
            }
            return values;
        }
        #endregion
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
