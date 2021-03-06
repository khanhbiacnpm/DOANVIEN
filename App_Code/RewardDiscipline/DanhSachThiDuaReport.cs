using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Collections.Generic;


    public partial class DanhSachThiDuaReport : DevExpress.XtraReports.UI.XtraReport
    {
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
            this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
            this.xrTableCellSTT = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCellEmpcode = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCellFullName = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCellUnitName = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCellChucVu = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCellDanhHieuTD = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCellTienThuong = new DevExpress.XtraReports.UI.XRTableCell();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.ReportHeader = new DevExpress.XtraReports.UI.ReportHeaderBand();
            this.xrTable2 = new DevExpress.XtraReports.UI.XRTable();
            this.xrTableRow2 = new DevExpress.XtraReports.UI.XRTableRow();
            this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell2 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell5 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell6 = new DevExpress.XtraReports.UI.XRTableCell();
            this.xrTableCell7 = new DevExpress.XtraReports.UI.XRTableCell();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrTable1});
            this.Detail.HeightF = 25F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            this.Detail.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.Detail_BeforePrint);
            // 
            // xrTable1
            // 
            this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.xrTable1.Name = "xrTable1";
            this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
            this.xrTable1.SizeF = new System.Drawing.SizeF(750F, 25F);
            // 
            // xrTableRow1
            // 
            this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCellSTT,
            this.xrTableCellEmpcode,
            this.xrTableCellFullName,
            this.xrTableCellUnitName,
            this.xrTableCellChucVu,
            this.xrTableCellDanhHieuTD,
            this.xrTableCellTienThuong});
            this.xrTableRow1.Name = "xrTableRow1";
            this.xrTableRow1.Weight = 1;
            this.xrTableRow1.BeforePrint += new System.Drawing.Printing.PrintEventHandler(xrTableRow1_BeforePrint);
            // 
            // xrTableCellSTT
            // 
            this.xrTableCellSTT.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellSTT.Name = "xrTableCellSTT";
            this.xrTableCellSTT.StylePriority.UseBorders = false;
            this.xrTableCellSTT.StylePriority.UseTextAlignment = false;
            this.xrTableCellSTT.Text = "xrTableCell";
            this.xrTableCellSTT.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCellSTT.Weight = 0.19020170264652092;
            // 
            // xrTableCellEmpcode
            // 
            this.xrTableCellEmpcode.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellEmpcode.Name = "xrTableCellEmpcode";
            this.xrTableCellEmpcode.StylePriority.UseBorders = false;
            this.xrTableCellEmpcode.StylePriority.UseTextAlignment = false;
            this.xrTableCellEmpcode.Text = "xrTableCellEmpcode";
            this.xrTableCellEmpcode.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCellEmpcode.Weight = 0.302593925820821;
            // 
            // xrTableCellFullName
            // 
            this.xrTableCellFullName.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellFullName.Name = "xrTableCellFullName";
            this.xrTableCellFullName.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 0, 0, 0, 100F);
            this.xrTableCellFullName.StylePriority.UseBorders = false;
            this.xrTableCellFullName.StylePriority.UsePadding = false;
            this.xrTableCellFullName.StylePriority.UseTextAlignment = false;
            this.xrTableCellFullName.Text = "xrTableCellFullName";
            this.xrTableCellFullName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.xrTableCellFullName.Weight = 0.63112369047404948;
            // 
            // xrTableCellUnitName
            // 
            this.xrTableCellUnitName.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellUnitName.Name = "xrTableCellUnitName";
            this.xrTableCellUnitName.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 0, 0, 0, 100F);
            this.xrTableCellUnitName.StylePriority.UseBorders = false;
            this.xrTableCellUnitName.StylePriority.UsePadding = false;
            this.xrTableCellUnitName.StylePriority.UseTextAlignment = false;
            this.xrTableCellUnitName.Text = "xrTableCellUnitName";
            this.xrTableCellUnitName.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.xrTableCellUnitName.Weight = 0.62247811536163455;
            // 
            // xrTableCellChucVu
            // 
            this.xrTableCellChucVu.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellChucVu.Name = "xrTableCellChucVu";
            this.xrTableCellChucVu.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 0, 0, 0, 100F);
            this.xrTableCellChucVu.StylePriority.UseBorders = false;
            this.xrTableCellChucVu.StylePriority.UsePadding = false;
            this.xrTableCellChucVu.StylePriority.UseTextAlignment = false;
            this.xrTableCellChucVu.Text = "xrTableCellChucVu";
            this.xrTableCellChucVu.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.xrTableCellChucVu.Weight = 0.53602350402941779;
            // 
            // xrTableCellDanhHieuTD
            // 
            this.xrTableCellDanhHieuTD.Borders = ((DevExpress.XtraPrinting.BorderSide)((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellDanhHieuTD.Name = "xrTableCellDanhHieuTD";
            this.xrTableCellDanhHieuTD.StylePriority.UseBorders = false;
            this.xrTableCellDanhHieuTD.StylePriority.UseTextAlignment = false;
            this.xrTableCellDanhHieuTD.Text = "xrTableCellDanhHieuTD";
            this.xrTableCellDanhHieuTD.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCellDanhHieuTD.Weight = 0.41498532581205738;
            // 
            // xrTableCellTienThuong
            // 
            this.xrTableCellTienThuong.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCellTienThuong.Name = "xrTableCellTienThuong";
            this.xrTableCellTienThuong.StylePriority.UseBorders = false;
            this.xrTableCellTienThuong.StylePriority.UseTextAlignment = false;
            this.xrTableCellTienThuong.Text = "xrTableCellTienThuong";
            this.xrTableCellTienThuong.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCellTienThuong.Weight = 0.414985579099154;
            // 
            // TopMargin
            // 
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BottomMargin
            // 
            this.BottomMargin.HeightF = 22F;
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrLabel1
            // 
            this.xrLabel1.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
            this.xrLabel1.Multiline = true;
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(750F, 31.33334F);
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.StylePriority.UseTextAlignment = false;
            this.xrLabel1.Text = "DANH SÁCH CÁ NHÂN\r\n ĐƯỢC CÔNG NHẬN VÀ KHEN THƯỞNG DANH HIỆU THI ĐUA NĂM {0}";
            this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel2
            // 
            this.xrLabel2.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Italic);
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(0F, 31.33335F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(750F, 22.91667F);
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.StylePriority.UseTextAlignment = false;
            this.xrLabel2.Text = "(Kèm theo quyết định số: {0}, ngày {1})";
            this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // ReportHeader
            // 
            this.ReportHeader.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel1,
            this.xrLabel2,
            this.xrTable2});
            this.ReportHeader.HeightF = 124F;
            this.ReportHeader.Name = "ReportHeader";
            this.ReportHeader.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.ReportHeader_BeforePrint);
            // 
            // xrTable2
            // 
            this.xrTable2.LocationFloat = new DevExpress.Utils.PointFloat(0F, 99.00001F);
            this.xrTable2.Name = "xrTable2";
            this.xrTable2.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow2});
            this.xrTable2.SizeF = new System.Drawing.SizeF(750F, 25F);
            // 
            // xrTableRow2
            // 
            this.xrTableRow2.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell2,
            this.xrTableCell3,
            this.xrTableCell4,
            this.xrTableCell5,
            this.xrTableCell6,
            this.xrTableCell7});
            this.xrTableRow2.Name = "xrTableRow2";
            this.xrTableRow2.Weight = 1;
            // 
            // xrTableCell1
            // 
            this.xrTableCell1.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell1.Name = "xrTableCell1";
            this.xrTableCell1.StylePriority.UseBorders = false;
            this.xrTableCell1.StylePriority.UseTextAlignment = false;
            this.xrTableCell1.Text = "STT";
            this.xrTableCell1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell1.Weight = 0.19020170264652092;
            // 
            // xrTableCell2
            // 
            this.xrTableCell2.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell2.Name = "xrTableCell2";
            this.xrTableCell2.StylePriority.UseBorders = false;
            this.xrTableCell2.StylePriority.UseTextAlignment = false;
            this.xrTableCell2.Text = "Mã NV";
            this.xrTableCell2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell2.Weight = 0.302593925820821;
            // 
            // xrTableCell3
            // 
            this.xrTableCell3.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell3.Name = "xrTableCell3";
            this.xrTableCell3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 0, 0, 0, 100F);
            this.xrTableCell3.StylePriority.UseBorders = false;
            this.xrTableCell3.StylePriority.UsePadding = false;
            this.xrTableCell3.StylePriority.UseTextAlignment = false;
            this.xrTableCell3.Text = "Họ tên";
            this.xrTableCell3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.xrTableCell3.Weight = 0.63112369047404948;
            // 
            // xrTableCell4
            // 
            this.xrTableCell4.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell4.Name = "xrTableCell4";
            this.xrTableCell4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 0, 0, 0, 100F);
            this.xrTableCell4.StylePriority.UseBorders = false;
            this.xrTableCell4.StylePriority.UsePadding = false;
            this.xrTableCell4.StylePriority.UseTextAlignment = false;
            this.xrTableCell4.Text = "Đơn Vị";
            this.xrTableCell4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.xrTableCell4.Weight = 0.62247811536163455;
            // 
            // xrTableCell5
            // 
            this.xrTableCell5.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell5.Name = "xrTableCell5";
            this.xrTableCell5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 0, 0, 0, 100F);
            this.xrTableCell5.StylePriority.UseBorders = false;
            this.xrTableCell5.StylePriority.UsePadding = false;
            this.xrTableCell5.StylePriority.UseTextAlignment = false;
            this.xrTableCell5.Text = "Chức Vụ";
            this.xrTableCell5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            this.xrTableCell5.Weight = 0.53602350402941779;
            // 
            // xrTableCell6
            // 
            this.xrTableCell6.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell6.Name = "xrTableCell6";
            this.xrTableCell6.StylePriority.UseBorders = false;
            this.xrTableCell6.StylePriority.UseTextAlignment = false;
            this.xrTableCell6.Text = "Danh Hiệu";
            this.xrTableCell6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell6.Weight = 0.41498532581205738;
            // 
            // xrTableCell7
            // 
            this.xrTableCell7.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                        | DevExpress.XtraPrinting.BorderSide.Right)
                        | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrTableCell7.Name = "xrTableCell7";
            this.xrTableCell7.StylePriority.UseBorders = false;
            this.xrTableCell7.StylePriority.UseTextAlignment = false;
            this.xrTableCell7.Text = "Tiền Thưởng";
            this.xrTableCell7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            this.xrTableCell7.Weight = 0.414985579099154;
            // 
            // DanhSachThiDuaReport
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin,
            this.ReportHeader});
            this.Margins = new System.Drawing.Printing.Margins(51, 49, 100, 22);
            this.Version = "10.1";
            ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }

        #endregion

        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
        private DevExpress.XtraReports.UI.XRLabel xrLabel1;
        private DevExpress.XtraReports.UI.XRLabel xrLabel2;
        private DevExpress.XtraReports.UI.ReportHeaderBand ReportHeader;
        private DevExpress.XtraReports.UI.XRTable xrTable1;
        private DevExpress.XtraReports.UI.XRTableRow xrTableRow1;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellSTT;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellEmpcode;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellFullName;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellUnitName;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellChucVu;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellDanhHieuTD;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCellTienThuong;
        private DevExpress.XtraReports.UI.XRTable xrTable2;
        private DevExpress.XtraReports.UI.XRTableRow xrTableRow2;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell1;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell2;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell3;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell4;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell5;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell6;
        private DevExpress.XtraReports.UI.XRTableCell xrTableCell7;

        public DanhSachThiDuaReport()
        {
            InitializeComponent();
        }

        private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            
            xrTableCellSTT.DataBindings.Add("Text", DataSource, "STT");
            xrTableCellEmpcode.DataBindings.Add("Text", DataSource, "Empcode");
            xrTableCellFullName.DataBindings.Add("Text", DataSource, "FullName");
            xrTableCellUnitName.DataBindings.Add("Text", DataSource, "UnitName");
            xrTableCellChucVu.DataBindings.Add("Text", DataSource, "ChucVu");
            xrTableCellDanhHieuTD.DataBindings.Add("Text", DataSource, "HinhThucThiDua");
            xrTableCellTienThuong.DataBindings.Add("Text", DataSource, "TienThuong");
        }

        private void ReportHeader_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            string titleFormat = xrLabel1.Text;
            xrLabel1.Text = string.Format(titleFormat, namthidua);

            string soqdFormat = xrLabel2.Text;
            xrLabel2.Text = string.Format(soqdFormat, soquyetdinh, thoigian);

        }


        private void xrTableRow1_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            int itemType = (int)GetCurrentColumnValue("ItemType");
            if (itemType == 2)
            {
                this.xrTableCellSTT.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular);
                this.xrTableCellUnitName.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Regular);
            }
            else
            {
                this.xrTableCellSTT.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
                this.xrTableCellUnitName.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
            }
        }

        public string soquyetdinh;
        public string thoigian;
        public string namthidua;
    }

