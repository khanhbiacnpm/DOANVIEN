﻿/*
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

namespace Philip.Modules.RewardDiscipline
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewRewardDiscipline class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewRewardDiscipline : PortalModuleBase, IActionable
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

        VNPT.Modules.RewardDiscipline.RewardDisciplineController objRewaard = new VNPT.Modules.RewardDiscipline.RewardDisciplineController();
        VNPT.Modules.RewardDiscipline.RewardDisciplineInfo reward = new VNPT.Modules.RewardDiscipline.RewardDisciplineInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindUnit();
                    BindEmolyees();
                    BindType();
                    BindObject();

                    if (objRewaard.GetRewardDisciplines().Count > 0)
                    {
                        this.grdReward.DataSource = objRewaard.GetRewardDisciplines();
                        this.grdReward.DataBind();
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
            VNPT.Modules.Employees.EmployeesInfo e = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
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
            this.ddlEmployee.Items.Clear();

            List<VNPT.Modules.Employees.EmployeesInfo> list = objEmployees.GetEmployeesByUnit(Int32.Parse(this.ddlUnit.SelectedValue.Trim()));
            foreach (VNPT.Modules.Employees.EmployeesInfo u in list)
            {
                this.ddlEmployee.Items.Add(new ListItem(u.fullname, u.id.ToString()));
            }

        }
        private void BindType()
        {
            this.ddlType.Items.Clear();
            this.ddlType.Items.Add(new ListItem("Khen thưởng", "1"));
            this.ddlType.Items.Add(new ListItem("Kỷ luật", "0"));
        }
        private void BindObject()
        {
            this.ddlObject.Items.Clear();
            this.ddlObject.Items.Add(new ListItem("Nhân viên", "1"));
            this.ddlObject.Items.Add(new ListItem("Đơn vị", "0"));
        }

        protected void grdReward_ItemDatabound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.reward = e.Item.DataItem as VNPT.Modules.RewardDiscipline.RewardDisciplineInfo;
                //Unit.UnitController objUnit = new Unit.UnitController();
                ImageButton imgDelete = e.Item.FindControl("imgDelete") as ImageButton;
                Label lblPosition = e.Item.FindControl("lblPosition") as Label;
                Label lblParentUnit = e.Item.FindControl("lblParentUnit") as Label;
                Label lblType = e.Item.FindControl("lblType") as Label;

                if (imgDelete != null)
                {
                    imgDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa');");
                }
                //if (lblPosition != null)
                //{
                //    Position.PositionController objPosition = new Position.PositionController();
                //    lblPosition.Text = objPosition.GetPosition(this.employees.positionid).name;
                //}
                if (lblType != null)
                {
                    if (this.reward.type == 0)
                    {
                        lblType.Text ="Kỷ luật";
                    }
                    if (this.reward.type == 1)
                    {
                        lblType.Text = "Khen thưởng";
                    }
                }
                HyperLink hplObject = e.Item.FindControl("hplObject") as HyperLink;
                if (hplObject != null)
                {
                    if (reward.objecttype == true)
                    {
                        hplObject.Text = objEmployees.GetEmployees(reward.objectid).fullname;
                    }
                }
            }
        }
        
        protected void grdReward_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int id = Int32.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Delete")
            {
                this.reward = objRewaard.GetRewardDiscipline(id);
                objRewaard.DeleteRewardDiscipline(reward);
                this.grdReward.DataSource = objRewaard.GetRewardDisciplines();
                this.grdReward.DataBind();
            }
        }

        protected void grdReward_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {

            grdReward.CurrentPageIndex = e.NewPageIndex;
            int type = 0;
            if (this.ddlType.SelectedIndex == 0)
            {
                type = 1;
            }
            if (this.ddlObject.SelectedIndex == 0)
            {
                this.grdReward.DataSource = objRewaard.GetRewardDisciplinesByObject(Int32.Parse(this.ddlEmployee.SelectedValue), Int32.Parse(this.ddlType.SelectedValue), type);
                this.grdReward.DataBind();
            }
            if (this.ddlObject.SelectedIndex == 1)
            {
                this.grdReward.DataSource = objRewaard.GetRewardDisciplinesByObject(Int32.Parse(this.ddlUnit.SelectedValue), Int32.Parse(this.ddlType.SelectedValue), type);
                this.grdReward.DataBind();
            }
        }
        protected void ddlObject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlObject.SelectedIndex == 0)
            {
                BindEmolyees();
                this.ddlEmployee.Visible = true;
            }
            if (this.ddlObject.SelectedIndex == 1)
            {
                this.ddlEmployee.Visible =false;
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

        protected void btView_Click(object sender, EventArgs e)
        {
            int type = 0;
            if (this.ddlObject.SelectedIndex == 0)
            {
                type = 1;
            }
            if (this.ddlObject.SelectedIndex == 0)
            {
                this.grdReward.DataSource = objRewaard.GetRewardDisciplinesByObject(Int32.Parse(this.ddlEmployee.SelectedValue), type, Int32.Parse(this.ddlType.SelectedValue));
                this.grdReward.DataBind();
            }
            if (this.ddlObject.SelectedIndex == 1)
            {
                this.grdReward.DataSource = objRewaard.GetRewardDisciplinesByObject(Int32.Parse(this.ddlUnit.SelectedValue), type, Int32.Parse(this.ddlType.SelectedValue));
                this.grdReward.DataBind();
            }
            
        }
}
}

