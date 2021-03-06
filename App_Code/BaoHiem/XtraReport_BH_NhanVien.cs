using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

/// <summary>
/// Summary description for XtraReport_BH_NhanVien
/// </summary>
public class XtraReport_BH_NhanVien : DevExpress.XtraReports.UI.XtraReport
{
    public string hoTen = "";
    public string nam = "";
    public string nu = "";
    public string ngaySinh = "";
    public string danToc = "";
    public string nguyenQuan = "";
    public string noiCuTru = "";
    public string soCMND = "";
    public string ngayCap = "";
    public string noicap = "";
    public string soHopDong = "";
    public string ngayHD1 = "";
    public string thangHD1 = "";
    public string namHD1 = "";
    public string ngayHD2 = "";
    public string thangHD2 = "";
    public string namHD2 = "";
    public string loaiHD = "";
    public string chucVu = "";
    public string donVi = "";
    public string diaChi = "";
    public string noiKhamBenh = "";
    public string maSo = "";

	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRLabel xrLabel1;
    private XRTable xrTable1;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell_STT;
    private XRTableCell xrTableCell_tuNgay;
    private XRTableCell xrTableCell_denNgay;
    private XRTableCell xrTableCell_donVi;
    private XRTableCell xrTableCell_tienLuong;
    private XRTableCell xrTableCell_phuCap;
    private XRLabel xrLabel2;
    private XRLabel xrLabel3;
    private XRLabel xrLabel4;
    private XRLabel xrLabel5;
    private XRLabel xrLabel6;
    private XRTable xrTable2;
    private XRTableRow xrTableRow2;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell_hoTen;
    private XRTableCell xrTableCell3;
    private XRTableCell xrTableCell_Nam;
    private XRTableCell xrTableCell5;
    private XRTableCell xrTableCell100;
    private XRTableRow xrTableRow3;
    private XRTableCell xrTableCell4;
    private XRTableCell xrTableCell_ngaySinh;
    private XRTableCell xrTableCell8;
    private XRTableCell xrTableCell_danToc;
    private XRTableCell xrTableCell10;
    private XRTableRow xrTableRow4;
    private XRTableCell xrTableCell9;
    private XRTableCell xrTableCell_nguyenQuan;
    private XRTableRow xrTableRow5;
    private XRTableCell xrTableCell11;
    private XRTableCell xrTableCell_noiCuTru;
    private XRTableRow xrTableRow6;
    private XRTableCell xrTableCell12;
    private XRTableCell xrTableCell13;
    private XRTableCell xrTableCell_soCMND;
    private XRTableCell xrTableCell_ngayCap;
    private XRTableCell xrTableCell23;
    private XRTableCell xrTableCell_noiCap;
    private XRTableRow xrTableRow7;
    private XRTableCell xrTableCell27;
    private XRTableCell xrTableCell_soHopDong;
    private XRTableCell xrTableCell_ngayThangNamHopDong;
    private XRTableCell xrTableCell32;
    private XRTableCell xrTableCell_ngayHopDong;
    private XRTableCell xrTableCell_thangHopDong;
    private XRTableCell xrTableCell40;
    private XRTableCell xrTableCell_101;
    private XRTableRow xrTableRow8;
    private XRTableCell xrTableCell45;
    private XRTableCell xrTableCell46;
    private XRTableCell xrTableCell_thangHopDong2;
    private XRTableCell xrTableCell48;
    private XRTableCell xrTableCell_namHopDong2;
    private XRTableCell xrTableCell50;
    private XRTableCell xrTableCell_loaiHopDong;
    private XRTableCell xrTableCell_ngayHopDong2;
    private XRTableRow xrTableRow9;
    private XRTableCell xrTableCell51;
    private XRTableCell xrTableCell_chucDanhNghe;
    private XRTableRow xrTableRow10;
    private XRTableCell xrTableCell47;
    private XRTableCell xrTableCell_doVi;
    private XRTableRow xrTableRow11;
    private XRTableCell xrTableCell49;
    private XRTableCell xrTableCell_diaChi;
    private XRTableRow xrTableRow12;
    private XRTableCell xrTableCell52;
    private XRTableCell xrTableCell_noiKhamBenh;
    private XRTableRow xrTableRow13;
    private XRTableCell xrTableCell56;
    private XRTableCell xrTableCell57;
    private XRTableCell xrTableCell64;
    private XRTableCell xrTableCell69;
    private XRTableRow xrTableRow14;
    private XRTableCell xrTableCell70;
    private XRLabel xrLabel7;
    private XRLabel xrLabel8;
    private XRLabel xrLabel9;
    private XRTable xrTable3;
    private XRTableRow xrTableRow15;
    private XRTableCell xrTableCell71;
    private XRTableCell xrTableCell72;
    private XRTableCell xrTableCell73;
    private XRTableRow xrTableRow16;
    private XRTableCell xrTableCell74;
    private XRTableCell xrTableCell75;
    private XRTableCell xrTableCell76;
    private XRTableCell xrTableCell77;
    private XRTableCell xrTableCell78;
    private XRTableCell xrTableCell79;
    private XRTableCell xrTableCell80;
    private XRTableCell xrTableCell81;
    private XRTableCell xrTableCell83;
    private XRLabel xrLabel10;
    private XRTableCell xrTableCell_NLDBHXH;
    private XRTableCell xrTableCellNSDLDBHXH;
    private XRTableCell xrTableCell_NLDBHYT;
    private XRTableCell xrTableCell_NSDBHYT;
    private XRTableCell xrTableCell_NLDBHTN;
    private XRTableCell xrTableCellNSDBHTN;
    private XRLabel xrLabel11;
    private XRLabel xrLabel12;
    private XRLabel xrLabel_ngayThangNamKhai;
    private XRLabel xrLabel13;
    private XRLabel xrLabel14;
    private XRTableCell xrTableCell_Nu;
    private XRTableCell xrTableCell_namHopDong;
    private XRLabel xrLabel_soSo;
	/// <summary>
	/// Required designer variable.
	/// </summary>
	private System.ComponentModel.IContainer components = null;

