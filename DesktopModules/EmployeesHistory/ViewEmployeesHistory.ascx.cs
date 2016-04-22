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

namespace Philip.Modules.EmployeesHistory
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewEmployeesHistory class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewEmployeesHistory : PortalModuleBase, IActionable
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

        VNPT.Modules.EmployeesHistory.EmployeesHistoryInfo history = new VNPT.Modules.EmployeesHistory.EmployeesHistoryInfo();
        VNPT.Modules.EmployeesHistory.EmployeesHistoryController objHistory = new VNPT.Modules.EmployeesHistory.EmployeesHistoryController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Employees.EmployeesController objEmplyess = new VNPT.Modules.Employees.EmployeesController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    if (!IsPostBack)
                    {
                        BindUnit();
                        BindEmolyees();
                    }
                    if (objHistory.GetEmployeesHistorys().Count > 0)
                    {
                        this.grdArmy.DataSource = objHistory.GetEmployeesHistorys();
                        grdArmy.DataBind();

                    }
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }
            }
        }

        private void BindUnit()
        {
            //this.UserInfo.Username;
            VNPT.Modules.Employees.EmployeesInfo e = objEmplyess.GetEmployeeByCode(this.UserInfo.Username);
            if (e != null)
            {
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    this.ddlUnit.Items.Clear();
                    List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                    foreach (VNPT.Modules.Unit.UnitInfo u in list)
                    {
                        this.ddlUnit.Items.Add(new ListItem(u.name, u.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                        {
                            this.ddlUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                            foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                            {
                                this.ddlUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                            }
                        }
                    }

                }
                else
                {
                    this.ddlUnit.Items.Clear();
                    this.ddlUnit.Items.Add(new ListItem(objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).name, objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).id.ToString()));


                    List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).id);
                    foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                    {
                        this.ddlUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                        {
                            this.ddlUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                        }
                    }


                }
            }
           

        }
        private void BindEmolyees()
        {
            this.ddlEmployess.Items.Clear();
            this.ddlEmployess.Items.Add(new ListItem("Tất cả", "0"));
            List<VNPT.Modules.Employees.EmployeesInfo> list = objEmplyess.GetEmployeesByUnit(Int32.Parse(this.ddlUnit.SelectedValue.Trim()));
            foreach (VNPT.Modules.Employees.EmployeesInfo u in list)
            {
                this.ddlEmployess.Items.Add(new ListItem(u.fullname, u.id.ToString()));
            }

        }
        protected void grdArmy_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int id = Int32.Parse(e.CommandArgument.ToString());


            if (e.CommandName == "Delete")
            {
                this.history = objHistory.GetEmployeesHistory(id);
                objHistory.DeleteEmployeesHistory(this.history);
                this.grdArmy.DataSource = objHistory.GetEmployeesHistorys();
                grdArmy.DataBind();
            }


        }
        protected void grdArmy_ItemDatabound(object sender, DataGridItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.history = e.Item.DataItem as VNPT.Modules.EmployeesHistory.EmployeesHistoryInfo;
                Label lblOut = e.Item.FindControl("lblOut") as Label;
                if (lblOut != null)
                {
                    lblOut.Text = String.Format("{0:dd/MM/yyyy}", this.history.todate);
                }
                Label lblIn = e.Item.FindControl("lblIn") as Label;
                if (lblIn != null)
                {
                    lblIn.Text = String.Format("{0:dd/MM/yyyy}", this.history.fromdate);
                }

                ImageButton imgDelete = e.Item.FindControl("imgDelete") as ImageButton;
                if (imgDelete != null)
                {
                    imgDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa');");
                }
                Label lblEmployessName = e.Item.FindControl("lblEmployessName") as Label;
                if (lblEmployessName != null)
                {
                    lblEmployessName.Text = objEmplyess.GetEmployees(this.history.employeeid).fullname;
                }
                HyperLink hplName = e.Item.FindControl("hplName") as HyperLink;
                if (hplName != null)
                {
                    hplName.Text = objEmplyess.GetEmployees(this.history.employeeid).fullname; ;
                }
            }

        }
        protected void grdArmy_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {

            grdArmy.CurrentPageIndex = e.NewPageIndex;
            if (this.ddlEmployess.SelectedIndex > 0)
            {
                this.grdArmy.DataSource = objHistory.GetEmployeeHistoryByEmployess(Int32.Parse(this.ddlEmployess.SelectedValue.Trim()));
                this.grdArmy.DataBind();
            }
            else
            {

                this.grdArmy.DataSource = objHistory.GetEmployeesHistorys();
                this.grdArmy.DataBind();

            }
        }
        protected void ddlEmployess_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.ddlEmployess.SelectedIndex > 0)
            {
                this.grdArmy.DataSource = objHistory.GetEmployeeHistoryByEmployess(Int32.Parse(this.ddlEmployess.SelectedValue.Trim()));
                this.grdArmy.DataBind();
            }
            else
            {

                this.grdArmy.DataSource = objHistory.GetEmployeesHistorys();
                this.grdArmy.DataBind();

            }

        }
        protected void ddlUnit_SelectedIndexChanged(object sender, EventArgs e)
        {

            BindEmolyees();
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

