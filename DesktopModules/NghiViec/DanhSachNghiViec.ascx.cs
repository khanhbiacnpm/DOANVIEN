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

using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using DevExpress.Web.ASPxGridView;

namespace DotNetNuke.Modules.NghiViec
{
    public partial class DanhSachNghiViec : PortalModuleBase, IActionable
    {       
        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
       protected void Page_Load(object sender, EventArgs e)
       {          
           if (!IsPostBack)
           {
               DotNetNuke.Framework.jQuery.RequestRegistration();
               BindUnit();               
           }
       }
       protected void gridDSNVNghiViec_CallBack(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
       {
           decimal unitid = Convert.ToDecimal(cmbDonVi.Value);
           DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetEmployeesNghiViecByUnitid]", unitid).Tables[0];
           
           gridDSNVNghiViec.DataSource = tb;
           gridDSNVNghiViec.DataBind();
       }
      
       protected void btXuatExcel_Click(object sender, EventArgs e)
       {
           decimal unitid = Convert.ToDecimal(cmbDonVi.Value);
        DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetEmployeesNghiViecByUnitid]", unitid).Tables[0];
               
        gridDSNVNghiViec.DataSource = tb;
        gridDSNVNghiViec.DataBind();
               
        expoter.GridViewID =gridDSNVNghiViec.UniqueID;
        expoter.WriteXlsToResponse();
        
          
       }       
       private void BindUnit()
       {
           //DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_Combo_DonVi]", 0);
           cmbDonVi.DataSource = SqlHelper.ExecuteDataset(strconn, "[sp_get_don_vi_hierachy_ds]", UserInfo.Username).Tables[0];
           cmbDonVi.TextField = "ten";
           cmbDonVi.ValueField = "id";
           cmbDonVi.DataBind();
           cmbDonVi.SelectedIndex = 0;
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
