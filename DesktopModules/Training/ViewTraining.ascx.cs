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

namespace VNPT.Modules.Training
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewTraining class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewTraining : PortalModuleBase, IActionable
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

        TrainingController objTraining = new TrainingController();
        TrainingInfo training = new TrainingInfo();
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
                    if (objTraining.GetTrainings().Count > 0)
                    {
                        this.grdTraining.DataSource = objTraining.GetTrainings();
                        this.grdTraining.DataBind();
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
        protected void grdTraining_ItemDatabound(object sender, DataGridItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.training = e.Item.DataItem as TrainingInfo;
               
                HyperLink hplName = e.Item.FindControl("hplName") as HyperLink;
                if (hplName != null)
                {
                    hplName.Text = objEmplyess.GetEmployees(this.training.employeeid).fullname;
                    hplName.NavigateUrl = EditUrl("Id", this.training.id.ToString());
                }
                Label lblQualification = e.Item.FindControl("lblQualification") as Label;
                if (lblQualification != null)
                { 
                    VNPT.Modules.Qualification.QualificationController objQualification=new VNPT.Modules.Qualification.QualificationController();
                    lblQualification.Text = objQualification.GetQualification(this.training.qualificationid).name;
                }
                Label lblTrainingForm = e.Item.FindControl("lblTrainingForm") as Label;
                if (lblTrainingForm != null)
                {
                    VNPT.Modules.TrainingForm.TrainingFormController objForm = new VNPT.Modules.TrainingForm.TrainingFormController();
                    lblTrainingForm.Text = objForm.GetTrainingForm(this.training.trainingformid).name;
                }

            }

        }

        protected void grdTraining_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int id = Int32.Parse(e.CommandArgument.ToString());


            if (e.CommandName == "Delete")
            {

                this.training = objTraining.GetTraining(id);
                objTraining.DeleteTraining(training);
                this.grdTraining.DataSource = objTraining.GetTrainings();
                this.grdTraining.DataBind();
            }


        }
        protected void grdTraining_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {

            grdTraining.CurrentPageIndex = e.NewPageIndex;
            if (this.ddlEmployess.SelectedIndex > 0)
            {
                this.grdTraining.DataSource = objTraining.GetTrainingByEmployee(Int32.Parse(this.ddlEmployess.SelectedValue.Trim()));
                this.grdTraining.DataBind();
            }
            else
            {

                this.grdTraining.DataSource = objTraining.GetTrainings();
                this.grdTraining.DataBind();

            }
        }
        protected void ddlEmployess_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.ddlEmployess.SelectedIndex > 0)
            {
                this.grdTraining.DataSource = objTraining.GetTrainingByEmployee(Int32.Parse(this.ddlEmployess.SelectedValue.Trim()));
                this.grdTraining.DataBind();
            }
            else
            {

                this.grdTraining.DataSource = objTraining.GetTrainings();
                this.grdTraining.DataBind();

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

