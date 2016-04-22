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

namespace Philip.Modules.Leave
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewLeave class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ListLeave : PortalModuleBase, IActionable
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

        VNPT.Modules.Leave.LeaveController objLeave = new VNPT.Modules.Leave.LeaveController();
        VNPT.Modules.Leave.LeaveInfo leave = new VNPT.Modules.Leave.LeaveInfo();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmplyess = new VNPT.Modules.Employees.EmployeesController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {

                    this.lblMonth.Text = "DANH SÁCH NGHỈ PHÉP THÁNG " + DateTime.Now.Month.ToString();
                    if (objLeave.GetLeaves().Count > 0)
                    {
                        this.grdLeave.DataSource = objLeave.GetLeaveByTime(DateTime.Now.Month,DateTime.Now.Year);
                        this.grdLeave.DataBind();
                    }
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }
            }
        }

       
        protected void grdLeave_ItemDatabound(object sender, DataGridItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.leave = e.Item.DataItem as VNPT.Modules.Leave.LeaveInfo;
                ImageButton imgDelete = e.Item.FindControl("imgDelete") as ImageButton;
                if (imgDelete != null)
                {
                    imgDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa');");
                }
                HyperLink hplName = e.Item.FindControl("hplName") as HyperLink;
                if (hplName != null)
                {
                    hplName.Text = objEmplyess.GetEmployees(this.leave.employeeid).fullname;
                    hplName.NavigateUrl = EditUrl("Id", this.leave.id.ToString());
                }
                Label lblPlace = e.Item.FindControl("lblPlace") as Label;
                if (lblPlace != null)
                {
                    lblPlace.Text = objProvince.GetProvince(this.leave.provinceid).Name;
                }
                Label lblFromDate = e.Item.FindControl("lblFromDate") as Label;
                if (lblFromDate != null)
                {
                    lblFromDate.Text = String.Format("{0:dd/MM/yyyy}", this.leave.fromdate);
                }
                Label lblToDate = e.Item.FindControl("lblToDate") as Label;
                if (lblToDate != null)
                {
                    lblToDate.Text = String.Format("{0:dd/MM/yyyy}", this.leave.todate);
                }
                Label lblUnit = e.Item.FindControl("lblUnit") as Label;
                if (lblUnit != null)
                {
                    lblUnit.Text = objUnit.GetUnit(this.leave.unitid).name + " - " + objUnit.GetUnit(objUnit.GetUnit(this.leave.unitid).parentid).name;
                }
                

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

