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
using System.Data;
using System.Linq;
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
using System.Globalization;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace Philip.Modules.BaoHiem
{
    /// -----------------------------------------------------------------------------
    /// <summary>
    /// The ViewCountry class displays the content
    /// </summary>
    /// <remarks>
    /// </remarks>
    /// <history>
    /// </history>
    /// -----------------------------------------------------------------------------
    partial class ViewDSBaoHiem : PortalModuleBase, IActionable
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

        /// -----------------------------------------------------------------------------
        /// <summary>
        /// Page_Load runs when the control is loaded
        /// </summary>
        /// <remarks>
        /// </remarks>
        /// <history>
        /// </history>
        /// -----------------------------------------------------------------------------
        
        BaoHiem.BaoHiemInfo baohiem = new Philip.Modules.BaoHiem.BaoHiemInfo();
        BaoHiem.BaoHiemController objBaoHiem = new Philip.Modules.BaoHiem.BaoHiemController();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.ChangeSalary.ChangeSalaryController objChangeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryController();
        VNPT.Modules.WorkHistory.WorkHistoryController objWorkHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        XtraReportDSBaoHiem report = new XtraReportDSBaoHiem();
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;
        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            if (!IsPostBack)
            {
                BindUnit();
            }            
        }
              
        protected void gridThongKeDSBaoHiem_CallBack(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {            
            string unitid = cmbDonVi.SelectedItem.Value.ToString() == "14" ? "0" : cmbDonVi.SelectedItem.Value.ToString();
            gridThongKeDSBaoHiem.DataSource = GetTable(Convert.ToInt32(unitid), dateThongKe.Date);
            gridThongKeDSBaoHiem.DataBind();            
        }
        protected void btXuatExcel_Click(object sender, EventArgs e)
        {
            string unitid = cmbDonVi.SelectedItem.Value.ToString() == "14" ? "0" : cmbDonVi.SelectedItem.Value.ToString();
            report.DataAdapter = null;
            report.DataSource = GetTable(Convert.ToInt32(unitid), dateThongKe.Date);
            report.ngayThongKe = "Ngày " + dateThongKe.Date.Day + " tháng " + dateThongKe.Date.Month + " năm " + dateThongKe.Date.Year;
            ReportViewer1.Report = report;
            ReportViewer1.WriteXlsTo(Response);            
        }
        int nSTT = 1;
        protected void gridThongKeDSBaoHiem_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Id")
            {
                ASPxLabel lbl_STT = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_STT") as ASPxLabel;
                lbl_STT.Text = nSTT++ + ""; 
            }            
            if (e.DataColumn.FieldName == "tienLuong")
            {
                int n = e.VisibleIndex;
                ASPxLabel lbl_heSoLuong = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_heSoLuong") as ASPxLabel;
                ASPxLabel lbl_heSoCV = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_heSoCV") as ASPxLabel;
                lbl_heSoLuong.Text = e.CellValue.ToString();
                lbl_heSoCV.Text = e.GetValue("phuCapCV").ToString();
            }
            if (e.DataColumn.FieldName == "NLD_BHXH")
            {
                ASPxLabel lbl_nldBHXH = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nldBHXH") as ASPxLabel;
                ASPxLabel lbl_nsdldBHXH = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nsdldBHXH") as ASPxLabel;
                lbl_nldBHXH.Text = e.CellValue.ToString();
                lbl_nsdldBHXH.Text = e.GetValue("NSDLD_BHXH").ToString();
            }
            if (e.DataColumn.FieldName == "NLD_BHYT")
            {
                ASPxLabel lbl_nldBHYT = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nldBHYT") as ASPxLabel;
                ASPxLabel lbl_nsdldBHYT = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nsdldBHYT") as ASPxLabel;
                lbl_nldBHYT.Text = e.CellValue.ToString();
                lbl_nsdldBHYT.Text = e.GetValue("NSDLD_BHYT").ToString();
            }
            if (e.DataColumn.FieldName == "NLD_BHTN")
            {
                ASPxLabel lbl_nldBHTN = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nldBHTN") as ASPxLabel;
                ASPxLabel lbl_nsdldBHTN = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nsdldBHTN") as ASPxLabel;
                lbl_nldBHTN.Text = e.CellValue.ToString();
                lbl_nsdldBHTN.Text = e.GetValue("NSDLD_BHTN").ToString();                
            }
        }
       
        int nSTTtb = 0;
        private DataTable GetTable(int UnitId, DateTime thoiDiem)
        {            
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;
           
            Col = new DataColumn("Id");
            Table.Columns.Add(Col);
            Col = new DataColumn("hoTen");
            Table.Columns.Add(Col);
            Col = new DataColumn("soCMDN");
            Table.Columns.Add(Col);
            Col = new DataColumn("soBHXH");
            Table.Columns.Add(Col);
            Col = new DataColumn("soBHYT");
            Table.Columns.Add(Col);
            Col = new DataColumn("ngaySinh");
            Table.Columns.Add(Col);            
            Col = new DataColumn("gioiTinh");
            Table.Columns.Add(Col);
            Col = new DataColumn("tenTT");
            Table.Columns.Add(Col);
            Col = new DataColumn("noiKhamBenh");            
            Table.Columns.Add(Col);
            Col = new DataColumn("tienLuong");// heso
            Table.Columns.Add(Col);
            Col = new DataColumn("phuCapCV");
            Table.Columns.Add(Col);
            Col = new DataColumn("NLD_BHXH");
            Table.Columns.Add(Col);
            Col = new DataColumn("NSDLD_BHXH");
            Table.Columns.Add(Col);
            Col = new DataColumn("NLD_BHYT");
            Table.Columns.Add(Col);
            Col = new DataColumn("NSDLD_BHYT");
            Table.Columns.Add(Col);
            Col = new DataColumn("NLD_BHTN");
            Table.Columns.Add(Col);
            Col = new DataColumn("NSDLD_BHTN");            
            Table.Columns.Add(Col);
            Col = new DataColumn("ngayDongBHXH");
            Table.Columns.Add(Col);
            Col = new DataColumn("STT");

            Table.Columns.Add(Col);

            
            foreach (DSBaoHiemInfo item in objBaoHiem.GetEmployeesTGBaoHiemByUnitid(UnitId))
            {
                nSTTtb++;
                int empId = item.id;
                string a = item.hoTen;
                DateTime tuNgay = DateTime.Now;
                DateTime denNgay = DateTime.Now;
                DateTime thoid = new DateTime();
                thoid = Convert.ToDateTime(dateThongKe.Value);
                double Tbhxh = 0, Tbhyt = 0, Tbhtn = 0, Tnsldbhxh = 0, Tnsdldbhyt = 0, Tnsdldbhtn = 0;
                Boolean b = false;
                var td = objBaoHiem.GetThoiDiemLuongAQTCTTheoIdNV(empId);
                for (int n = 0; n < td.Count; n++)
                {
                    double bhxh = 0, bhyt = 0, bhtn = 0, nsdldbhxh = 0, nsdldbhyt = 0, nsdldbhtn = 0, luongcb = 0, heSoLuong = 0, phuCapChucVu = 0, phucaptrachnhiem = 0, phucapdochai = 0;
                    tuNgay = td.ToList()[n].ThoiDiemLuongAQTCT;
                    if (n + 1 < td.Count)
                    {
                        if(td.ToList()[n + 1].ThoiDiemLuongAQTCT > thoid){
                            denNgay = td.ToList()[n + 1].ThoiDiemLuongAQTCT;
                            b = true;
                        }else
                            denNgay = thoid;                        
                    }
                    else
                    {
                        denNgay = thoid;
                    }
                    var workHistory = objWorkHistory.GetWorkHistory(empId, tuNgay, denNgay);
                    var salaryHistory = objChangeSalary.GetSalaryHistory(empId, tuNgay, denNgay);

                    if (workHistory != null)
                    {
                        var pc = objPosition.GetPosition(workHistory.positionid);
                        phuCapChucVu = pc.coefficient != "" ? Convert.ToDouble(pc.coefficient) : 0;
                        phucaptrachnhiem = pc.ecoefficient != "" ? Convert.ToDouble(pc.ecoefficient) : 0;
                        phucapdochai = pc.rcoefficient != "" ? Convert.ToDouble(pc.rcoefficient) : 0;
                    }
                    
                    // he so
                    if (salaryHistory != null)
                    {
                        heSoLuong = salaryHistory.salarycoefficient.Trim() != "" ? Math.Round(float.Parse(salaryHistory.salarycoefficient), 4) : 0;                        

                        if (salaryHistory.KieuLuong == true)
                        {
                            luongcb = objBaoHiem.GetTTLuongCB(thoiDiem) != null ? Convert.ToDouble(objBaoHiem.GetTTLuongCB(denNgay).luongcb) : 0;
                            luongcb = (heSoLuong + phuCapChucVu + phucaptrachnhiem) * luongcb;
                        }
                        else
                        {
                            luongcb = Convert.ToDouble(salaryHistory.LuongCB);
                        }
                        var bxh = objBaoHiem.GetTTBaoHiem(2, denNgay);
                        var byt = objBaoHiem.GetTTBaoHiem(3, denNgay);
                        var btn = objBaoHiem.GetTTBaoHiem(4, denNgay);                        

                        bhxh = bxh != null ? Math.Round(float.Parse(bxh.tllaodong), 4) : 0;
                        bhyt = byt != null ? Math.Round(float.Parse(byt.tllaodong), 4) : 0;
                        bhtn = btn != null ? Math.Round(float.Parse(btn.tllaodong), 4) : 0;
                        nsdldbhxh = bxh != null ? Math.Round(float.Parse(bxh.tlnsudunglaodong), 4) : 0;
                        nsdldbhyt = byt != null ? Math.Round(float.Parse(byt.tlnsudunglaodong), 4) : 0;
                        nsdldbhtn = btn != null ? Math.Round(float.Parse(btn.tlnsudunglaodong), 4) : 0;
                    }
                    int Sothang = (denNgay.Year - tuNgay.Year) * 12 + (denNgay.Month - tuNgay.Month);
                    Tbhxh = (luongcb * bhxh * Sothang) + Tbhxh;
                    Tnsldbhxh = (luongcb * nsdldbhxh * Sothang) + Tnsldbhxh;
                    Tbhyt = (luongcb * bhyt * Sothang) + Tbhyt;
                    Tnsdldbhyt = (luongcb * nsdldbhyt * Sothang) + Tnsdldbhyt;
                    Tbhtn = (luongcb * bhtn * Sothang) + Tbhtn;
                    Tnsdldbhtn = (luongcb * nsdldbhtn * Sothang) + Tnsdldbhtn;
                    if(b == true)
                        break;
                }

                var cSa = objChangeSalary.GetChangeSalaryByEmployee(item.id);
                                              
                var Eposi = objEmployees.GetEmployees(item.id);
                var pc1 = objPosition.GetPosition(Eposi.positionid);
                
                Row = Table.NewRow();
                Row[0] = item.id.ToString();
                Row[1] = item.hoTen;
                Row[2] = item.soCMND;
                Row[3] = item.soBHXH;
                Row[4] = item.soBHYT;
                Row[5] = string.Format("{0:dd/MM/yyyy}", item.ngaySinh);
                Row[6] = item.gioiTinh == 1 ? "" : "X";
                Row[7] = item.tenTT;
                Row[8] = item.noiKhamBenh;
                Row[9] = cSa.ToList()[0].salarycoefficient;
                Row[10] = pc1.coefficient;
                Row[11] = Tbhxh.ToString("#,#", CultureInfo.InvariantCulture);
                Row[12] = Tnsldbhxh.ToString("#,#", CultureInfo.InvariantCulture);
                Row[13] = Tbhyt.ToString("#,#", CultureInfo.InvariantCulture);
                Row[14] = Tnsdldbhyt.ToString("#,#", CultureInfo.InvariantCulture);
                Row[15] = Tbhtn.ToString("#,#", CultureInfo.InvariantCulture);
                Row[16] = Tnsdldbhtn.ToString("#,#", CultureInfo.InvariantCulture);
                Row[17] = item.ngayDongBHXH.Year == 1900 ? "" : string.Format("{0:dd/MM/yyyy}", item.ngayDongBHXH);
                Row[18] = nSTTtb + "";
                Table.Rows.Add(Row);
            }
            return Table;
        }               
        private void BindUnit()
        {
            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[HRM_KhenThuong_Combo_DonVi]", 0);
            cmbDonVi.DataSource = ds.Tables[0];
            cmbDonVi.TextField = "tendonvi";
            cmbDonVi.ValueField = "id";
            cmbDonVi.DataBind();          
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

