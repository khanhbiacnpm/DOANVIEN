using System;
using System.Web;
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
using VNPT.Modules;
using DevExpress.Web.ASPxEditors;

namespace VNPT.Modules.Employees
{    
    partial class DSNhanVien : PortalModuleBase, IActionable
    {        
        EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.LaborContractType.LaborContractTypeController objHopDong = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            //gridThanhVien.DataSource = objEmployees.GetEmployeesEmpcode();
            //gridThanhVien.DataBind();
        }
        
        int nSTT = 1;
        protected void gridThanhVien_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "id")
            {
                ASPxLabel lbl_STT = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STT") as ASPxLabel;
                lbl_STT.Text = nSTT++.ToString();
            }
            if (e.DataColumn.FieldName == "unitid")
            {
                ASPxLabel lbl_DonVi = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_DonVi") as ASPxLabel;
                if (objUnit.GetUnit(Convert.ToInt32(e.CellValue)).parentid == 14)
                {
                    lbl_DonVi.Text = objUnit.GetUnit(Convert.ToInt32(e.CellValue)).name;
                }
                else
                {
                    lbl_DonVi.Text = objUnit.GetUnit(objUnit.GetUnit(Convert.ToInt32(e.CellValue)).parentid).name + " - " + objUnit.GetUnit(Convert.ToInt32(e.CellValue)).name;
                }
            }
            if (e.DataColumn.FieldName == "idLoaiHopDong")
            {
                ASPxLabel lbl_LoaiHopDong = gridThanhVien.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_LoaiHopDong") as ASPxLabel;
                lbl_LoaiHopDong.Text = objHopDong.GetLaborContractType(Convert.ToInt32(e.CellValue)).name.ToString();
            }
        }
        protected void gridThanhVien_htmlRowCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.backgroundColor='pink';");
            e.Row.Attributes.Add("onmouseout", "this.style.backgroundColor='white';");
        }
        protected void btnPdfExport_Click(object sender, EventArgs e)
        {
            //gridExport.WritePdfToResponse();
        }

        public ModuleActionCollection ModuleActions
        {
            get
            {
                ModuleActionCollection Actions = new ModuleActionCollection();
                Actions.Add(this.GetNextActionID(), Localization.GetString(ModuleActionType.AddContent, this.LocalResourceFile), ModuleActionType.AddContent, "", "", this.EditUrl(), false, SecurityAccessLevel.Edit, true, false);
                return Actions;
            }
        }
        
}
}
