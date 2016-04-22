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
using System.Web;
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
using DevExpress.Web.ASPxGridView;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Data;

namespace VNPT.Modules.DanhMuc
{    
    partial class NhomChucDanh : PortalModuleBase, IActionable
    {
        private string strconn = ConfigurationManager.ConnectionStrings["HRM"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            
                try
                {

                    LoadNhomChucDanh();

                    
                }
                catch (Exception ex)
                {
                    Exceptions.ProcessModuleLoadException(this, ex);
                }
           

        }
        private void LoadNhomChucDanh()
        {
            DataTable tb = SqlHelper.ExecuteDataset(strconn, "[HRM_GetNhomChucDanh]", 0).Tables[0];

            grid.DataSource = tb;
            grid.DataBind();
        }
        protected void cmbDoiTuong_Load(object sender, System.EventArgs e)
        {
            ASPxComboBox txt = sender as ASPxComboBox;
             txt.Items.Add(new ListEditItem("Lãnh đạo, Quản lý", "1"));
             txt.Items.Add(new ListEditItem("Trực tiếp sản xuất", "2"));

             if (GetText("LoaiLaoDong") != null && GetText("LoaiLaoDong").Trim() != "")
            {
                ListEditItem item = txt.Items.FindByValue(GetText("LoaiLaoDong").Trim());
                if (item != null)
                {
                    item.Selected = true;
                }
                else
                {
                    txt.SelectedIndex = 0;
                }
            }
            else
            {
                txt.SelectedIndex = 0;
            }
        }
        protected void grid_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtMaNhom = grid.FindEditFormTemplateControl("txtMaNhom") as ASPxTextBox;
            ASPxComboBox cmbDoiTuong = grid.FindEditFormTemplateControl("cmbDoiTuong") as ASPxComboBox;
            ASPxSpinEdit txtThuTu = grid.FindEditFormTemplateControl("txtThuTu") as ASPxSpinEdit;

            int n = SqlHelper.ExecuteNonQuery(strconn, "SP_HRM_NhomChucDanh", Int32.Parse(e.Keys[grid.KeyFieldName].ToString()), text.Text, txtMaNhom.Text, Int32.Parse(cmbDoiTuong.SelectedItem.Value.ToString()), Int32.Parse(txtThuTu.Text), 1);
            
            grid.CancelEdit();
            e.Cancel = true;
            LoadNhomChucDanh();


        }
        protected void grid_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            ASPxTextBox text = grid.FindEditFormTemplateControl("txtName") as ASPxTextBox;
            ASPxTextBox txtMaNhom = grid.FindEditFormTemplateControl("txtMaNhom") as ASPxTextBox;
            ASPxSpinEdit txtThuTu = grid.FindEditFormTemplateControl("txtThuTu") as ASPxSpinEdit;
            ASPxComboBox cmbDoiTuong = grid.FindEditFormTemplateControl("cmbDoiTuong") as ASPxComboBox;

            int n = SqlHelper.ExecuteNonQuery(strconn, "SP_HRM_NhomChucDanh", 0, text.Text, txtMaNhom.Text, Int32.Parse(cmbDoiTuong.SelectedItem.Value.ToString()), Int32.Parse(txtThuTu.Text), 0);


            grid.CancelEdit();
            e.Cancel = true;
            LoadNhomChucDanh();

        }
        protected void grid_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int id = Int32.Parse(e.Keys[grid.KeyFieldName].ToString());
            int n = SqlHelper.ExecuteNonQuery(strconn, "SP_HRM_NhomChucDanh", id, "", "", 0, 0, 2);

            grid.CancelEdit();
            e.Cancel = true;
            LoadNhomChucDanh();
        }
        protected void txtThuTu_Load(object sender, System.EventArgs e)
        {
            ASPxSpinEdit txt = sender as ASPxSpinEdit;
            if (GetText("ThuTu") != null && GetText("ThuTu").Trim() != "")
            {
                txt.Text = GetText("ThuTu");
            }
        }
        protected void txtName_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("NhomChucDanh") != null && GetText("NhomChucDanh").Trim() != "")
            {
                txt.Text = GetText("NhomChucDanh");
            }
        }
        protected void txtMaNhom_Load(object sender, System.EventArgs e)
        {
            ASPxTextBox txt = sender as ASPxTextBox;
            if (GetText("MaNhom") != null && GetText("MaNhom").Trim() != "")
            {
                txt.Text = GetText("MaNhom");
            }
        }
        private string GetText(string fieldName)
        {
            int index = grid.EditingRowVisibleIndex;
            string values = "";
            if (index >= 0)
            {
                values = grid.GetRowValues(index, fieldName).ToString();

            }
            return values;

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

