/*
' DotNetNuke® - http://www.dotnetnuke.com
' Copyright (c) 2002-2006
' by Perpetual Motion Interactive Systems Inc. ( http://www.perpetualmotion.ca )
'
' Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated 
' documentation files (the "Software"), to deal in the Software without restriction, including without limitation 
' the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and 
' to permit persons to whom the Software is furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all copies or substantial portions 
' of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED 
' TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL 
' THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF 
' CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER 
' DEALINGS IN THE SOFTWARE.
 */

using System;
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

namespace Philip.Modules.ContractExpried
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewContractExpried class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewContractExpried : PortalModuleBase, IActionable
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
        VNPT.Modules.EmployeeContract.EmployeeContractInfo contract = new VNPT.Modules.EmployeeContract.EmployeeContractInfo();
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmplyess = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.LaborContractType.LaborContractTypeController objContracType = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {
                    this.grdExpried.DataSource = objContract.GetContractExpried();
                    this.grdExpried.DataBind();
                }
            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

        }

        protected void grdExpried_ItemDatabound(object sender, DataGridItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.contract = e.Item.DataItem as VNPT.Modules.EmployeeContract.EmployeeContractInfo;
                Label lblStartDate = e.Item.FindControl("lblStartDate") as Label;
                if (lblStartDate != null)
                {
                    lblStartDate.Text = String.Format("{0:dd/MM/yyyy}", this.contract.datestart);
                }
                Label lblEndDate = e.Item.FindControl("lblEndDate") as Label;
                if (lblEndDate != null)
                {
                    lblEndDate.Text = String.Format("{0:dd/MM/yyyy}", this.contract.dateend);
                }

                Label lblContractType = e.Item.FindControl("lblContractType") as Label;
                if (lblContractType != null)
                {
                    lblContractType.Text = objContracType.GetLaborContractType(this.contract.contracttype).name;
                }
                Label lblUnit = e.Item.FindControl("lblUnit") as Label;
                if (lblUnit != null)
                {
                    lblUnit.Text = objUnit.GetUnit(objEmplyess.GetEmployees(this.contract.employeeid).unitid).name;
                }
                HyperLink hplName = e.Item.FindControl("hplName") as HyperLink;
                if (hplName != null)
                {
                    hplName.Text = objEmplyess.GetEmployees(this.contract.employeeid).fullname;
                    hplName.NavigateUrl = String.Format(DotNetNuke.Common.Globals.ApplicationPath + "nhanvien/kyhopdong/tabid/154/Default.aspx?Id={0}", this.contract.employeeid);
                }                                              
            }
        }
        protected void grdExpried_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {

            grdExpried.CurrentPageIndex = e.NewPageIndex;
            this.grdExpried.DataSource = objContract.GetContractExpried();
            this.grdExpried.DataBind();
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

