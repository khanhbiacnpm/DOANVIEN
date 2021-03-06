using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;
using System.Text;
using System.Globalization;


    public partial class BaoCaoThiDua : DevExpress.XtraReports.UI.XtraReport
    {
        public BaoCaoThiDua()
        {
            InitializeComponent();
        }

        /// <summary>
        /// Required designer variable.
        /// </summary>
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
            this.xrLabel20 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel19 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel18 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel17 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel16 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelTienChu = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelTongTien = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelSotienThidua = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelDanhhieuThidua = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelDanhHieu = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelQD = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabelNgayQD = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLine2 = new DevExpress.XtraReports.UI.XRLine();
            this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLine3 = new DevExpress.XtraReports.UI.XRLine();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel20,
            this.xrLabel19,
            this.xrLabel18,
            this.xrLabel17,
            this.xrLabel16,
            this.xrLabelTienChu,
            this.xrLabel14,
            this.xrLabelTongTien,
            this.xrLabelSotienThidua,
            this.xrLabel12,
            this.xrLabelDanhhieuThidua,
            this.xrLabelDanhHieu,
            this.xrLabel10,
            this.xrLabel9,
            this.xrLabel8,
            this.xrLabel7,
            this.xrLabel1,
            this.xrLabelQD,
            this.xrLabelNgayQD,
            this.xrLine2,
            this.xrLine1,
            this.xrLabel3,
            this.xrLabel2,
            this.xrLabel6,
            this.xrLine3});
            this.Detail.HeightF = 849F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            this.Detail.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.Detail_BeforePrint);
            // 
            // xrLabel20
            // 
            this.xrLabel20.Font = new System.Drawing.Font("Times New Roman", 11F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))));
            this.xrLabel20.LocationFloat = new DevExpress.Utils.PointFloat(55.20833F, 744.7917F);
            this.xrLabel20.Name = "xrLabel20";
            this.xrLabel20.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel20.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel20.StylePriority.UseFont = false;
            this.xrLabel20.Text = "Nơi nhận:";
            // 
            // xrLabel19
            // 
            this.xrLabel19.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel19.LocationFloat = new DevExpress.Utils.PointFloat(55.2083F, 769.2084F);
            this.xrLabel19.Multiline = true;
            this.xrLabel19.Name = "xrLabel19";
            this.xrLabel19.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel19.SizeF = new System.Drawing.SizeF(215.625F, 69.79163F);
            this.xrLabel19.StylePriority.UseFont = false;
            this.xrLabel19.Text = "- Như điều 3 (để thực hiện)\r\n- Lưu TCLĐ";
            // 
            // xrLabel18
            // 
            this.xrLabel18.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel18.LocationFloat = new DevExpress.Utils.PointFloat(516.6667F, 723.9583F);
            this.xrLabel18.Name = "xrLabel18";
            this.xrLabel18.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel18.SizeF = new System.Drawing.SizeF(100F, 23F);
            this.xrLabel18.StylePriority.UseFont = false;
            this.xrLabel18.Text = "GIÁM ĐỐC";
            // 
            // xrLabel17
            // 
            this.xrLabel17.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel17.LocationFloat = new DevExpress.Utils.PointFloat(56.25F, 650F);
            this.xrLabel17.Name = "xrLabel17";
            this.xrLabel17.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel17.SizeF = new System.Drawing.SizeF(629.6666F, 62.5F);
            this.xrLabel17.StylePriority.UseFont = false;
            this.xrLabel17.Text = "Các ông (bà): Thường trực Thi đua khen thưởng, Trưởng phòng Tổ chức-Lao động, Trưởng phòng KTTK-TC Viễn thông tỉnh; các đơn vị liên quan, các cá nhân có tên tại điều 1 và điều 2 chịu trách nhiệm thi hành quyết dịnh này./.";
            // 
            // xrLabel16
            // 
            this.xrLabel16.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel16.LocationFloat = new DevExpress.Utils.PointFloat(4.166635F, 650F);
            this.xrLabel16.Name = "xrLabel16";
            this.xrLabel16.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel16.SizeF = new System.Drawing.SizeF(50F, 18.83337F);
            this.xrLabel16.StylePriority.UseFont = false;
            this.xrLabel16.Text = "Điều 3.";
            // 
            // xrLabelTienChu
            // 
            this.xrLabelTienChu.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabelTienChu.LocationFloat = new DevExpress.Utils.PointFloat(56.25F, 570.9166F);
            this.xrLabelTienChu.Name = "xrLabelTienChu";
            this.xrLabelTienChu.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelTienChu.SizeF = new System.Drawing.SizeF(631.75F, 25F);
            this.xrLabelTienChu.StylePriority.UseFont = false;
            this.xrLabelTienChu.Text = "Bằng chữ: {0}";
            // 
            // xrLabel14
            // 
            this.xrLabel14.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(56.25F, 595.9166F);
            this.xrLabel14.Name = "xrLabel14";
            this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel14.SizeF = new System.Drawing.SizeF(631.75F, 19.79169F);
            this.xrLabel14.StylePriority.UseFont = false;
            this.xrLabel14.Text = "Số tiền trích từ Quỹ khen thưởng tập trung của Viễn thông tỉnh, các đơn vị thực h" +
                "iện chi hộ.";
            // 
            // xrLabelTongTien
            // 
            this.xrLabelTongTien.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabelTongTien.LocationFloat = new DevExpress.Utils.PointFloat(56.24994F, 548F);
            this.xrLabelTongTien.Name = "xrLabelTongTien";
            this.xrLabelTongTien.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelTongTien.SizeF = new System.Drawing.SizeF(631.7501F, 22.91669F);
            this.xrLabelTongTien.StylePriority.UseFont = false;
            this.xrLabelTongTien.Text = "Tổng số tiền thưởng là : {0} đồng";
            // 
            // xrLabelSotienThidua
            // 
            this.xrLabelSotienThidua.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabelSotienThidua.LocationFloat = new DevExpress.Utils.PointFloat(56.24994F, 521.875F);
            this.xrLabelSotienThidua.Name = "xrLabelSotienThidua";
            this.xrLabelSotienThidua.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelSotienThidua.SizeF = new System.Drawing.SizeF(629.6667F, 26.12494F);
            this.xrLabelSotienThidua.StylePriority.UseFont = false;
            this.xrLabelSotienThidua.Text = "Tặng thưởng bằng vật chất kèm theo cho mỗi cá nhân đạt danh hiệu: ";
            // 
            // xrLabel12
            // 
            this.xrLabel12.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(4.166635F, 521.875F);
            this.xrLabel12.Name = "xrLabel12";
            this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel12.SizeF = new System.Drawing.SizeF(50F, 18.83337F);
            this.xrLabel12.StylePriority.UseFont = false;
            this.xrLabel12.Text = "Điều 2.";
            // 
            // xrLabelDanhhieuThidua
            // 
            this.xrLabelDanhhieuThidua.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabelDanhhieuThidua.LocationFloat = new DevExpress.Utils.PointFloat(56.24997F, 481.25F);
            this.xrLabelDanhhieuThidua.Multiline = true;
            this.xrLabelDanhhieuThidua.Name = "xrLabelDanhhieuThidua";
            this.xrLabelDanhhieuThidua.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelDanhhieuThidua.SizeF = new System.Drawing.SizeF(631.75F, 19.79169F);
            this.xrLabelDanhhieuThidua.StylePriority.UseFont = false;
            this.xrLabelDanhhieuThidua.StylePriority.UseTextAlignment = false;
            this.xrLabelDanhhieuThidua.Text = "xrLabel";
            this.xrLabelDanhhieuThidua.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // xrLabelDanhHieu
            // 
            this.xrLabelDanhHieu.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabelDanhHieu.LocationFloat = new DevExpress.Utils.PointFloat(55.2083F, 441.6667F);
            this.xrLabelDanhHieu.Name = "xrLabelDanhHieu";
            this.xrLabelDanhHieu.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelDanhHieu.SizeF = new System.Drawing.SizeF(632.7917F, 39.58331F);
            this.xrLabelDanhHieu.StylePriority.UseFont = false;
            this.xrLabelDanhHieu.Text = "Công nhận danh hiệu thi đua năm {0} cho {1} cá nhân thuộc Viễn thông Đắk Lắk - Đắ" +
                "k Nông có tên trong danh sách kèm theo, bao gồm: ";
            // 
            // xrLabel10
            // 
            this.xrLabel10.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(4.166635F, 440.625F);
            this.xrLabel10.Name = "xrLabel10";
            this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel10.SizeF = new System.Drawing.SizeF(50F, 18.83337F);
            this.xrLabel10.StylePriority.UseFont = false;
            this.xrLabel10.Text = "Điều 1.";
            // 
            // xrLabel9
            // 
            this.xrLabel9.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(4.166635F, 400F);
            this.xrLabel9.Name = "xrLabel9";
            this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel9.SizeF = new System.Drawing.SizeF(683.8333F, 23.00002F);
            this.xrLabel9.StylePriority.UseFont = false;
            this.xrLabel9.StylePriority.UseTextAlignment = false;
            this.xrLabel9.Text = "QUYẾT ĐỊNH:";
            this.xrLabel9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel8
            // 
            this.xrLabel8.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(4.166635F, 242.7083F);
            this.xrLabel8.Multiline = true;
            this.xrLabel8.Name = "xrLabel8";
            this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel8.SizeF = new System.Drawing.SizeF(683.8334F, 146.9584F);
            this.xrLabel8.StylePriority.UseFont = false;
            this.xrLabel8.Text = @"            Căn cứ Điều lệ tổ chức và hoạt động của Viễn thông Đăk Lắk - Đắk Nông được Hội đồng quản trị Tập đoàn Bưu chính Viễn thông Việt Nam phê chuẩn tại quyết định số 708/QĐ-TCCB/HĐQT ngày 06 tháng 12 năm 2007;

            Căn cứ Quy chế Thi đua Khen thưởng của Viễn thông Đắk Lắk - Đắk Nông ban hành theo quyết định số 630/TCCB ngày 04/7/2008 của Giám đốc Viễn thông Đắk Lắk - Đắk Nông;

            Theo đề nghị của Thường trực TĐKT và Trưởng phòng Tổ chức-Lao động";
            // 
            // xrLabel7
            // 
            this.xrLabel7.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
            this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(4.166635F, 189.5833F);
            this.xrLabel7.Name = "xrLabel7";
            this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel7.SizeF = new System.Drawing.SizeF(683.8334F, 29.16667F);
            this.xrLabel7.StylePriority.UseFont = false;
            this.xrLabel7.StylePriority.UseTextAlignment = false;
            this.xrLabel7.Text = "GIÁM ĐỐC VIỄN THÔNG ĐẮKLẮK";
            this.xrLabel7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel1
            // 
            this.xrLabel1.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 10.00001F);
            this.xrLabel1.Multiline = true;
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(334.375F, 44.25001F);
            this.xrLabel1.StylePriority.UseFont = false;
            this.xrLabel1.StylePriority.UseTextAlignment = false;
            this.xrLabel1.Text = "TẬP ĐOÀN\r\nBƯU CHÍNH VIỄN THÔNG VIỆT NAM";
            this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabelQD
            // 
            this.xrLabelQD.Font = new System.Drawing.Font("Times New Roman", 11F);
            this.xrLabelQD.LocationFloat = new DevExpress.Utils.PointFloat(0F, 87.66667F);
            this.xrLabelQD.Name = "xrLabelQD";
            this.xrLabelQD.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelQD.SizeF = new System.Drawing.SizeF(334.375F, 23F);
            this.xrLabelQD.StylePriority.UseFont = false;
            this.xrLabelQD.StylePriority.UseTextAlignment = false;
            this.xrLabelQD.Text = "Số: {0}";
            this.xrLabelQD.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabelNgayQD
            // 
            this.xrLabelNgayQD.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
            this.xrLabelNgayQD.LocationFloat = new DevExpress.Utils.PointFloat(361.1251F, 87.66667F);
            this.xrLabelNgayQD.Name = "xrLabelNgayQD";
            this.xrLabelNgayQD.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabelNgayQD.SizeF = new System.Drawing.SizeF(336.8749F, 23F);
            this.xrLabelNgayQD.StylePriority.UseFont = false;
            this.xrLabelNgayQD.Text = "Buôn Ma Thuột, ngày {0} tháng {1} năm {2}";
            // 
            // xrLine2
            // 
            this.xrLine2.LocationFloat = new DevExpress.Utils.PointFloat(442.7083F, 65.7917F);
            this.xrLine2.Name = "xrLine2";
            this.xrLine2.SizeF = new System.Drawing.SizeF(173.9583F, 11.45833F);
            // 
            // xrLine1
            // 
            this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(56.25F, 77.25F);
            this.xrLine1.Name = "xrLine1";
            this.xrLine1.SizeF = new System.Drawing.SizeF(214.5833F, 10.41666F);
            // 
            // xrLabel3
            // 
            this.xrLabel3.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(361.1251F, 13.66666F);
            this.xrLabel3.Multiline = true;
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(336.8749F, 44.25001F);
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.StylePriority.UseTextAlignment = false;
            this.xrLabel3.Text = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM\r\nĐộc lập - Tự do - Hạnh phúc\r\n";
            this.xrLabel3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel2
            // 
            this.xrLabel2.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(0F, 54.25002F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(334.375F, 23F);
            this.xrLabel2.StylePriority.UseFont = false;
            this.xrLabel2.StylePriority.UseTextAlignment = false;
            this.xrLabel2.Text = "VIỄN THÔNG ĐẮKLẮK ";
            this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel6
            // 
            this.xrLabel6.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
            this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(0F, 121.4583F);
            this.xrLabel6.Multiline = true;
            this.xrLabel6.Name = "xrLabel6";
            this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel6.SizeF = new System.Drawing.SizeF(639.9999F, 39.54166F);
            this.xrLabel6.StylePriority.UseFont = false;
            this.xrLabel6.StylePriority.UseTextAlignment = false;
            this.xrLabel6.Text = "QUYẾT ĐỊNH\r\nV/v Công nhận và khen thưởng danh hiệu thi đua cho cá nhân năm 2008";
            this.xrLabel6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLine3
            // 
            this.xrLine3.LocationFloat = new DevExpress.Utils.PointFloat(165.625F, 161F);
            this.xrLine3.Name = "xrLine3";
            this.xrLine3.SizeF = new System.Drawing.SizeF(306.25F, 14.58334F);
            // 
            // TopMargin
            // 
            this.TopMargin.HeightF = 56F;
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BottomMargin
            // 
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BaoCaoThiDua
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
            this.Margins = new System.Drawing.Printing.Margins(100, 52, 56, 100);
            this.Version = "10.1";
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

        }

        #endregion

        private DevExpress.XtraReports.UI.DetailBand Detail;
        private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
        private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
        private DevExpress.XtraReports.UI.XRLabel xrLabel3;
        private DevExpress.XtraReports.UI.XRLabel xrLabel2;
        private DevExpress.XtraReports.UI.XRLabel xrLabel1;
        private DevExpress.XtraReports.UI.XRLine xrLine1;
        private DevExpress.XtraReports.UI.XRLine xrLine2;
        private DevExpress.XtraReports.UI.XRLabel xrLabelNgayQD;
        private DevExpress.XtraReports.UI.XRLabel xrLabelQD;
        private DevExpress.XtraReports.UI.XRLabel xrLabel6;
        private DevExpress.XtraReports.UI.XRLabel xrLabel8;
        private DevExpress.XtraReports.UI.XRLabel xrLabel7;
        private DevExpress.XtraReports.UI.XRLine xrLine3;
        private DevExpress.XtraReports.UI.XRLabel xrLabelDanhHieu;
        private DevExpress.XtraReports.UI.XRLabel xrLabel10;
        private DevExpress.XtraReports.UI.XRLabel xrLabel9;
        private DevExpress.XtraReports.UI.XRLabel xrLabelSotienThidua;
        private DevExpress.XtraReports.UI.XRLabel xrLabel12;
        public DevExpress.XtraReports.UI.XRLabel xrLabelDanhhieuThidua;
        public DevExpress.XtraReports.UI.XRLabel xrLabel14;
        public DevExpress.XtraReports.UI.XRLabel xrLabelTongTien;
        private DevExpress.XtraReports.UI.XRLabel xrLabel17;
        private DevExpress.XtraReports.UI.XRLabel xrLabel16;
        public DevExpress.XtraReports.UI.XRLabel xrLabelTienChu;
        private DevExpress.XtraReports.UI.XRLabel xrLabel20;
        private DevExpress.XtraReports.UI.XRLabel xrLabel19;
        private DevExpress.XtraReports.UI.XRLabel xrLabel18;

        public string soquyetdinh;
        public DateTime ngayquyetdinh;
        public string namthidua;

        public int soluongDanhHieu;
        public ArrayList arDanhHieu = new ArrayList();
        public ArrayList arDanhHieuSoLuong = new ArrayList();
        public ArrayList arDanhHieuTienThuong = new ArrayList();

        private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
        {
            CultureInfo culture = new CultureInfo("vi-VN");
            culture.NumberFormat.CurrencySymbol = "";
            culture.NumberFormat.CurrencyDecimalDigits = 0;

            StringBuilder sbDanhhieuSL = new StringBuilder();
            StringBuilder sbDanhHieuTT = new StringBuilder();
            int totalTienthuong = 0;
            int totalCanhan = 0;
            for (int i = 0; i < soluongDanhHieu; i++)
            {
                string danhHieu = arDanhHieu[i].ToString();
                int soluongcanhan = (int)(arDanhHieuSoLuong[i]);
                int tienthuong = Convert.ToInt32(arDanhHieuTienThuong[i]);
                totalCanhan += soluongcanhan;
                totalTienthuong += tienthuong * soluongcanhan;
                sbDanhhieuSL.AppendLine(string.Format("+{0} {1}.\n", soluongcanhan, danhHieu));
                sbDanhHieuTT.AppendLine(string.Format(culture, "{0} là: {1:c} đồng; ", danhHieu, tienthuong));
            }
            string danhhieuFormat = xrLabelDanhHieu.Text;
            xrLabelDanhHieu.Text = string.Format(danhhieuFormat, namthidua, totalCanhan);
            xrLabelDanhhieuThidua.Text = sbDanhhieuSL.ToString();
            xrLabelSotienThidua.Text += sbDanhHieuTT.ToString();
            string tongtienFormat = xrLabelTongTien.Text;

            xrLabelTongTien.Text = string.Format(tongtienFormat, string.Format(culture, "{0:c}", totalTienthuong));
            string tienchuFormat = xrLabelTienChu.Text;
            xrLabelTienChu.Text = string.Format(tienchuFormat + " đồng", NumberToString(totalTienthuong));

            string formatQD = xrLabelQD.Text;
            xrLabelQD.Text = string.Format(formatQD, soquyetdinh);

            string formatNQD = xrLabelNgayQD.Text;
            xrLabelNgayQD.Text = string.Format(formatNQD, ngayquyetdinh.Day, ngayquyetdinh.Month, ngayquyetdinh.Year);
        }

        private string NumberToString(int number)
        {
            int ti = number / 1000000000;
            int soTrieu = number % 1000000000;
            int trieu = soTrieu / 1000000;
            int soNgan = soTrieu % 1000000;
            int ngan = soNgan / 1000;
            int soTram = soNgan % 1000;

            string strTi = string.Empty;
            string strTrieu = string.Empty;
            string strNgan = string.Empty;
            string strTram = string.Empty;

            if (ti != 0)
            {
                strTi = string.Format("{0} tỉ", TramToString(ti));
            }
            if (trieu != 0)
            {
                strTrieu = string.Format("{0} triệu", TramToString(trieu));
            }
            if (ngan != 0)
            {
                strNgan = string.Format("{0} ngàn", TramToString(ngan));
            }
            if (soTram != 0)
            {
                strTram = TramToString(soTram);
            }

            string strTien = string.Empty;

            if (!string.IsNullOrEmpty(strTi))
            {
                strTien = strTi;
            }
            if (!string.IsNullOrEmpty(strTrieu))
            {
                if (!string.IsNullOrEmpty(strTien))
                {
                    strTien = string.Format("{0}, {1}", strTien, strTrieu);
                }
                else
                    strTien = strTrieu;
            }
            if (!string.IsNullOrEmpty(strNgan))
            {
                if (!string.IsNullOrEmpty(strTien))
                    strTien = string.Format("{0}, {1}", strTien, strNgan);
                else
                    strTien = strNgan;
            }
            if (!string.IsNullOrEmpty(strTram))
            {
                if (!string.IsNullOrEmpty(strTram))
                {
                    strTien = string.Format("{0}, {1}", strTien, strTram);
                }
                else
                    strTien = strTram;
            }
            return strTien;
        }

        private string TramToString(int number)
        {
            int hangtram = number / 100;
            int duchuc = number % 100;
            int hangchuc = duchuc / 10;
            int hangdonvi = duchuc % 10;
            string tram = string.Empty;
            string chuc = string.Empty;
            if (hangtram != 0)
            {
                tram = string.Format("{0} trăm", mapNumberToString(hangtram));
                if (hangchuc != 0)
                    tram = string.Format("{0} {1}", tram, ChucToString(duchuc));
                else
                {
                    if (hangdonvi != 0)
                    {
                        tram = string.Format("{0} linh {1}", tram, mapNumberToString(hangdonvi));
                    }
                }
                return tram;
            }
            else if (hangchuc != 0)
            {
                return ChucToString(duchuc);
            }
            else if (hangdonvi != 0)
                return mapNumberToString(hangdonvi);
            return string.Empty;
        }

        private string ChucToString(int number)
        {
            int hangchuc = number / 10;
            int hangdonvi = number % 10;
            string chuc = string.Empty;
            if (hangchuc == 1)
            {
                chuc = "mười";
                if (hangdonvi != 0)
                    chuc = string.Format("{0} {1}", chuc, mapNumberToString(hangdonvi));
            }
            else
            {
                chuc = string.Format("{0} mươi", mapNumberToString(hangchuc));
                if (hangdonvi != 0)
                {
                    if (hangdonvi == 1)
                        chuc = string.Format("{0} mốt", chuc);
                    else
                        chuc = string.Format("{0} {1}", chuc, mapNumberToString(hangdonvi));
                }
            }
            return chuc;
        }

        private string mapNumberToString(int number)
        {
            if (number == 1) return "một";
            if (number == 2) return "hai";
            if (number == 3) return "ba";
            if (number == 4) return "bốn";
            if (number == 5) return "năm";
            if (number == 6) return "sáu";
            if (number == 7) return "bảy";
            if (number == 8) return "tám";
            if (number == 9) return "chín";
            return "không";
        }
    }

