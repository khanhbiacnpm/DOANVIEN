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

namespace VNPT.Modules.Employees
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewEmployees class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewEmployees : PortalModuleBase, IActionable
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

        EmployeesController objEmployees = new EmployeesController();
        EmployeesInfo employees = new EmployeesInfo();
        Unit.UnitController objUnit = new Unit.UnitController();

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    BindUnit();
                    if (objEmployees.GetEmployeess().Count > 0)
                    {
                        this.grdEmployees.DataSource = objEmployees.GetEmployeess();
                        this.grdEmployees.DataBind();
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
           
            VNPT.Modules.Employees.EmployeesInfo e = objEmployees.GetEmployeeByCode(this.UserInfo.Username);
            if (e != null)
            {
                if (UserInfo.IsInRole("ToChucVTT")) // vien thong tinh
                {
                    this.ddlParentUnit.Items.Clear();
                    List<VNPT.Modules.Unit.UnitInfo> list = objUnit.GetParentUnits();
                    foreach (VNPT.Modules.Unit.UnitInfo u in list)
                    {
                        this.ddlParentUnit.Items.Add(new ListItem(u.name, u.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(u.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                        {
                            this.ddlParentUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                            List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                            foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                            {
                                this.ddlParentUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                            }
                        }
                    }

                }
                else
                {
                    this.ddlParentUnit.Items.Clear();
                    this.ddlParentUnit.Items.Add(new ListItem(objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).name, objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).id.ToString()));


                    List<VNPT.Modules.Unit.UnitInfo> listChild = objUnit.GetChildUnits(objUnit.GetUnit(objUnit.GetUnit(e.unitid).parentid).id);
                    foreach (VNPT.Modules.Unit.UnitInfo u1 in listChild)
                    {
                        this.ddlParentUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;") + u1.name, u1.id.ToString()));
                        List<VNPT.Modules.Unit.UnitInfo> listNextChild = objUnit.GetChildUnits(u1.id);
                        foreach (VNPT.Modules.Unit.UnitInfo u2 in listNextChild)
                        {
                            this.ddlParentUnit.Items.Add(new ListItem(Server.HtmlDecode("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;") + u2.name, u2.id.ToString()));
                        }
                    }


                }
            }
           


        }

        protected void grdEmployees_ItemDatabound(object sender, DataGridItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                this.employees = e.Item.DataItem as EmployeesInfo;
                Unit.UnitController objUnit = new Unit.UnitController();
                ImageButton imgDelete = e.Item.FindControl("imgDelete") as ImageButton;
                Label lblPosition = e.Item.FindControl("lblPosition") as Label;
                Label lblParentUnit = e.Item.FindControl("lblParentUnit") as Label;
                Label lblCurrentUnit = e.Item.FindControl("lblCurrentUnit") as Label;

                if (imgDelete != null)
                {
                    imgDelete.Attributes.Add("onClick", "javascript:return confirm('Bạn có muốn xóa');");
                }
                //if (lblPosition != null)
                //{
                //    Position.PositionController objPosition = new Position.PositionController();
                //    lblPosition.Text = objPosition.GetPosition(this.employees.positionid).name;
                //}
                if (lblParentUnit != null)
                {
                    lblParentUnit.Text = objUnit.GetUnit(objUnit.GetUnit(this.employees.unitid).parentid).name;
                }
                if (lblCurrentUnit != null)
                {
                    lblCurrentUnit.Text = objUnit.GetUnit(this.employees.unitid).name;
                }
            }
        }

        protected void grdEmployees_ItemCommand(object source, DataGridCommandEventArgs e)
        {
            int id = Int32.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "Delete")
            {
                this.employees = objEmployees.GetEmployees(id);
                objEmployees.DeleteEmployees(employees);
                this.grdEmployees.DataSource = objEmployees.GetEmployeess();
                this.grdEmployees.DataBind();
            }
        }

        protected void grdEmployees_PageIndexChanged(object source, System.Web.UI.WebControls.DataGridPageChangedEventArgs e)
        {

            grdEmployees.CurrentPageIndex = e.NewPageIndex;
            if (this.ddlParentUnit.SelectedIndex > 0)
            {
                this.grdEmployees.DataSource = objEmployees.GetEmployeesByUnit(Int32.Parse(this.ddlParentUnit.SelectedValue.Trim()));
                this.grdEmployees.DataBind();
            }
            else
            {
                this.grdEmployees.DataSource = objEmployees.GetEmployeess();
                this.grdEmployees.DataBind();
            }
        }
        protected void ddlParentUnit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (this.ddlParentUnit.SelectedIndex > 0)
            {
                this.grdEmployees.DataSource = objEmployees.GetEmployeesByUnit(Int32.Parse(this.ddlParentUnit.SelectedValue.Trim()));
                this.grdEmployees.DataBind();
            }
            else
            {
                this.grdEmployees.DataSource = objEmployees.GetEmployeess();
                this.grdEmployees.DataBind();
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