	public XtraReport_BH_NhanVien()
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
        string resourceFileName = "XtraReport_BH_NhanVien.resx";
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell_STT = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_tuNgay = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_denNgay = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_donVi = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_tienLuong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_phuCap = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_NLDBHXH = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCellNSDLDBHXH = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_NLDBHYT = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_NSDBHYT = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_NLDBHTN = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCellNSDBHTN = new DevExpress.XtraReports.UI.XRTableCell();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.xrTable3 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow16 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell74 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell75 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell76 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell77 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow15 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell71 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell79 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell72 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell80 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell73 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell81 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell78 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell83 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrTable2 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow2 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_hoTen = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_Nam = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell5 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell100 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow3 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_ngaySinh = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell8 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_danToc = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell10 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow4 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell9 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_nguyenQuan = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow5 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell11 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_noiCuTru = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow6 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell12 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_soCMND = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell13 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_ngayCap = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell23 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_noiCap = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow7 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell27 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_soHopDong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_ngayThangNamHopDong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_ngayHopDong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell32 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_thangHopDong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell40 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_101 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow8 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell45 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_ngayHopDong2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell46 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_thangHopDong2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell48 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_namHopDong2 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell50 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_loaiHopDong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell64 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow9 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell51 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_chucDanhNghe = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow10 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell47 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_doVi = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow11 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell49 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_diaChi = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow12 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell52 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_noiKhamBenh = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow13 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell56 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell57 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell69 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow14 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell70 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel_ngayThangNamKhai = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrTableCell_Nu = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell_namHopDong = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrLabel_soSo = new DevExpress.XtraReports.UI.XRLabel();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable3)).BeginInit();
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
        this.xrTable1.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
        this.xrTable1.Name = "xrTable1";
        this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow1});
        this.xrTable1.SizeF = new System.Drawing.SizeF(1071F, 25F);
        this.xrTable1.StylePriority.UseBorders = false;
        // 
        // xrTableRow1
        // 
        this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell_STT,
            this.xrTableCell_tuNgay,
            this.xrTableCell_denNgay,
            this.xrTableCell_donVi,
            this.xrTableCell_tienLuong,
            this.xrTableCell_phuCap,
            this.xrTableCell_NLDBHXH,
            this.xrTableCellNSDLDBHXH,
            this.xrTableCell_NLDBHYT,
            this.xrTableCell_NSDBHYT,
            this.xrTableCell_NLDBHTN,
            this.xrTableCellNSDBHTN});
        this.xrTableRow1.Name = "xrTableRow1";
        this.xrTableRow1.Weight = 1;
        // 
        // xrTableCell_STT
        // 
        this.xrTableCell_STT.Name = "xrTableCell_STT";
        this.xrTableCell_STT.StylePriority.UseTextAlignment = false;
        this.xrTableCell_STT.Text = "STT";
        this.xrTableCell_STT.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_STT.Weight = 0.31284748020920383;
        // 
        // xrTableCell_tuNgay
        // 
        this.xrTableCell_tuNgay.Name = "xrTableCell_tuNgay";
        this.xrTableCell_tuNgay.Text = "xrTableCell_tuNgay";
        this.xrTableCell_tuNgay.Weight = 0.59994725350204126;
        // 
        // xrTableCell_denNgay
        // 
        this.xrTableCell_denNgay.Name = "xrTableCell_denNgay";
        this.xrTableCell_denNgay.Text = "xrTableCell_denNgay";
        this.xrTableCell_denNgay.Weight = 0.59994724578074543;
        // 
        // xrTableCell_donVi
        // 
        this.xrTableCell_donVi.Name = "xrTableCell_donVi";
        this.xrTableCell_donVi.Text = "xrTableCell_donVi";
        this.xrTableCell_donVi.Weight = 1.2227913143723055;
        // 
        // xrTableCell_tienLuong
        // 
        this.xrTableCell_tienLuong.Name = "xrTableCell_tienLuong";
        this.xrTableCell_tienLuong.Text = "xrTableCell_tienLuong";
        this.xrTableCell_tienLuong.Weight = 0.48497582113199778;
        // 
        // xrTableCell_phuCap
        // 
        this.xrTableCell_phuCap.Name = "xrTableCell_phuCap";
        this.xrTableCell_phuCap.Text = "xrTableCell_phuCap";
        this.xrTableCell_phuCap.Weight = 0.60498778561285327;
        // 
        // xrTableCell_NLDBHXH
        // 
        this.xrTableCell_NLDBHXH.Name = "xrTableCell_NLDBHXH";
        this.xrTableCell_NLDBHXH.Text = "xrTableCell_NLDBHXH";
        this.xrTableCell_NLDBHXH.Weight = 0.5087472082946467;
        // 
        // xrTableCellNSDLDBHXH
        // 
        this.xrTableCellNSDLDBHXH.Name = "xrTableCellNSDLDBHXH";
        this.xrTableCellNSDLDBHXH.Text = "xrTableCellNSDLDBHXH";
        this.xrTableCellNSDLDBHXH.Weight = 0.46821377796719821;
        // 
        // xrTableCell_NLDBHYT
        // 
        this.xrTableCell_NLDBHYT.Name = "xrTableCell_NLDBHYT";
        this.xrTableCell_NLDBHYT.Text = "xrTableCell_NLDBHYT";
        this.xrTableCell_NLDBHYT.Weight = 0.40574477426868011;
        // 
        // xrTableCell_NSDBHYT
        // 
        this.xrTableCell_NSDBHYT.Name = "xrTableCell_NSDBHYT";
        this.xrTableCell_NSDBHYT.Text = "xrTableCell_NSDBHYT";
        this.xrTableCell_NSDBHYT.Weight = 0.40574477386266961;
        // 
        // xrTableCell_NLDBHTN
        // 
        this.xrTableCell_NLDBHTN.Name = "xrTableCell_NLDBHTN";
        this.xrTableCell_NLDBHTN.Text = "xrTableCell_NLDBHTN";
        this.xrTableCell_NLDBHTN.Weight = 0.40574422439148072;
        // 
        // xrTableCellNSDBHTN
        // 
        this.xrTableCellNSDBHTN.Name = "xrTableCellNSDBHTN";
        this.xrTableCellNSDBHTN.Text = "xrTableCellNSDBHTN";
        this.xrTableCellNSDBHTN.Weight = 0.40574422439148072;
        // 
        // TopMargin
        // 
        this.TopMargin.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel_soSo,
            this.xrTable3,
            this.xrLabel9,
            this.xrLabel8,
            this.xrLabel7,
            this.xrTable2,
            this.xrLabel6,
            this.xrLabel5,
            this.xrLabel4,
            this.xrLabel3,
            this.xrLabel2,
            this.xrLabel1,
            this.xrLabel10});
        this.TopMargin.HeightF = 682.0001F;
        this.TopMargin.Name = "TopMargin";
        this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        this.TopMargin.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.TopMargin_BeforePrint);
        // 
        // xrTable3
        // 
        this.xrTable3.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTable3.LocationFloat = new DevExpress.Utils.PointFloat(455.9622F, 595.0001F);
        this.xrTable3.Name = "xrTable3";
        this.xrTable3.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow16,
            this.xrTableRow15});
        this.xrTable3.SizeF = new System.Drawing.SizeF(615.0377F, 86.99994F);
        this.xrTable3.StylePriority.UseBorders = false;
        // 
        // xrTableRow16
        // 
        this.xrTableRow16.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell74,
            this.xrTableCell75,
            this.xrTableCell76,
            this.xrTableCell77});
        this.xrTableRow16.Name = "xrTableRow16";
        this.xrTableRow16.Weight = 1;
        // 
        // xrTableCell74
        // 
        this.xrTableCell74.Name = "xrTableCell74";
        this.xrTableCell74.StylePriority.UseTextAlignment = false;
        this.xrTableCell74.Text = "Căn cứ đóng BHXH - BHYT";
        this.xrTableCell74.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell74.Weight = 0.858258744304783;
        // 
        // xrTableCell75
        // 
        this.xrTableCell75.Name = "xrTableCell75";
        this.xrTableCell75.StylePriority.UseTextAlignment = false;
        this.xrTableCell75.Text = "Tiền lương đóng BHXH";
        this.xrTableCell75.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell75.Weight = 0.76927717528079931;
        // 
        // xrTableCell76
        // 
        this.xrTableCell76.Name = "xrTableCell76";
        this.xrTableCell76.StylePriority.UseTextAlignment = false;
        this.xrTableCell76.Text = "Tiền lương đóng BHYT";
        this.xrTableCell76.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell76.Weight = 0.638981925358993;
        // 
        // xrTableCell77
        // 
        this.xrTableCell77.Name = "xrTableCell77";
        this.xrTableCell77.StylePriority.UseTextAlignment = false;
        this.xrTableCell77.Text = "Tiền lương đóng BHTN";
        this.xrTableCell77.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell77.Weight = 0.638981925358993;
        // 
        // xrTableRow15
        // 
        this.xrTableRow15.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell71,
            this.xrTableCell79,
            this.xrTableCell72,
            this.xrTableCell80,
            this.xrTableCell73,
            this.xrTableCell81,
            this.xrTableCell78,
            this.xrTableCell83});
        this.xrTableRow15.Name = "xrTableRow15";
        this.xrTableRow15.Weight = 1;
        // 
        // xrTableCell71
        // 
        this.xrTableCell71.Name = "xrTableCell71";
        this.xrTableCell71.StylePriority.UseTextAlignment = false;
        this.xrTableCell71.Text = "Tiền lương, tiền công";
        this.xrTableCell71.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell71.Weight = 0.38187912727931389;
        // 
        // xrTableCell79
        // 
        this.xrTableCell79.Name = "xrTableCell79";
        this.xrTableCell79.StylePriority.UseTextAlignment = false;
        this.xrTableCell79.Text = "Phụ cấp chức vụ";
        this.xrTableCell79.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell79.Weight = 0.47637935697574574;
        // 
        // xrTableCell72
        // 
        this.xrTableCell72.Name = "xrTableCell72";
        this.xrTableCell72.StylePriority.UseTextAlignment = false;
        this.xrTableCell72.Text = "NLĐ";
        this.xrTableCell72.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell72.Weight = 0.40059725953772796;
        // 
        // xrTableCell80
        // 
        this.xrTableCell80.Name = "xrTableCell80";
        this.xrTableCell80.StylePriority.UseTextAlignment = false;
        this.xrTableCell80.Text = "NSDLĐ";
        this.xrTableCell80.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell80.Weight = 0.36868017579279466;
        // 
        // xrTableCell73
        // 
        this.xrTableCell73.Name = "xrTableCell73";
        this.xrTableCell73.StylePriority.UseTextAlignment = false;
        this.xrTableCell73.Text = "NLĐ";
        this.xrTableCell73.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell73.Weight = 0.31949117893162227;
        // 
        // xrTableCell81
        // 
        this.xrTableCell81.Name = "xrTableCell81";
        this.xrTableCell81.StylePriority.UseTextAlignment = false;
        this.xrTableCell81.Text = "NSDLĐ";
        this.xrTableCell81.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell81.Weight = 0.31949117893162227;
        // 
        // xrTableCell78
        // 
        this.xrTableCell78.Name = "xrTableCell78";
        this.xrTableCell78.StylePriority.UseTextAlignment = false;
        this.xrTableCell78.Text = "NLĐ";
        this.xrTableCell78.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell78.Weight = 0.31949074642737074;
        // 
        // xrTableCell83
        // 
        this.xrTableCell83.Name = "xrTableCell83";
        this.xrTableCell83.StylePriority.UseTextAlignment = false;
        this.xrTableCell83.Text = "NSDLĐ";
        this.xrTableCell83.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell83.Weight = 0.31949074642737074;
        // 
        // xrLabel9
        // 
        this.xrLabel9.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(252.1458F, 595.0001F);
        this.xrLabel9.Multiline = true;
        this.xrLabel9.Name = "xrLabel9";
        this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel9.SizeF = new System.Drawing.SizeF(203.8164F, 86.99994F);
        this.xrLabel9.StylePriority.UseBorders = false;
        this.xrLabel9.StylePriority.UseTextAlignment = false;
        this.xrLabel9.Text = "Cấp bậc, chức vụ, chức danh nghề, công việc, nơi làm việc (tên cơ quan, đơn vị, đ" +
            "ịa chỉ)";
        this.xrLabel9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel8
        // 
        this.xrLabel8.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(152.1458F, 595.0001F);
        this.xrLabel8.Multiline = true;
        this.xrLabel8.Name = "xrLabel8";
        this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 15, 0, 100F);
        this.xrLabel8.SizeF = new System.Drawing.SizeF(100F, 86.99994F);
        this.xrLabel8.StylePriority.UseBorders = false;
        this.xrLabel8.StylePriority.UsePadding = false;
        this.xrLabel8.StylePriority.UseTextAlignment = false;
        this.xrLabel8.Text = "Đến\r\ntháng/ năm";
        this.xrLabel8.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel7
        // 
        this.xrLabel7.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(52.14582F, 595.0001F);
        this.xrLabel7.Multiline = true;
        this.xrLabel7.Name = "xrLabel7";
        this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 15, 0, 100F);
        this.xrLabel7.SizeF = new System.Drawing.SizeF(100F, 86.99994F);
        this.xrLabel7.StylePriority.UseBorders = false;
        this.xrLabel7.StylePriority.UsePadding = false;
        this.xrLabel7.StylePriority.UseTextAlignment = false;
        this.xrLabel7.Text = "Từ\r\ntháng/ năm";
        this.xrLabel7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrTable2
        // 
        this.xrTable2.LocationFloat = new DevExpress.Utils.PointFloat(21.45829F, 271.9166F);
        this.xrTable2.Name = "xrTable2";
        this.xrTable2.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 1, 1, 100F);
        this.xrTable2.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow2,
            this.xrTableRow3,
            this.xrTableRow4,
            this.xrTableRow5,
            this.xrTableRow6,
            this.xrTableRow7,
            this.xrTableRow8,
            this.xrTableRow9,
            this.xrTableRow10,
            this.xrTableRow11,
            this.xrTableRow12,
            this.xrTableRow13,
            this.xrTableRow14});
        this.xrTable2.SizeF = new System.Drawing.SizeF(1071F, 304.1667F);
        this.xrTable2.StylePriority.UsePadding = false;
        // 
        // xrTableRow2
        // 
        this.xrTableRow2.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell_hoTen,
            this.xrTableCell3,
            this.xrTableCell_Nam,
            this.xrTableCell5,
            this.xrTableCell_Nu,
            this.xrTableCell100});
        this.xrTableRow2.Name = "xrTableRow2";
        this.xrTableRow2.Weight = 1;
        // 
        // xrTableCell1
        // 
        this.xrTableCell1.Name = "xrTableCell1";
        this.xrTableCell1.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.xrTableCell1.StylePriority.UsePadding = false;
        this.xrTableCell1.Text = "1. Họ và tên: ";
        this.xrTableCell1.Weight = 0.94791663466064946;
        // 
        // xrTableCell_hoTen
        // 
        this.xrTableCell_hoTen.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrTableCell_hoTen.Name = "xrTableCell_hoTen";
        this.xrTableCell_hoTen.StylePriority.UseFont = false;
        this.xrTableCell_hoTen.StylePriority.UseTextAlignment = false;
        this.xrTableCell_hoTen.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_hoTen.Weight = 1.7799996975359473;
        // 
        // xrTableCell3
        // 
        this.xrTableCell3.Name = "xrTableCell3";
        this.xrTableCell3.StylePriority.UseTextAlignment = false;
        this.xrTableCell3.Text = "Nam";
        this.xrTableCell3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell3.Weight = 0.59541736302884929;
        // 
        // xrTableCell_Nam
        // 
        this.xrTableCell_Nam.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrTableCell_Nam.Name = "xrTableCell_Nam";
        this.xrTableCell_Nam.StylePriority.UseBorders = false;
        this.xrTableCell_Nam.StylePriority.UseTextAlignment = false;
        this.xrTableCell_Nam.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_Nam.Weight = 0.6735414345696713;
        // 
        // xrTableCell5
        // 
        this.xrTableCell5.Name = "xrTableCell5";
        this.xrTableCell5.StylePriority.UseTextAlignment = false;
        this.xrTableCell5.Text = "Nữ";
        this.xrTableCell5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell5.Weight = 0.36270838103417247;
        // 
        // xrTableCell100
        // 
        this.xrTableCell100.Name = "xrTableCell100";
        this.xrTableCell100.Weight = 5.6920136407174633;
        // 
        // xrTableRow3
        // 
        this.xrTableRow3.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell4,
            this.xrTableCell_ngaySinh,
            this.xrTableCell8,
            this.xrTableCell_danToc,
            this.xrTableCell10});
        this.xrTableRow3.Name = "xrTableRow3";
        this.xrTableRow3.Weight = 1;
        // 
        // xrTableCell4
        // 
        this.xrTableCell4.Name = "xrTableCell4";
        this.xrTableCell4.Text = "2. Ngày, tháng, năm sinh: ";
        this.xrTableCell4.Weight = 1.4448069694338908;
        // 
        // xrTableCell_ngaySinh
        // 
        this.xrTableCell_ngaySinh.Name = "xrTableCell_ngaySinh";
        this.xrTableCell_ngaySinh.StylePriority.UseTextAlignment = false;
        this.xrTableCell_ngaySinh.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_ngaySinh.Weight = 0.90292535246230909;
        // 
        // xrTableCell8
        // 
        this.xrTableCell8.Name = "xrTableCell8";
        this.xrTableCell8.Text = "Dân tộc:";
        this.xrTableCell8.Weight = 0.52406354234958341;
        // 
        // xrTableCell_danToc
        // 
        this.xrTableCell_danToc.Name = "xrTableCell_danToc";
        this.xrTableCell_danToc.StylePriority.UseTextAlignment = false;
        this.xrTableCell_danToc.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_danToc.Weight = 0.74752467882876783;
        // 
        // xrTableCell10
        // 
        this.xrTableCell10.Name = "xrTableCell10";
        this.xrTableCell10.Text = ";Quốc tịch: Việt Nam";
        this.xrTableCell10.Weight = 5.2721050357210233;
        // 
        // xrTableRow4
        // 
        this.xrTableRow4.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell9,
            this.xrTableCell_nguyenQuan});
        this.xrTableRow4.Name = "xrTableRow4";
        this.xrTableRow4.Weight = 1;
        // 
        // xrTableCell9
        // 
        this.xrTableCell9.Name = "xrTableCell9";
        this.xrTableCell9.Text = "3. Nguyên quán:";
        this.xrTableCell9.Weight = 0.97254314371163786;
        // 
        // xrTableCell_nguyenQuan
        // 
        this.xrTableCell_nguyenQuan.Name = "xrTableCell_nguyenQuan";
        this.xrTableCell_nguyenQuan.Weight = 7.918882435083936;
        // 
        // xrTableRow5
        // 
        this.xrTableRow5.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell11,
            this.xrTableCell_noiCuTru});
        this.xrTableRow5.Name = "xrTableRow5";
        this.xrTableRow5.Weight = 1;
        // 
        // xrTableCell11
        // 
        this.xrTableCell11.Name = "xrTableCell11";
        this.xrTableCell11.Text = "4. Nơi cư trú (nơi thường trú hoặc tạm trú):";
        this.xrTableCell11.Weight = 2.4307518330274931;
        // 
        // xrTableCell_noiCuTru
        // 
        this.xrTableCell_noiCuTru.Name = "xrTableCell_noiCuTru";
        this.xrTableCell_noiCuTru.Weight = 6.46067374576808;
        // 
        // xrTableRow6
        // 
        this.xrTableRow6.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell12,
            this.xrTableCell_soCMND,
            this.xrTableCell13,
            this.xrTableCell_ngayCap,
            this.xrTableCell23,
            this.xrTableCell_noiCap});
        this.xrTableRow6.Name = "xrTableRow6";
        this.xrTableRow6.Weight = 1;
        // 
        // xrTableCell12
        // 
        this.xrTableCell12.Name = "xrTableCell12";
        this.xrTableCell12.Text = "5. Số chứng minh thư:";
        this.xrTableCell12.Weight = 1.3148265113744202;
        // 
        // xrTableCell_soCMND
        // 
        this.xrTableCell_soCMND.Name = "xrTableCell_soCMND";
        this.xrTableCell_soCMND.StylePriority.UseTextAlignment = false;
        this.xrTableCell_soCMND.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_soCMND.Weight = 0.69200504117183415;
        // 
        // xrTableCell13
        // 
        this.xrTableCell13.Name = "xrTableCell13";
        this.xrTableCell13.Text = "Ngày cấp:";
        this.xrTableCell13.Weight = 0.61417433836751933;
        // 
        // xrTableCell_ngayCap
        // 
        this.xrTableCell_ngayCap.Name = "xrTableCell_ngayCap";
        this.xrTableCell_ngayCap.StylePriority.UseTextAlignment = false;
        this.xrTableCell_ngayCap.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_ngayCap.Weight = 0.87381582234689015;
        // 
        // xrTableCell23
        // 
        this.xrTableCell23.Name = "xrTableCell23";
        this.xrTableCell23.Text = "Nơi cấp:";
        this.xrTableCell23.Weight = 0.55032139463203023;
        // 
        // xrTableCell_noiCap
        // 
        this.xrTableCell_noiCap.Name = "xrTableCell_noiCap";
        this.xrTableCell_noiCap.Weight = 4.84628247090288;
        // 
        // xrTableRow7
        // 
        this.xrTableRow7.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell27,
            this.xrTableCell_soHopDong,
            this.xrTableCell_ngayThangNamHopDong,
            this.xrTableCell_ngayHopDong,
            this.xrTableCell32,
            this.xrTableCell_thangHopDong,
            this.xrTableCell40,
            this.xrTableCell_namHopDong,
            this.xrTableCell_101});
        this.xrTableRow7.Name = "xrTableRow7";
        this.xrTableRow7.Weight = 1;
        // 
        // xrTableCell27
        // 
        this.xrTableCell27.Name = "xrTableCell27";
        this.xrTableCell27.Text = "6. Hợp đồng lao động (hoặc hợp đồng làm việc) số: ";
        this.xrTableCell27.Weight = 2.8717955987302735;
        // 
        // xrTableCell_soHopDong
        // 
        this.xrTableCell_soHopDong.Name = "xrTableCell_soHopDong";
        this.xrTableCell_soHopDong.StylePriority.UseTextAlignment = false;
        this.xrTableCell_soHopDong.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_soHopDong.Weight = 0.96527873502397443;
        // 
        // xrTableCell_ngayThangNamHopDong
        // 
        this.xrTableCell_ngayThangNamHopDong.Name = "xrTableCell_ngayThangNamHopDong";
        this.xrTableCell_ngayThangNamHopDong.StylePriority.UseTextAlignment = false;
        this.xrTableCell_ngayThangNamHopDong.Text = "ngày";
        this.xrTableCell_ngayThangNamHopDong.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_ngayThangNamHopDong.Weight = 0.44127296731673071;
        // 
        // xrTableCell_ngayHopDong
        // 
        this.xrTableCell_ngayHopDong.Name = "xrTableCell_ngayHopDong";
        this.xrTableCell_ngayHopDong.StylePriority.UseTextAlignment = false;
        this.xrTableCell_ngayHopDong.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_ngayHopDong.Weight = 0.26578663590055185;
        // 
        // xrTableCell32
        // 
        this.xrTableCell32.Name = "xrTableCell32";
        this.xrTableCell32.StylePriority.UseTextAlignment = false;
        this.xrTableCell32.Text = "tháng";
        this.xrTableCell32.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell32.Weight = 0.4038501782412286;
        // 
        // xrTableCell_thangHopDong
        // 
        this.xrTableCell_thangHopDong.Name = "xrTableCell_thangHopDong";
        this.xrTableCell_thangHopDong.StylePriority.UseTextAlignment = false;
        this.xrTableCell_thangHopDong.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_thangHopDong.Weight = 0.2603014864509936;
        // 
        // xrTableCell40
        // 
        this.xrTableCell40.Name = "xrTableCell40";
        this.xrTableCell40.StylePriority.UseTextAlignment = false;
        this.xrTableCell40.Text = "năm";
        this.xrTableCell40.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell40.Weight = 0.30267686893982843;
        // 
        // xrTableCell_101
        // 
        this.xrTableCell_101.Name = "xrTableCell_101";
        this.xrTableCell_101.Text = "có hiệu lực";
        this.xrTableCell_101.Weight = 3.0719073660143321;
        // 
        // xrTableRow8
        // 
        this.xrTableRow8.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell45,
            this.xrTableCell_ngayHopDong2,
            this.xrTableCell46,
            this.xrTableCell_thangHopDong2,
            this.xrTableCell48,
            this.xrTableCell_namHopDong2,
            this.xrTableCell50,
            this.xrTableCell_loaiHopDong,
            this.xrTableCell64});
        this.xrTableRow8.Name = "xrTableRow8";
        this.xrTableRow8.Weight = 1;
        // 
        // xrTableCell45
        // 
        this.xrTableCell45.Name = "xrTableCell45";
        this.xrTableCell45.Text = "từ ngày";
        this.xrTableCell45.Weight = 0.50192432127350761;
        // 
        // xrTableCell_ngayHopDong2
        // 
        this.xrTableCell_ngayHopDong2.Name = "xrTableCell_ngayHopDong2";
        this.xrTableCell_ngayHopDong2.StylePriority.UseTextAlignment = false;
        this.xrTableCell_ngayHopDong2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_ngayHopDong2.Weight = 0.28503487977610908;
        // 
        // xrTableCell46
        // 
        this.xrTableCell46.Name = "xrTableCell46";
        this.xrTableCell46.StylePriority.UseTextAlignment = false;
        this.xrTableCell46.Text = "tháng";
        this.xrTableCell46.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell46.Weight = 0.40126229448883022;
        // 
        // xrTableCell_thangHopDong2
        // 
        this.xrTableCell_thangHopDong2.Name = "xrTableCell_thangHopDong2";
        this.xrTableCell_thangHopDong2.StylePriority.UseTextAlignment = false;
        this.xrTableCell_thangHopDong2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_thangHopDong2.Weight = 0.25658522878246504;
        // 
        // xrTableCell48
        // 
        this.xrTableCell48.Name = "xrTableCell48";
        this.xrTableCell48.StylePriority.UseTextAlignment = false;
        this.xrTableCell48.Text = "năm";
        this.xrTableCell48.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell48.Weight = 0.3579344825659293;
        // 
        // xrTableCell_namHopDong2
        // 
        this.xrTableCell_namHopDong2.Name = "xrTableCell_namHopDong2";
        this.xrTableCell_namHopDong2.StylePriority.UseTextAlignment = false;
        this.xrTableCell_namHopDong2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_namHopDong2.Weight = 0.36857360709475839;
        // 
        // xrTableCell50
        // 
        this.xrTableCell50.Name = "xrTableCell50";
        this.xrTableCell50.Text = "Loại hợp đồng:";
        this.xrTableCell50.Weight = 0.91183604405553731;
        // 
        // xrTableCell_loaiHopDong
        // 
        this.xrTableCell_loaiHopDong.Name = "xrTableCell_loaiHopDong";
        this.xrTableCell_loaiHopDong.Weight = 2.4278116019705429;
        // 
        // xrTableCell64
        // 
        this.xrTableCell64.Name = "xrTableCell64";
        this.xrTableCell64.Weight = 3.3804631187878948;
        // 
        // xrTableRow9
        // 
        this.xrTableRow9.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell51,
            this.xrTableCell_chucDanhNghe});
        this.xrTableRow9.Name = "xrTableRow9";
        this.xrTableRow9.Weight = 1;
        // 
        // xrTableCell51
        // 
        this.xrTableCell51.Name = "xrTableCell51";
        this.xrTableCell51.Text = "7. Chức vụ, chức danh nghề:";
        this.xrTableCell51.Weight = 1.6465607525523491;
        // 
        // xrTableCell_chucDanhNghe
        // 
        this.xrTableCell_chucDanhNghe.Name = "xrTableCell_chucDanhNghe";
        this.xrTableCell_chucDanhNghe.Weight = 7.2448648262432247;
        // 
        // xrTableRow10
        // 
        this.xrTableRow10.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell47,
            this.xrTableCell_doVi});
        this.xrTableRow10.Name = "xrTableRow10";
        this.xrTableRow10.Weight = 1;
        // 
        // xrTableCell47
        // 
        this.xrTableCell47.Name = "xrTableCell47";
        this.xrTableCell47.Text = "8. Cơ quan, đơn vị:";
        this.xrTableCell47.Weight = 1.1882216256566389;
        // 
        // xrTableCell_doVi
        // 
        this.xrTableCell_doVi.Name = "xrTableCell_doVi";
        this.xrTableCell_doVi.Weight = 7.7032039531389351;
        // 
        // xrTableRow11
        // 
        this.xrTableRow11.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell49,
            this.xrTableCell_diaChi});
        this.xrTableRow11.Name = "xrTableRow11";
        this.xrTableRow11.Weight = 1;
        // 
        // xrTableCell49
        // 
        this.xrTableCell49.Name = "xrTableCell49";
        this.xrTableCell49.Text = "9. Địa chỉ:";
        this.xrTableCell49.Weight = 0.66588851192230714;
        // 
        // xrTableCell_diaChi
        // 
        this.xrTableCell_diaChi.Name = "xrTableCell_diaChi";
        this.xrTableCell_diaChi.Weight = 8.2255370668732652;
        // 
        // xrTableRow12
        // 
        this.xrTableRow12.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell52,
            this.xrTableCell_noiKhamBenh});
        this.xrTableRow12.Name = "xrTableRow12";
        this.xrTableRow12.Weight = 1;
        // 
        // xrTableCell52
        // 
        this.xrTableCell52.Name = "xrTableCell52";
        this.xrTableCell52.Text = "10. Nơi đăng ký khám chữa bệnh ban đầu:";
        this.xrTableCell52.Weight = 2.4307518646970552;
        // 
        // xrTableCell_noiKhamBenh
        // 
        this.xrTableCell_noiKhamBenh.Name = "xrTableCell_noiKhamBenh";
        this.xrTableCell_noiKhamBenh.Weight = 6.4606737140985171;
        // 
        // xrTableRow13
        // 
        this.xrTableRow13.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell56,
            this.xrTableCell57,
            this.xrTableCell69});
        this.xrTableRow13.Name = "xrTableRow13";
        this.xrTableRow13.Weight = 1;
        // 
        // xrTableCell56
        // 
        this.xrTableCell56.Name = "xrTableCell56";
        this.xrTableCell56.Text = "11. Đối tượng hưởng BHYT mức";
        this.xrTableCell56.Weight = 2.0068317242999374;
        // 
        // xrTableCell57
        // 
        this.xrTableCell57.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrTableCell57.Name = "xrTableCell57";
        this.xrTableCell57.StylePriority.UseBorders = false;
        this.xrTableCell57.Weight = 0.86496363381448926;
        // 
        // xrTableCell69
        // 
        this.xrTableCell69.Name = "xrTableCell69";
        this.xrTableCell69.Weight = 6.0196302206811447;
        // 
        // xrTableRow14
        // 
        this.xrTableRow14.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell70});
        this.xrTableRow14.Name = "xrTableRow14";
        this.xrTableRow14.Weight = 1;
        // 
        // xrTableCell70
        // 
        this.xrTableCell70.Name = "xrTableCell70";
        this.xrTableCell70.Text = "12. Quá trình đóng, chưa hưởng BHXH một lần và BH thất nghiệp:";
        this.xrTableCell70.Weight = 8.8914255787955714;
        // 
        // xrLabel6
        // 
        this.xrLabel6.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))));
        this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(0F, 248.9166F);
        this.xrLabel6.Name = "xrLabel6";
        this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel6.SizeF = new System.Drawing.SizeF(181.6667F, 22.99998F);
        this.xrLabel6.StylePriority.UseFont = false;
        this.xrLabel6.Text = "A. NGƯỜI LAO ĐỘNG";
        // 
        // xrLabel5
        // 
        this.xrLabel5.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Underline);
        this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(523.0209F, 33.00001F);
        this.xrLabel5.Name = "xrLabel5";
        this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel5.SizeF = new System.Drawing.SizeF(368.6458F, 23F);
        this.xrLabel5.StylePriority.UseFont = false;
        this.xrLabel5.StylePriority.UseTextAlignment = false;
        this.xrLabel5.Text = "Độc lập - Tự do - Hạnh phúc";
        this.xrLabel5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel4
        // 
        this.xrLabel4.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(523.0209F, 10.00001F);
        this.xrLabel4.Name = "xrLabel4";
        this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel4.SizeF = new System.Drawing.SizeF(368.6458F, 23F);
        this.xrLabel4.StylePriority.UseFont = false;
        this.xrLabel4.StylePriority.UseTextAlignment = false;
        this.xrLabel4.Text = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
        this.xrLabel4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel3
        // 
        this.xrLabel3.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Underline);
        this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(208.75F, 80.04169F);
        this.xrLabel3.Name = "xrLabel3";
        this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel3.SizeF = new System.Drawing.SizeF(303.1249F, 23F);
        this.xrLabel3.StylePriority.UseFont = false;
        this.xrLabel3.StylePriority.UseTextAlignment = false;
        this.xrLabel3.Text = "VIỄN THÔNG ĐẮK LẮK - ĐẮK NÔNG";
        this.xrLabel3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel2
        // 
        this.xrLabel2.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(208.75F, 9.99999F);
        this.xrLabel2.Multiline = true;
        this.xrLabel2.Name = "xrLabel2";
        this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel2.SizeF = new System.Drawing.SizeF(303.0209F, 70.04169F);
        this.xrLabel2.StylePriority.UseFont = false;
        this.xrLabel2.StylePriority.UseTextAlignment = false;
        this.xrLabel2.Text = "TẬP ĐOÀN\r\nBƯU CHÍNH VIỄN THÔNG\r\nVIỆT NAM";
        this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel1
        // 
        this.xrLabel1.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(208.75F, 121.7917F);
        this.xrLabel1.Multiline = true;
        this.xrLabel1.Name = "xrLabel1";
        this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1.SizeF = new System.Drawing.SizeF(682.9167F, 54.24999F);
        this.xrLabel1.StylePriority.UseFont = false;
        this.xrLabel1.StylePriority.UseTextAlignment = false;
        this.xrLabel1.Text = "TỜ KHAI\r\nTHAM GIA BẢO HIỂM XÃ HỘI, BẢO HIỂM Y TẾ, BẢO HIỂM THẤT NGHIỆP";
        this.xrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel10
        // 
        this.xrLabel10.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(0F, 595.0001F);
        this.xrLabel10.Name = "xrLabel10";
        this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 25, 0, 100F);
        this.xrLabel10.SizeF = new System.Drawing.SizeF(52.14582F, 86.99994F);
        this.xrLabel10.StylePriority.UseBorders = false;
        this.xrLabel10.StylePriority.UsePadding = false;
        this.xrLabel10.StylePriority.UseTextAlignment = false;
        this.xrLabel10.Text = "STT";
        this.xrLabel10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // BottomMargin
        // 
        this.BottomMargin.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel14,
            this.xrLabel13,
            this.xrLabel_ngayThangNamKhai,
            this.xrLabel12,
            this.xrLabel11});
        this.BottomMargin.HeightF = 153F;
        this.BottomMargin.Name = "BottomMargin";
        this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        this.BottomMargin.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.BottomMargin_BeforePrint);
        // 
        // xrLabel14
        // 
        this.xrLabel14.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Italic);
        this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(649.1251F, 113.9584F);
        this.xrLabel14.Name = "xrLabel14";
        this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel14.SizeF = new System.Drawing.SizeF(354.2449F, 23.00002F);
        this.xrLabel14.StylePriority.UseFont = false;
        this.xrLabel14.StylePriority.UseTextAlignment = false;
        this.xrLabel14.Text = "(Ký ghi rõ họ tên)";
        this.xrLabel14.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel13
        // 
        this.xrLabel13.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(649.1251F, 90.95834F);
        this.xrLabel13.Name = "xrLabel13";
        this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel13.SizeF = new System.Drawing.SizeF(354.2449F, 23.00002F);
        this.xrLabel13.StylePriority.UseFont = false;
        this.xrLabel13.StylePriority.UseTextAlignment = false;
        this.xrLabel13.Text = "Người khai";
        this.xrLabel13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel_ngayThangNamKhai
        // 
        this.xrLabel_ngayThangNamKhai.LocationFloat = new DevExpress.Utils.PointFloat(649.1251F, 67.00001F);
        this.xrLabel_ngayThangNamKhai.Name = "xrLabel_ngayThangNamKhai";
        this.xrLabel_ngayThangNamKhai.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel_ngayThangNamKhai.SizeF = new System.Drawing.SizeF(354.2449F, 23.00002F);
        this.xrLabel_ngayThangNamKhai.StylePriority.UseTextAlignment = false;
        this.xrLabel_ngayThangNamKhai.Text = "xrLabel_ngayThangNamKhai";
        this.xrLabel_ngayThangNamKhai.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel12
        // 
        this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(152.1458F, 26.00002F);
        this.xrLabel12.Name = "xrLabel12";
        this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel12.SizeF = new System.Drawing.SizeF(918.8541F, 23.00002F);
        this.xrLabel12.Text = "Những nội dung kê khai trên là hoàn toàn đúng sự thật, nếu sai tôi xin chịu trách" +
            " nhiệm trước pháp luật.";
        // 
        // xrLabel11
        // 
        this.xrLabel11.Font = new System.Drawing.Font("Times New Roman", 12F, ((System.Drawing.FontStyle)(((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic)
                        | System.Drawing.FontStyle.Underline))));
        this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(80.9583F, 26.00002F);
        this.xrLabel11.Name = "xrLabel11";
        this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel11.SizeF = new System.Drawing.SizeF(71.18752F, 23.00002F);
        this.xrLabel11.StylePriority.UseFont = false;
        this.xrLabel11.Text = "Cam kết:";
        // 
        // xrTableCell_Nu
        // 
        this.xrTableCell_Nu.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrTableCell_Nu.Name = "xrTableCell_Nu";
        this.xrTableCell_Nu.StylePriority.UseBorders = false;
        this.xrTableCell_Nu.StylePriority.UseTextAlignment = false;
        this.xrTableCell_Nu.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_Nu.Weight = 0.65840106442970192;
        // 
        // xrTableCell_namHopDong
        // 
        this.xrTableCell_namHopDong.Name = "xrTableCell_namHopDong";
        this.xrTableCell_namHopDong.StylePriority.UseTextAlignment = false;
        this.xrTableCell_namHopDong.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_namHopDong.Weight = 0.30855574217766035;
        // 
        // xrLabel_soSo
        // 
        this.xrLabel_soSo.Font = new System.Drawing.Font("Times New Roman", 12F, System.Drawing.FontStyle.Bold);
        this.xrLabel_soSo.LocationFloat = new DevExpress.Utils.PointFloat(208.75F, 198.9584F);
        this.xrLabel_soSo.Name = "xrLabel_soSo";
        this.xrLabel_soSo.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 96F);
        this.xrLabel_soSo.SizeF = new System.Drawing.SizeF(682.9167F, 23F);
        this.xrLabel_soSo.StylePriority.UseFont = false;
        this.xrLabel_soSo.StylePriority.UseTextAlignment = false;
        this.xrLabel_soSo.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // XtraReport_BH_NhanVien
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Font = new System.Drawing.Font("Times New Roman", 12F);
        this.Landscape = true;
        this.Margins = new System.Drawing.Printing.Margins(50, 3, 682, 153);
        this.PageHeight = 827;
        this.PageWidth = 1169;
        this.PaperKind = System.Drawing.Printing.PaperKind.A4;
        this.Version = "10.1";
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable3)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}

	#endregion

    private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        xrTableCell_STT.DataBindings.Add("Text", DataSource, "STT");
        xrTableCell_tuNgay.DataBindings.Add("Text", DataSource, "tuNgay");
        xrTableCell_denNgay.DataBindings.Add("Text", DataSource, "denNgay");
        xrTableCell_donVi.DataBindings.Add("Text", DataSource, "chucVu_DonVi");        
        xrTableCell_tienLuong.DataBindings.Add("Text", DataSource, "tienLuong");
        xrTableCell_phuCap.DataBindings.Add("Text", DataSource, "phuCapCV");
        xrTableCell_NLDBHXH.DataBindings.Add("Text", DataSource, "NLD_BHXH");
        xrTableCellNSDLDBHXH.DataBindings.Add("Text", DataSource, "NSDLD_BHXH");
        xrTableCell_NLDBHYT.DataBindings.Add("Text", DataSource, "NLD_BHYT");
        xrTableCell_NSDBHYT.DataBindings.Add("Text", DataSource, "NSDLD_BHYT");
        xrTableCell_NLDBHTN.DataBindings.Add("Text", DataSource, "NLD_BHTN");
        xrTableCellNSDBHTN.DataBindings.Add("Text", DataSource, "NLD_BHTN");
        
    }

    private void TopMargin_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        xrLabel_soSo.Text = maSo;
        xrTableCell_hoTen.Text = hoTen;
        xrTableCell_Nam.Text = nam;
        xrTableCell100.Text = nu;
        xrTableCell_ngaySinh.Text = ngaySinh;
        xrTableCell_danToc.Text = danToc;
        xrTableCell_nguyenQuan.Text = nguyenQuan;
        xrTableCell_noiCuTru.Text = noiCuTru;
        xrTableCell_soCMND.Text = soCMND;
        xrTableCell_ngayCap.Text = ngayCap;
        xrTableCell_noiCap.Text = noicap;
        xrTableCell_soHopDong.Text = soHopDong;
        xrTableCell_ngayHopDong.Text = ngayHD1;
        xrTableCell_thangHopDong.Text = thangHD1;
        xrTableCell_namHopDong.Text = namHD1;
        xrTableCell_ngayHopDong2.Text = ngayHD2;
        xrTableCell_thangHopDong2.Text = thangHD2;
        xrTableCell_namHopDong2.Text = namHD2;
        xrTableCell_loaiHopDong.Text = loaiHD;
        xrTableCell_chucDanhNghe.Text = chucVu;
        xrTableCell_doVi.Text = donVi;
        xrTableCell_diaChi.Text = diaChi;
        xrTableCell_noiKhamBenh.Text = noiKhamBenh;
    }

    private void BottomMargin_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        xrLabel_ngayThangNamKhai.Text = "Đắk Lắk, Ngày " + DateTime.Now.Day + " tháng " + DateTime.Now.Month + " năm " + DateTime.Now.Year;
    }
}
