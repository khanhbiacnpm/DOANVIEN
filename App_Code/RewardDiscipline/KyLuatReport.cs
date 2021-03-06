using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

/// <summary>
/// Summary description for KyLuatReport
/// </summary>
public class KyLuatReport : DevExpress.XtraReports.UI.XtraReport
{
    public string ngayThanNam = "";

	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    public XRLabel xrLabel1lblDonVi;
    public XRLabel xrlblSoQD;
    private XRLabel xrLabel1;
    private XRLabel xrLabel2;
    private XRLabel xrLabel3;
    private XRLabel xrLabel4;
    private XRLabel xrLabel5;
    private XRLabel xrLabel6;
    private XRLabel xrLabel7;
    private XRLabel xrLabel8;
    private XRLabel xrLabel9;
    private XRLabel xrlblKyLuatNhanVien;
    public DevExpress.XtraReports.Parameters.Parameter tennhanvien;
    public DevExpress.XtraReports.Parameters.Parameter chucvunhanvien;
    public DevExpress.XtraReports.Parameters.Parameter donvinhanvien;
    public DevExpress.XtraReports.Parameters.Parameter hinhthuckyluat;
    public DevExpress.XtraReports.Parameters.Parameter lydokyluat;
    private XRLabel xrlblHinhthucKyluat;
    private XRLabel xrlblLyDoKyLuat;
    private XRLabel xrLabel10;
    private XRLabel xrlblHieuLucKyLuat;
    public DevExpress.XtraReports.Parameters.Parameter thoidiemkiluat;
    private XRLabel xrLabel11;
    private XRLabel xrLabel12;
    private XRLabel xrLabel13;
    private XRLabel xrLabel14;
    private XRLabel xrLabel15;
    public DevExpress.XtraReports.Parameters.Parameter quyetdinhkyluat;
    public DevExpress.XtraReports.Parameters.Parameter ngayhopkiluat;
    public DevExpress.XtraReports.Parameters.Parameter thoihankiluat;
	/// <summary>
	/// Required designer variable.
	/// </summary>
	private System.ComponentModel.IContainer components = null;

	public KyLuatReport()
	{
		InitializeComponent();
		//
		// TODO: Add constructor logic here
		//
	}
	
	/// <summary> 
	/// Clean up any resources being used.
	/// </summary>
	/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
	protected override void Dispose(bool disposing) {
		if (disposing && (components != null)) {
			components.Dispose();
		}
		base.Dispose(disposing);
	}

	#region Designer generated code

