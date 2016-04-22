

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

namespace Philip.Modules.EmployeeContract
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewEmployeeContract class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewEmployeeContract : PortalModuleBase, IActionable
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
            if (!IsPostBack)
            {
                try
                {
                    if (!IsPostBack)
                    {
                        BindUnit();
                        BindEmolyees();
                    }
                    if (objContract.GetEmployeeContracts().Count > 0)
                    {
                        this.grdContract.DataSource = objContract.GetEmployeeContracts();
                        grdContract.DataBind();

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
                if (UserInfo.IsInRole("ToChucVTT"))
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

        protected void grdContract_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int id = Int32.Parse(e.CommandArgument.ToString());


            if (e.CommandName == "Delete")
            {
                this.contract =objContract.GetEmployeeContract(id);
                objContract.DeleteEmployeeContract(this.contract);
                grdContract.DataSource = objContract.GetEmployeeContracts();
                grdContract.DataBind();
            }
            
        }
        protected void grdContract_ItemDatabound(object sender, DataGridItemEventArgs e)
        {

            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.contract = e.Item.DataItem as VNPT.Modules.EmployeeContract.EmployeeContractInfo;
                Label lblStart = e.Item.FindControl("lblStart") as Label;
                if (lblStart != null)
                {
                    lblStart.Text = String.Format("{0:dd/MM/yyyy}", this.contract.datestart);
                }
                Label lblEnd = e.Item.FindControl("lblEnd") as Label;
                if (lblEnd != null)
                {
                    lblEnd.Text = String.Format("{0:dd/MM/yyyy}",this.contract.dateend);
                }

                ImageButton imgDelete = e.Item.FindControl("imgDelete") as ImageButton;
                if (imgDelete != null)
                {
                    imgDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa');");
                }
                //Label lblUnitName = e.Item.FindControl("lblUnitName") as Label;
                //if (lblUnitName != null)
                //{
                //    lblUnitName.Text =objUnit.GetUnit(this.contract.unitid).name;
                //}
                Label lblContractType = e.Item.FindControl("lblContractType") as Label;
                if (lblContractType != null)
                {
                    lblContractType.Text =objContracType.GetLaborContractType(this.contract.contracttype).name;
                }
                HyperLink hplName = e.Item.FindControl("hplName") as HyperLink;
                if (hplName != null)
                {
                    if (this.contract.employeeid != null)
                    {
                        VNPT.Modules.Employees.EmployeesInfo emp = objEmplyess.GetEmployees(Int32.Parse(this.contract.employeeid.ToString().Trim()));
                        if (emp != null)
                        {
                            hplName.Text = emp.fullname;
                        }
                    }
                }
                
            }

        }
        protected void grdContract_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {

            grdContract.CurrentPageIndex = e.NewPageIndex;
            if (this.ddlEmployess.SelectedIndex > 0)
            {
                this.grdContract.DataSource = objContract.GetContractsByEmployess(Int32.Parse(this.ddlEmployess.SelectedValue.Trim()));
                this.grdContract.DataBind();
            }
            else
            {

                this.grdContract.DataSource = objContract.GetEmployeeContracts();
                this.grdContract.DataBind();

            }
        }
        protected void ddlEmployess_SelectedIndexChanged(object sender, EventArgs e)
        {

            if (this.ddlEmployess.SelectedIndex > 0)
            {
                this.grdContract.DataSource = objContract.GetContractsByEmployess(Int32.Parse(this.ddlEmployess.SelectedValue.Trim()));
                this.grdContract.DataBind();
            }
            else
            {

                this.grdContract.DataSource = objContract.GetEmployeeContracts();
                this.grdContract.DataBind();

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

