using System;
using System.Web;
using System.Data;
using System.Drawing;
using System.Collections;
using System.Collections.Generic;
using System.Reflection;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
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
    partial class DSBaoHiemCaNhan : PortalModuleBase, IActionable
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
        VNPT.Modules.Employees.EmployeesInfo employee = new VNPT.Modules.Employees.EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new VNPT.Modules.Employees.EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.ChangeSalary.ChangeSalaryInfo changeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryInfo();
        VNPT.Modules.ChangeSalary.ChangeSalaryController objChangeSalary = new VNPT.Modules.ChangeSalary.ChangeSalaryController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.Nationality.NationalityController objNationlity = new VNPT.Modules.Nationality.NationalityController();
        VNPT.Modules.Province.ProvinceController objProvince = new VNPT.Modules.Province.ProvinceController();
        VNPT.Modules.EmployeeContract.EmployeeContractController objContract = new VNPT.Modules.EmployeeContract.EmployeeContractController();
        VNPT.Modules.LaborContractType.LaborContractTypeController objLoaiHopDong = new VNPT.Modules.LaborContractType.LaborContractTypeController();
        VNPT.Modules.WorkHistory.WorkHistoryController objWorkHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        VNPT.Modules.Unit.UnitInfo unitInfo = new VNPT.Modules.Unit.UnitInfo();
        XtraReport_BH_NhanVien report = new XtraReport_BH_NhanVien();
        private int idNV = 0;

        protected void Page_Load(System.Object sender, System.EventArgs e)
        {
            System.Threading.Thread.CurrentThread.CurrentCulture.NumberFormat.NumberDecimalSeparator = ".";

            if (Request.Params["idNV"] != null && Request.Params["idNV"] != "undefined")
                idNV = Convert.ToInt32(Request.Params["idNV"]);
            if (!this.IsPostBack)
            {
                LoadThongTin(idNV);
                hiddenEmpID.Value = idNV.ToString();
            }
        }        
        private DataTable GetTable(int empId)
        {
            DataTable Table = new DataTable();
            DataColumn Col;
            DataRow Row;

            Col = new DataColumn("STT");
            Table.Columns.Add(Col);
            Col = new DataColumn("tuNgay");
            Table.Columns.Add(Col);
            Col = new DataColumn("denNgay");
            Table.Columns.Add(Col);
            Col = new DataColumn("chucVu_DonVi");            
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
            
            string donvi = "", chucvu = "", tienluong = "";
            int nSTT = 0;
            int iddonvi = 0;

            DateTime tuNgay = DateTime.Now;
            DateTime denNgay = DateTime.Now;

            var td = objBaoHiem.GetThoiDiemLuongAQTCTTheoIdNV(empId);
            for (int n = 0; n < td.Count; n++)
            {
                double bhxh = 0, bhyt = 0, bhtn = 0, nsdldbhxh = 0, nsdldbhyt = 0, nsdldbhtn = 0, luongcb = 0, heSoLuong = 0, phuCapChucVu = 0, phucaptrachnhiem = 0, phucapdochai = 0;
                tuNgay = td.ToList()[n].ThoiDiemLuongAQTCT;
                if (n>0)
                {
                    denNgay = td.ToList()[n - 1].ThoiDiemLuongAQTCT;
                }
                else
                {
                    denNgay = DateTime.Now;
                }
                var workHistory = objWorkHistory.GetWorkHistory(empId, tuNgay, denNgay);
                var salaryHistory = objChangeSalary.GetSalaryHistory(empId, tuNgay, denNgay);
                
                Row = Table.NewRow();
                Row[0] = nSTT++;
                Row[1] = string.Format("{0:dd/MM/yyyy}", tuNgay);
                Row[2] = string.Format("{0:dd/MM/yyyy}", denNgay);

                if (workHistory != null)
                {
                    var pc = objPosition.GetPosition(workHistory.positionid);
                    chucvu = workHistory.positionid != 0 ? pc.name : "Nhân viên";                    
                    phuCapChucVu = pc.coefficient != "" ? Convert.ToDouble(pc.coefficient) : 0;
                    phucaptrachnhiem = pc.ecoefficient != "" ? Convert.ToDouble(pc.ecoefficient) : 0;
                    phucapdochai = pc.rcoefficient != "" ? Convert.ToDouble(pc.rcoefficient) : 0;
                    unitInfo = objUnit.GetUnit(workHistory.unitid);
                    if (unitInfo != null)
                    {
                        if (unitInfo.parentid == 305 || unitInfo.parentid == 14)
                        {
                            iddonvi = 14;
                        }
                        else
                        {
                            iddonvi = unitInfo.parentid;
                        }
                        if (workHistory.unitid == 14)
                        {
                            donvi = workHistory.DVKhac;
                        }
                        else
                            donvi = unitInfo.name + " - " + objUnit.GetUnit(iddonvi).name;
                    }
                    
                }
                // he so
                if (salaryHistory != null)
                {
                    heSoLuong = salaryHistory.salarycoefficient.Trim() != "" ? Math.Round(float.Parse(salaryHistory.salarycoefficient), 4) : 0;
                    DateTime thoiDiem = denNgay;
                    tienluong = salaryHistory.salarycoefficient;
                    if (salaryHistory.KieuLuong == true)
                    {
                        luongcb = objBaoHiem.GetTTLuongCB(thoiDiem) != null ? Convert.ToDouble(objBaoHiem.GetTTLuongCB(thoiDiem).luongcb) : 0;
                        luongcb = (heSoLuong + phuCapChucVu+ phucaptrachnhiem) * luongcb;
                    }
                    else
                    {
                        luongcb = Convert.ToDouble(salaryHistory.LuongCB);
                    }
                    bhxh = objBaoHiem.GetTTBaoHiem(2, thoiDiem) != null ? Math.Round(float.Parse(objBaoHiem.GetTTBaoHiem(2, thoiDiem).tllaodong), 4) : 0;
                    bhyt = objBaoHiem.GetTTBaoHiem(3, thoiDiem) != null ? Math.Round(float.Parse(objBaoHiem.GetTTBaoHiem(3, thoiDiem).tllaodong), 4) : 0;
                    bhtn = objBaoHiem.GetTTBaoHiem(4, thoiDiem) != null ? Math.Round(float.Parse(objBaoHiem.GetTTBaoHiem(4, thoiDiem).tllaodong), 4) : 0;
                    nsdldbhxh = objBaoHiem.GetTTBaoHiem(2, thoiDiem) != null ? Math.Round(float.Parse(objBaoHiem.GetTTBaoHiem(2, thoiDiem).tlnsudunglaodong), 4) : 0;
                    nsdldbhyt = objBaoHiem.GetTTBaoHiem(3, thoiDiem) != null ? Math.Round(float.Parse(objBaoHiem.GetTTBaoHiem(3, thoiDiem).tlnsudunglaodong), 4) : 0;
                    nsdldbhtn = objBaoHiem.GetTTBaoHiem(4, thoiDiem) != null ? Math.Round(float.Parse(objBaoHiem.GetTTBaoHiem(4, thoiDiem).tlnsudunglaodong), 4) : 0;
                }
                Row[3] = chucvu + " " + donvi;
                Row[4] = tienluong;
                Row[5] = phuCapChucVu.ToString();
                Row[6] = (luongcb * bhxh).ToString("#,#",CultureInfo.InvariantCulture);
                Row[7] = (luongcb * nsdldbhxh).ToString("#,#", CultureInfo.InvariantCulture);
                Row[8] = (luongcb * bhyt).ToString("#,#", CultureInfo.InvariantCulture);
                Row[9] = (luongcb * nsdldbhyt).ToString("#,#", CultureInfo.InvariantCulture);
                Row[10] = (luongcb * bhtn).ToString("#,#", CultureInfo.InvariantCulture);
                Row[11] = (luongcb * nsdldbhtn).ToString("#,#", CultureInfo.InvariantCulture);
                Table.Rows.Add(Row);

            }
           
            return Table;
            
        }
        private void LoadThongTin(int empId)
        {
            this.employee = objEmployees.GetEmployees(empId);
            if (employee != null)
            {
                string gioiTinh = employee.sex == true ? "Nam" : "Nữ";
                string danToc = employee.nationalityid != 0 ? objNationlity.GetNationality(employee.nationalityid).name : "..........";
                string nguyenQuanNam = employee.nativeplace_provinceid != 0 ? objProvince.GetProvince(employee.nativeplace_provinceid).Name : "..........";
                string ngayCapCMND = employee.dateofissue.Year != 1900 ? string.Format("{0:dd/MM/yyyy}", employee.dateofissue) : ".../.../....";
                string noiCapCMDN = employee.provinceid != 0 ? objProvince.GetProvince(employee.provinceid).Name : "..........";
                // hop dong
                string soQD_HD = "", tuNgay_HD = "", denNgay_HD = "", loaiHD = "";
                string chucVu = employee.positionid != 0 ? objPosition.GetPosition(employee.positionid).name : "..........";
                int iddonvi = 0;              
                unitInfo = objUnit.GetUnit(employee.unitid);
                string donVi = "";
                if (unitInfo != null)
                {
                    if (unitInfo.parentid == 305 || unitInfo.parentid == 14)
                    {
                        iddonvi = 14;
                    }
                    donVi = iddonvi == 14 ? unitInfo.name + " - " + unitInfo.name : unitInfo.name + " - " + objUnit.GetUnit(unitInfo.parentid).name;
                }
                
                
                if (objContract.GetContractsByEmployess(empId).Count > 0)
                {
                    soQD_HD = objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].contractnum;
                    tuNgay_HD = "Ngày " + objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].datestart.Day +
                        " tháng " + objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].datestart.Month +
                        " năm " + objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].datestart.Year;
                    denNgay_HD = "Ngày " + objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].datestart.Day +
                        " tháng " + objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].datestart.Month +
                        " năm " + objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].datestart.Year;
                    loaiHD = objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].contracttype != 0 ? objLoaiHopDong.GetLaborContractType(objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].contracttype).name : "..........";
                }
                lbl_dong1.Text = "1. Họ và tên: " + employee.fullname.Trim() + "; Giới tính: " + gioiTinh;
                lbl_dong2.Text = "2. Ngày, tháng, năm sinh: " + string.Format("{0:dd/MM/yyyy}", employee.birthday) + "; Dân tộc: " + danToc + "; Quốc tịch: Việt Nam";
                lbl_dong3.Text = "3. Nguyên quán: " + Xa(employee.nativeplace.ToString()) + " - " + Huyen(employee.nativeplace.ToString()) + " - " + nguyenQuanNam;
                lbl_dong4.Text = "4. Nơi cư trú (nơi thường trú hoặc tạm trú): " + employee.placeofresidence;
                lbl_dong5.Text = "5. Chứng minh thư số: " + employee.identitynum + "; Ngày cấp: " + ngayCapCMND + "; Nơi cấp: " + noiCapCMDN;
                lbl_dong6.Text = "6. Hợp đồng lao động (hoặc hợp đồng làm việc) số: " + soQD_HD.Trim() + " " + tuNgay_HD + "; có hiệu lực " + denNgay_HD + "; Loại hợp đồng: " + loaiHD;
                lbl_dong7.Text = "7. Chức vụ, chức danh nghề: " + chucVu;
                lbl_dong8.Text = "8. Cơ quan, đơn vị: " + donVi;
                lbl_dong9.Text = "9. Địa chỉ: " + employee.placeofresidence;
                lbl_dong10.Text = "10. Nơi đăng kí khám chữa bệnh ban đầu: " + employee.placetomedicalexam.Trim();
                lbl_dong11.Text = "11. Đối tượng hưởng BHYT mức:";
                lbl_dong12.Text = "12. Quá trình đóng, chưa hưởng BHXH một lần và BH thất nghiệp:";
                
            }
            var objWHist = objWorkHistory.GetWorkHistoryByEmployee(empId);
            if (objWHist.Count > 0)
            {
                gridThongKeDSBaoHiem.DataSource = GetTable(empId);
                gridThongKeDSBaoHiem.DataBind();
            }
        }
        private void ExcelTop(int empId)
        {
            this.employee = objEmployees.GetEmployees(empId);
            if (employee != null)
            {
                report.maSo = "Mã số: " + employee.socialinsurancenum;
                report.hoTen = employee.fullname.Trim();
                report.nam = employee.sex == true ? "X" : "";
                report.nu = employee.sex == true ? "" : "X";
                report.ngaySinh = string.Format("{0:dd/MM/yyyy}", employee.birthday);
                report.danToc = employee.nationalityid != 0 ? objNationlity.GetNationality(employee.nationalityid).name : "..........";
                string nguyenQuanNam = employee.nativeplace_provinceid != 0 ? objProvince.GetProvince(employee.nativeplace_provinceid).Name : "..........";
                report.nguyenQuan = Xa(employee.nativeplace.ToString()) + " - " + Huyen(employee.nativeplace.ToString()) + " - " + nguyenQuanNam;
                report.soCMND = employee.identitynum.ToString();

                report.ngayCap = employee.dateofissue.Year != 1900 ? string.Format("{0:dd/MM/yyyy}", employee.dateofissue) : ".../.../....";
                report.noicap = employee.provinceid != 0 ? objProvince.GetProvince(employee.provinceid).Name : "..........";
                report.noiCuTru = employee.placeofresidence;
                report.diaChi = employee.placeofresidence; ;
                report.chucVu = employee.positionid != 0 ? objPosition.GetPosition(employee.positionid).name : "..........";
                report.donVi = employee.unitid != 0 ? objUnit.GetUnit(employee.unitid).name + " - " + objUnit.GetUnit(objUnit.GetUnit(employee.unitid).parentid).name : ".........";
                report.noiKhamBenh = employee.placetomedicalexam.Trim();
                // hop dong
                var ojbCT = objContract.GetContractsByEmployess(empId);
                if (ojbCT.Count > 0)
                {
                    report.soHopDong = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].contractnum;
                    report.ngayHD1 = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].datestart.Day.ToString();
                    report.thangHD1 = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].datestart.Month.ToString();
                    report.namHD1 = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].datestart.Year.ToString();
                    report.ngayHD2 = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].datestart.Day.ToString();
                    report.thangHD2 = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].datestart.Month.ToString();
                    report.namHD2 = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].datestart.Year.ToString();
                    report.loaiHD = ojbCT.OrderByDescending(o => o.datestart).ToList()[0].contracttype != 0 ? objLoaiHopDong.GetLaborContractType(objContract.GetContractsByEmployess(empId).OrderByDescending(o => o.datestart).ToList()[0].contracttype).name : "..........";
                }
            }
        }            
       
        private static string getConnectionString()
        {
            return DotNetNuke.Common.Utilities.Config.GetConnectionString();
        }
       
        protected void btXuatExcel_Click(object sender, EventArgs e)
        {
            if (hiddenEmpID.Value.Trim() != "")
            {
                ExcelTop(Convert.ToInt32(hiddenEmpID.Value));
                report.DataSource = GetTable(Convert.ToInt32(hiddenEmpID.Value));
                ReportViewer1.Report = report;
                ReportViewer1.WriteXlsTo(Response);
            }
        }
        int nSTT = 1;
        protected void gridThongKeDSBaoHiem_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
                  
            if (e.DataColumn.FieldName == "tienLuong")
            {
                int n = e.VisibleIndex;
                ASPxLabel lbl_heSoLuong = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_heSoLuong") as ASPxLabel;
                ASPxLabel lbl_heSoCV = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_heSoCV") as ASPxLabel;                
                lbl_heSoLuong.Text = e.CellValue.ToString();
                if (e.GetValue("phuCapCV").ToString() != "")
                {
                    lbl_heSoCV.Text = e.GetValue("phuCapCV").ToString();
                }
                else {
                    lbl_heSoCV.Text = "0";
                }
            }
            if (e.DataColumn.FieldName == "NLD_BHXH")
            {
                ASPxLabel lbl_nldBHXH = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nldBHXH") as ASPxLabel;
                ASPxLabel lbl_nsdldBHXH = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nsdldBHXH") as ASPxLabel;
            
                if (e.CellValue.ToString() != "")
                {
                    lbl_nldBHXH.Text = e.CellValue.ToString();
                }
                else
                {
                    lbl_nldBHXH.Text = "0";
                }
                if (e.GetValue("NSDLD_BHXH").ToString() != "")
                {
                    lbl_nsdldBHXH.Text = e.GetValue("NSDLD_BHXH").ToString();
                }
                else
                {
                    lbl_nsdldBHXH.Text = "0";
                }
            }
            if (e.DataColumn.FieldName == "NLD_BHYT")
            {
                ASPxLabel lbl_nldBHYT = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nldBHYT") as ASPxLabel;
                ASPxLabel lbl_nsdldBHYT = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nsdldBHYT") as ASPxLabel;
                if (e.CellValue.ToString() != "")
                {
                    lbl_nldBHYT.Text = e.CellValue.ToString();
                }
                else
                {
                    lbl_nldBHYT.Text = "0";
                }
                if (e.GetValue("NSDLD_BHYT").ToString() != "")
                {
                    lbl_nsdldBHYT.Text = e.GetValue("NSDLD_BHYT").ToString();
                }
                else
                {
                    lbl_nsdldBHYT.Text = "0";
                }
               
                
            }
            if (e.DataColumn.FieldName == "NLD_BHTN")
            {
                ASPxLabel lbl_nldBHTN = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nldBHTN") as ASPxLabel;
                ASPxLabel lbl_nsdldBHTN = gridThongKeDSBaoHiem.FindRowCellTemplateControl(e.VisibleIndex, e.DataColumn, "lbl_nsdldBHTN") as ASPxLabel;
               
              
                if (e.CellValue.ToString() != "")
                {
                    lbl_nldBHTN.Text = e.CellValue.ToString();
                }
                else
                {
                    lbl_nldBHTN.Text = "0";
                }
                if (e.GetValue("NSDLD_BHYT").ToString() != "")
                {
                    lbl_nsdldBHTN.Text = e.GetValue("NSDLD_BHTN").ToString();
                }
                else
                {
                    lbl_nsdldBHTN.Text = "0";
                }
            }
        }
        private string InsertSymbol(string str_Temps)
        {
            if (str_Temps == "0" | str_Temps == "" | str_Temps.Length < 3) return str_Temps;
            int int_Length = str_Temps.Length;

            int_Length = str_Temps.LastIndexOf(",", str_Temps.Length - 1);
            int_Length = int_Length == -1 ? str_Temps.Length : int_Length;

            int int_Count = 0;
            for (int i = int_Length; i > 0; i--)
            {
                if (int_Count % 3 == 0 && int_Count != 0)
                {
                    str_Temps = str_Temps.Insert(i, ".");
                }
                int_Count++;
            }
            return str_Temps;
        }        
        #endregion
        private string Xa(string str)
        {
            string x = "";
            string[] xa = str.Split('-', ',');
            if (xa != null && xa.Length > 1)
            {
                x = xa[0].ToString();
            }
            return x.Trim();
        }
        private string Huyen(string str)
        {
            string h = "";
            string[] Huyen = str.Split('-', ',');
            if (Huyen.Length > 1)
            {
                h = Huyen[1].ToString();
            }
            return h.Trim();
        }
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