	/// <summary>
	/// Required method for Designer support - do not modify
	/// the contents of this method with the code editor.
	/// </summary>
	private void InitializeComponent() {
        
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrLabel15 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrlblHieuLucKyLuat = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrlblLyDoKyLuat = new DevExpress.XtraReports.UI.XRLabel();
        this.xrlblHinhthucKyluat = new DevExpress.XtraReports.UI.XRLabel();
        this.xrlblKyLuatNhanVien = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrlblSoQD = new DevExpress.XtraReports.UI.XRLabel();
        this.quyetdinhkyluat = new DevExpress.XtraReports.Parameters.Parameter();
        this.xrLabel1lblDonVi = new DevExpress.XtraReports.UI.XRLabel();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        this.tennhanvien = new DevExpress.XtraReports.Parameters.Parameter();
        this.chucvunhanvien = new DevExpress.XtraReports.Parameters.Parameter();
        this.donvinhanvien = new DevExpress.XtraReports.Parameters.Parameter();
        this.hinhthuckyluat = new DevExpress.XtraReports.Parameters.Parameter();
        this.lydokyluat = new DevExpress.XtraReports.Parameters.Parameter();
        this.thoidiemkiluat = new DevExpress.XtraReports.Parameters.Parameter();
        this.ngayhopkiluat = new DevExpress.XtraReports.Parameters.Parameter();
        this.thoihankiluat = new DevExpress.XtraReports.Parameters.Parameter();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel15,
            this.xrLabel14,
            this.xrLabel13,
            this.xrLabel12,
            this.xrLabel11,
            this.xrlblHieuLucKyLuat,
            this.xrLabel10,
            this.xrlblLyDoKyLuat,
            this.xrlblHinhthucKyluat,
            this.xrlblKyLuatNhanVien,
            this.xrLabel9,
            this.xrLabel8,
            this.xrLabel7,
            this.xrLabel6,
            this.xrLabel5,
            this.xrLabel4,
            this.xrLabel3,
            this.xrLabel2,
            this.xrLabel1,
            this.xrlblSoQD,
            this.xrLabel1lblDonVi});
        this.Detail.HeightF = 735F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        this.Detail.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.Detail_BeforePrint);
        // 
        // xrLabel15
        // 
        this.xrLabel15.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrLabel15.LocationFloat = new DevExpress.Utils.PointFloat(25.00006F, 645.7916F);
        this.xrLabel15.Multiline = true;
        this.xrLabel15.Name = "xrLabel15";
        this.xrLabel15.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel15.SizeF = new System.Drawing.SizeF(188.5417F, 71.00012F);
        this.xrLabel15.StylePriority.UseFont = false;
        this.xrLabel15.Text = "Nơi nhận:\r\n- Như điều 3;\r\n- Lưu Hồ sơ;\r\n";
        // 
        // xrLabel14
        // 
        this.xrLabel14.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
        this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(492.7083F, 605.2083F);
        this.xrLabel14.Name = "xrLabel14";
        this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel14.SizeF = new System.Drawing.SizeF(100F, 23F);
        this.xrLabel14.StylePriority.UseFont = false;
        this.xrLabel14.Text = "GIÁM ĐỐC ";
        // 
        // xrLabel13
        // 
        this.xrLabel13.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(24.99997F, 531.5833F);
        this.xrLabel13.Name = "xrLabel13";
        this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel13.SizeF = new System.Drawing.SizeF(704F, 38.625F);
        this.xrLabel13.StylePriority.UseFont = false;
        this.xrLabel13.Text = "Trưởng phòng Tổ chức – lao động ; Đơn vị liên quan và ông (bà) có tên trong Điều " +
            "1 chịu trách nhiệm thi hành quyết định này.";
        // 
        // xrLabel12
        // 
        this.xrLabel12.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(71.87497F, 506.4999F);
        this.xrLabel12.Multiline = true;
        this.xrLabel12.Name = "xrLabel12";
        this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel12.SizeF = new System.Drawing.SizeF(657.1252F, 20.91675F);
        this.xrLabel12.StylePriority.UseFont = false;
        this.xrLabel12.Text = "Các Ông (Bà) : \r\n";
        // 
        // xrLabel11
        // 
        this.xrLabel11.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 506.4999F);
        this.xrLabel11.Multiline = true;
        this.xrLabel11.Name = "xrLabel11";
        this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel11.SizeF = new System.Drawing.SizeF(61.87496F, 25.08337F);
        this.xrLabel11.StylePriority.UseFont = false;
        this.xrLabel11.Text = "Điều 3. ";
        // 
        // xrlblHieuLucKyLuat
        // 
        this.xrlblHieuLucKyLuat.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrlblHieuLucKyLuat.LocationFloat = new DevExpress.Utils.PointFloat(71.87494F, 470.0415F);
        this.xrlblHieuLucKyLuat.Name = "xrlblHieuLucKyLuat";
        this.xrlblHieuLucKyLuat.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrlblHieuLucKyLuat.SizeF = new System.Drawing.SizeF(657.125F, 22.99994F);
        this.xrlblHieuLucKyLuat.StylePriority.UseFont = false;
        this.xrlblHieuLucKyLuat.Text = "Quyết định kỷ luật này có hiệu lực {0}kể từ ngày {1:dd/MM/yyyy}";
        this.xrlblHieuLucKyLuat.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.xrlblHieuLucKyLuat_BeforePrint);
        // 
        // xrLabel10
        // 
        this.xrLabel10.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 470.0415F);
        this.xrLabel10.Multiline = true;
        this.xrLabel10.Name = "xrLabel10";
        this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel10.SizeF = new System.Drawing.SizeF(61.87493F, 25.08334F);
        this.xrLabel10.StylePriority.UseFont = false;
        this.xrLabel10.Text = "Điều 2. ";
        // 
        // xrlblLyDoKyLuat
        // 
        this.xrlblLyDoKyLuat.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrlblLyDoKyLuat.LocationFloat = new DevExpress.Utils.PointFloat(71.87497F, 447.0416F);
        this.xrlblLyDoKyLuat.Name = "xrlblLyDoKyLuat";
        this.xrlblLyDoKyLuat.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrlblLyDoKyLuat.SizeF = new System.Drawing.SizeF(657.125F, 22.99997F);
        this.xrlblLyDoKyLuat.StylePriority.UseFont = false;
        this.xrlblLyDoKyLuat.Text = "Lý do kỷ luật: {0}";
        this.xrlblLyDoKyLuat.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.xrlblLyDoKyLuat_BeforePrint);
        // 
        // xrlblHinhthucKyluat
        // 
        this.xrlblHinhthucKyluat.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrlblHinhthucKyluat.LocationFloat = new DevExpress.Utils.PointFloat(71.87497F, 424.0416F);
        this.xrlblHinhthucKyluat.Name = "xrlblHinhthucKyluat";
        this.xrlblHinhthucKyluat.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrlblHinhthucKyluat.SizeF = new System.Drawing.SizeF(657.125F, 22.99994F);
        this.xrlblHinhthucKyluat.StylePriority.UseFont = false;
        this.xrlblHinhthucKyluat.Text = "Hình thức kỷ luật: {0}";
        this.xrlblHinhthucKyluat.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.xrlblHinhthucKyluat_BeforePrint);
        // 
        // xrlblKyLuatNhanVien
        // 
        this.xrlblKyLuatNhanVien.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrlblKyLuatNhanVien.LocationFloat = new DevExpress.Utils.PointFloat(71.87497F, 401.0416F);
        this.xrlblKyLuatNhanVien.Name = "xrlblKyLuatNhanVien";
        this.xrlblKyLuatNhanVien.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrlblKyLuatNhanVien.SizeF = new System.Drawing.SizeF(657.125F, 23.00003F);
        this.xrlblKyLuatNhanVien.StylePriority.UseFont = false;
        this.xrlblKyLuatNhanVien.Text = "Nay kỷ luật nhân viên: {0}, chức vụ: {1}, đơn vị: {2}";
        this.xrlblKyLuatNhanVien.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.xrlblKyLuatNhanVien_BeforePrint);
        // 
        // xrLabel9
        // 
        this.xrLabel9.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(10.00001F, 401.0417F);
        this.xrLabel9.Multiline = true;
        this.xrLabel9.Name = "xrLabel9";
        this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel9.SizeF = new System.Drawing.SizeF(61.87496F, 25.08331F);
        this.xrLabel9.StylePriority.UseFont = false;
        this.xrLabel9.Text = "Điều 1. ";
        // 
        // xrLabel8
        // 
        this.xrLabel8.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(294.7917F, 365.625F);
        this.xrLabel8.Name = "xrLabel8";
        this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel8.SizeF = new System.Drawing.SizeF(139.5833F, 23F);
        this.xrLabel8.StylePriority.UseFont = false;
        this.xrLabel8.StylePriority.UseTextAlignment = false;
        this.xrLabel8.Text = "QUYẾT ĐỊNH";
        this.xrLabel8.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrLabel7
        // 
        this.xrLabel7.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(0F, 188.5417F);
        this.xrLabel7.Multiline = true;
        this.xrLabel7.Name = "xrLabel7";
        this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel7.SizeF = new System.Drawing.SizeF(728.9999F, 156.25F);
        this.xrLabel7.StylePriority.UseFont = false;
        this.xrLabel7.Text = @"      Căn cứ Điều lệ tổ chức và hoạt động của Viễn thông Đắk Lắk - Đắk Nông được Hội đồng quản trị Tập đoàn Bưu chính Viễn thông Việt Nam phê chuẩn tại quyết định số 708/QĐ-TCCB/HĐQT ngày 06 tháng 12 năm 2007;      

      Căn cứ nội quy lao động của Viễn thông Đắk Lắk – Đắk Nông;
      
      Căn cứ phiên họp của Hội đồng Kỷ luật của Viễn thông Đắk Lắk – Đắk Nông  ngày {0:dd/MM/yyyy};";
        // 
        // xrLabel6
        // 
        this.xrLabel6.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
        this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(201.0417F, 151F);
        this.xrLabel6.Name = "xrLabel6";
        this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel6.SizeF = new System.Drawing.SizeF(373.9584F, 23F);
        this.xrLabel6.StylePriority.UseFont = false;
        this.xrLabel6.StylePriority.UseTextAlignment = false;
        this.xrLabel6.Text = "GIÁM ĐỐC VIỄN THÔNG ĐẮK LẮK - ĐẮK NÔNG";
        this.xrLabel6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrLabel5
        // 
        this.xrLabel5.Font = new System.Drawing.Font("Times New Roman", 11F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))));
        this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(259.375F, 110.5F);
        this.xrLabel5.Name = "xrLabel5";
        this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel5.SizeF = new System.Drawing.SizeF(231.25F, 22.99998F);
        this.xrLabel5.StylePriority.UseFont = false;
        this.xrLabel5.StylePriority.UseTextAlignment = false;
        this.xrLabel5.Text = "Về việc xử lý kỷ luật";
        this.xrLabel5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrLabel4
        // 
        this.xrLabel4.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(312.5F, 87.5F);
        this.xrLabel4.Name = "xrLabel4";
        this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel4.SizeF = new System.Drawing.SizeF(121.875F, 23F);
        this.xrLabel4.StylePriority.UseFont = false;
        this.xrLabel4.StylePriority.UseTextAlignment = false;
        this.xrLabel4.Text = "QUYẾT ĐỊNH";
        this.xrLabel4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrLabel3
        // 
        this.xrLabel3.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Italic);
        this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(355.8333F, 46F);
        this.xrLabel3.Name = "xrLabel3";
        this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel3.SizeF = new System.Drawing.SizeF(344.1666F, 22.99999F);
        this.xrLabel3.StylePriority.UseFont = false;
        this.xrLabel3.StylePriority.UseTextAlignment = false;
        this.xrLabel3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrLabel2
        // 
        this.xrLabel2.Font = new System.Drawing.Font("Times New Roman", 11F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))));
        this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(355.8333F, 22.99999F);
        this.xrLabel2.Name = "xrLabel2";
        this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel2.SizeF = new System.Drawing.SizeF(344.1666F, 23F);
        this.xrLabel2.StylePriority.UseFont = false;
        this.xrLabel2.StylePriority.UseTextAlignment = false;
        this.xrLabel2.Text = "Độc lập – Tự do – Hạnh phúc";
        this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrLabel1
        // 
        this.xrLabel1.Font = new System.Drawing.Font("Times New Roman", 11F, System.Drawing.FontStyle.Bold);
        this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(355.8333F, 0F);
        this.xrLabel1.Name = "xrLabel1";
        this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1.SizeF = new System.Drawing.SizeF(344.1666F, 23F);
        this.xrLabel1.StylePriority.UseFont = false;
        this.xrLabel1.StylePriority.UseTextAlignment = false;
        this.xrLabel1.Text = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
        this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // xrlblSoQD
        // 
        this.xrlblSoQD.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding(this.quyetdinhkyluat, "Text", "Số: {0}")});
        this.xrlblSoQD.Font = new System.Drawing.Font("Times New Roman", 11F);
        this.xrlblSoQD.LocationFloat = new DevExpress.Utils.PointFloat(0F, 22.99999F);
        this.xrlblSoQD.Name = "xrlblSoQD";
        this.xrlblSoQD.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrlblSoQD.SizeF = new System.Drawing.SizeF(303.125F, 23F);
        this.xrlblSoQD.StylePriority.UseFont = false;
        this.xrlblSoQD.StylePriority.UseTextAlignment = false;
        this.xrlblSoQD.Text = "[Parameters.quyetdinhkyluat]";
        this.xrlblSoQD.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // quyetdinhkyluat
        // 
        this.quyetdinhkyluat.Name = "quyetdinhkyluat";
        this.quyetdinhkyluat.Value = "";
        // 
        // xrLabel1lblDonVi
        // 
        this.xrLabel1lblDonVi.Font = new System.Drawing.Font("Times New Roman", 11F);
        this.xrLabel1lblDonVi.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
        this.xrLabel1lblDonVi.Name = "xrLabel1lblDonVi";
        this.xrLabel1lblDonVi.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1lblDonVi.SizeF = new System.Drawing.SizeF(303.125F, 23F);
        this.xrLabel1lblDonVi.StylePriority.UseFont = false;
        this.xrLabel1lblDonVi.StylePriority.UseTextAlignment = false;
        this.xrLabel1lblDonVi.Text = "VIỄN THÔNG ĐẮK LẮK - ĐẮK NÔNG";
        this.xrLabel1lblDonVi.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
        // 
        // TopMargin
        // 
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
        // tennhanvien
        // 
        this.tennhanvien.Name = "tennhanvien";
        this.tennhanvien.Value = "";
        // 
        // chucvunhanvien
        // 
        this.chucvunhanvien.Name = "chucvunhanvien";
        this.chucvunhanvien.Value = "";
        // 
        // donvinhanvien
        // 
        this.donvinhanvien.Name = "donvinhanvien";
        this.donvinhanvien.Value = "";
        // 
        // hinhthuckyluat
        // 
        this.hinhthuckyluat.Name = "hinhthuckyluat";
        this.hinhthuckyluat.Value = "";
        // 
        // lydokyluat
        // 
        this.lydokyluat.Name = "lydokyluat";
        this.lydokyluat.Value = "";
        // 
        // thoidiemkiluat
        // 
        this.thoidiemkiluat.Name = "thoidiemkiluat";
        this.thoidiemkiluat.ParameterType = DevExpress.XtraReports.Parameters.ParameterType.DateTime;
        this.thoidiemkiluat.Value = new System.DateTime(((long)(0)));
        // 
        // ngayhopkiluat
        // 
        this.ngayhopkiluat.Name = "ngayhopkiluat";
        this.ngayhopkiluat.ParameterType = DevExpress.XtraReports.Parameters.ParameterType.DateTime;
        this.ngayhopkiluat.Value = new System.DateTime(((long)(0)));
        // 
        // thoihankiluat
        // 
        this.thoihankiluat.Name = "thoihankiluat";
        this.thoihankiluat.ParameterType = DevExpress.XtraReports.Parameters.ParameterType.Int32;
        this.thoihankiluat.Value = 0;
        // 
        // KyLuatReport
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Margins = new System.Drawing.Printing.Margins(100, 11, 100, 100);
        this.Parameters.AddRange(new DevExpress.XtraReports.Parameters.Parameter[] {
            this.tennhanvien,
            this.chucvunhanvien,
            this.donvinhanvien,
            this.hinhthuckyluat,
            this.lydokyluat,
            this.thoidiemkiluat,
            this.quyetdinhkyluat,
            this.ngayhopkiluat,
            this.thoihankiluat});
        this.Version = "10.1";
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}

	#endregion

    private void xrlblKyLuatNhanVien_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        
    }

    private void xrlblHinhthucKyluat_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        
    }

    private void xrlblLyDoKyLuat_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        
    }

    private void xrlblHieuLucKyLuat_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        
    }

    private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        xrLabel3.Text = ngayThanNam;
        string textFormat = xrLabel7.Text;
        DateTime tdhop = (DateTime)(ngayhopkiluat.Value);
        xrLabel7.Text = string.Format(textFormat, tdhop);

        textFormat = xrlblKyLuatNhanVien.Text;
        string tennv = tennhanvien.Value.ToString();
        string cvnv = chucvunhanvien.Value.ToString();
        string dvnv = donvinhanvien.Value.ToString();
        xrlblKyLuatNhanVien.Text = string.Format(textFormat, tennv, cvnv, dvnv);

        textFormat = xrlblHinhthucKyluat.Text;
        string htkl = hinhthuckyluat.Value.ToString();
        xrlblHinhthucKyluat.Text = string.Format(textFormat, htkl);

        textFormat = xrlblLyDoKyLuat.Text;
        string ldkl = lydokyluat.Value.ToString();
        xrlblLyDoKyLuat.Text = string.Format(textFormat, ldkl);

        DateTime tdkl = (DateTime)(thoidiemkiluat.Value);
        textFormat = xrlblHieuLucKyLuat.Text;

        if (string.Equals("Sa thải", htkl, StringComparison.OrdinalIgnoreCase))
        {
            xrlblHieuLucKyLuat.Text = string.Format(textFormat, "", tdkl);
        }
        else
        {
            int thoihan = (int)(thoihankiluat.Value);
            xrlblHieuLucKyLuat.Text = string.Format(textFormat, string.Format("{0} tháng, ", thoihan), tdkl);
        }
    }
}
