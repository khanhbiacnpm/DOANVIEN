using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

/// <summary>
/// Summary description for XtraReportDSBaoHiem
/// </summary>
public class XtraReportDSBaoHiem : DevExpress.XtraReports.UI.XtraReport
{
    public string ngayThongKe = "";
	private DevExpress.XtraReports.UI.DetailBand Detail;
	private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRTable xrTable2;
    private XRTableRow xrTableRow2;
    private XRTableCell xrTableCell_STT;
    private XRTableCell xrTableCell20;
    private XRTableCell xrTableCell21;
    private XRTableCell xrTableCell22;
    private XRTableCell xrTableCell23;
    private XRTableCell xrTableCell24;
    private XRTableCell xrTableCell25;
    private XRTableCell xrTableCell26;
    private XRTableCell xrTableCell27;
    private XRTableCell xrTableCell28;
    private XRTableCell xrTableCell29;
    private XRTableCell xrTableCell30;
    private XRTableCell xrTableCell31;
    private XRTableCell xrTableCell32;
    private XRTableCell xrTableCell33;
    private XRTableCell xrTableCell34;
    private XRTableCell xrTableCell35;
    private XRTable xrTable1;
    private XRTableRow xrTableRow1;
    private XRTableCell xrTableCell1;
    private XRTableCell xrTableCell3;
    private XRTableCell xrTableCell4;
    private XRTableCell xrTableCell5;
    private XRTableCell xrTableCell7;
    private XRTableCell xrTableCell9;
    private XRTableCell xrTableCell10;
    private XRTableCell xrTableCell11;
    private XRTableCell xrTableCell12;
    private XRTableCell xrTableCell13;
    private XRTableCell xrTableCell14;
    private XRTableCell xrTableCell15;
    private XRTableCell xrTableCell16;
    private XRTableCell xrTableCell17;
    private XRTableRow xrTableRow3;
    private XRTableCell xrTableCell45;
    private XRTableCell xrTableCell47;
    private XRTableCell xrTableCell49;
    private XRTableCell xrTableCell50;
    private XRTableCell xrTableCell41;
    private XRTableCell xrTableCell43;
    private XRTableCell xrTableCell18;
    private XRTableCell xrTableCell36;
    private XRTableCell xrTableCell19;
    private XRTableCell xrTableCell8;
    private XRTableCell xrTableCell37;
    private XRTableCell xrTableCell38;
    private XRTableCell xrTableCell39;
    private XRTableCell xrTableCell40;
    private XRTableCell xrTableCell42;
    private XRTableCell xrTableCell44;
    private XRLabel xrLabel1;
    private XRLabel xrLabel2;
    private XRLabel xrLabel3;
    private XRLabel xrLabel4;
    private XRLabel xrLabel5;
    private XRLabel xrLabel6;
    private XRLabel xrLabel7;
    private XRLabel xrLabel8;
    private XRLabel xrLabel9;
    private XRLabel xrLabel10;
    private XRLabel xrLabel11;
    private XRLabel xrLabel12;
    private XRLabel xrLabel13;
    private XRLabel xrLabel14;
    private XRLabel xrLabel15;
    private XRLabel xrLabel16;
    private XRLabel xrLabel_NgayThangNam;

	private System.ComponentModel.IContainer components = null;

	public XtraReportDSBaoHiem()
	{
		InitializeComponent();		
	}
	protected override void Dispose(bool disposing) {
		if (disposing && (components != null)) {
			components.Dispose();
		}
		base.Dispose(disposing);
	}

	#region Designer generated code
	private void InitializeComponent() {
        string resourceFileName = "XtraReportDSBaoHiem.resx";
        this.Detail = new DevExpress.XtraReports.UI.DetailBand();
        this.xrTable2 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow2 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell_STT = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell20 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell21 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell22 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell23 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell24 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell25 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell26 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell27 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell28 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell29 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell30 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell31 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell32 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell33 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell34 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell35 = new DevExpress.XtraReports.UI.XRTableCell();
        this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
        this.xrTable1 = new DevExpress.XtraReports.UI.XRTable();
        this.xrTableRow3 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell41 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrTableCell42 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell40 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell39 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell38 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell8 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell36 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell18 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell43 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell45 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell47 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell49 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell50 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableRow1 = new DevExpress.XtraReports.UI.XRTableRow();
        this.xrTableCell1 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell44 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell3 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell4 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell5 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell37 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell7 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell19 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell9 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell10 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell11 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell12 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell13 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell14 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell15 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell16 = new DevExpress.XtraReports.UI.XRTableCell();
        this.xrTableCell17 = new DevExpress.XtraReports.UI.XRTableCell();
        this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
        this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel4 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel5 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel6 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel7 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel8 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel10 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel11 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel12 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel13 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel14 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel15 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel16 = new DevExpress.XtraReports.UI.XRLabel();
        this.xrLabel_NgayThangNam = new DevExpress.XtraReports.UI.XRLabel();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).BeginInit();
        ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
        // 
        // Detail
        // 
        this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrTable2});
        this.Detail.HeightF = 26F;
        this.Detail.Name = "Detail";
        this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        this.Detail.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.Detail_BeforePrint);
        // 
        // xrTable2
        // 
        this.xrTable2.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTable2.LocationFloat = new DevExpress.Utils.PointFloat(0F, 0F);
        this.xrTable2.Name = "xrTable2";
        this.xrTable2.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow2});
        this.xrTable2.SizeF = new System.Drawing.SizeF(1624F, 25F);
        this.xrTable2.StylePriority.UseBorders = false;
        // 
        // xrTableRow2
        // 
        this.xrTableRow2.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell_STT,
            this.xrTableCell20,
            this.xrTableCell21,
            this.xrTableCell22,
            this.xrTableCell23,
            this.xrTableCell24,
            this.xrTableCell25,
            this.xrTableCell26,
            this.xrTableCell27,
            this.xrTableCell28,
            this.xrTableCell29,
            this.xrTableCell30,
            this.xrTableCell31,
            this.xrTableCell32,
            this.xrTableCell33,
            this.xrTableCell34,
            this.xrTableCell35});
        this.xrTableRow2.Name = "xrTableRow2";
        this.xrTableRow2.Weight = 1;
        // 
        // xrTableCell_STT
        // 
        this.xrTableCell_STT.Name = "xrTableCell_STT";
        this.xrTableCell_STT.StylePriority.UseTextAlignment = false;
        this.xrTableCell_STT.Text = "xrTableCell_STT";
        this.xrTableCell_STT.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell_STT.Weight = 5.2499084825148952;
        // 
        // xrTableCell20
        // 
        this.xrTableCell20.Name = "xrTableCell20";
        this.xrTableCell20.Text = "xrTableCell_hoTen";
        this.xrTableCell20.Weight = 23.342375501458896;
        // 
        // xrTableCell21
        // 
        this.xrTableCell21.Name = "xrTableCell21";
        this.xrTableCell21.StylePriority.UseTextAlignment = false;
        this.xrTableCell21.Text = "xrTableCell_soBHXH";
        this.xrTableCell21.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell21.Weight = 10.762587460469845;
        // 
        // xrTableCell22
        // 
        this.xrTableCell22.Name = "xrTableCell22";
        this.xrTableCell22.Text = "xrTableCell_ngaySinh";
        this.xrTableCell22.Weight = 10.762965952617938;
        // 
        // xrTableCell23
        // 
        this.xrTableCell23.Name = "xrTableCell23";
        this.xrTableCell23.StylePriority.UseTextAlignment = false;
        this.xrTableCell23.Text = "xrTableCell_gioiTinh";
        this.xrTableCell23.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell23.Weight = 8.2130281557806928;
        // 
        // xrTableCell24
        // 
        this.xrTableCell24.Name = "xrTableCell24";
        this.xrTableCell24.StylePriority.UseTextAlignment = false;
        this.xrTableCell24.Text = "xrTableCell_soCMND";
        this.xrTableCell24.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell24.Weight = 12.098663240526777;
        // 
        // xrTableCell25
        // 
        this.xrTableCell25.Name = "xrTableCell25";
        this.xrTableCell25.Text = "xrTableCell_tenTT";
        this.xrTableCell25.Weight = 21.205595123919533;
        // 
        // xrTableCell26
        // 
        this.xrTableCell26.Name = "xrTableCell26";
        this.xrTableCell26.Text = "xrTableCell_noiKhamBenh";
        this.xrTableCell26.Weight = 18.169952941489022;
        // 
        // xrTableCell27
        // 
        this.xrTableCell27.Name = "xrTableCell27";
        this.xrTableCell27.StylePriority.UseTextAlignment = false;
        this.xrTableCell27.Text = "xrTableCell_tienLuong";
        this.xrTableCell27.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell27.Weight = 8.4558794592271127;
        // 
        // xrTableCell28
        // 
        this.xrTableCell28.Name = "xrTableCell28";
        this.xrTableCell28.StylePriority.UseTextAlignment = false;
        this.xrTableCell28.Text = "xrTableCell_phuCapCV";
        this.xrTableCell28.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell28.Weight = 9.7915696323343084;
        // 
        // xrTableCell29
        // 
        this.xrTableCell29.Name = "xrTableCell29";
        this.xrTableCell29.StylePriority.UseTextAlignment = false;
        this.xrTableCell29.Text = "xrTableCell_nldBHXH";
        this.xrTableCell29.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell29.Weight = 8.5773077790009467;
        // 
        // xrTableCell30
        // 
        this.xrTableCell30.Name = "xrTableCell30";
        this.xrTableCell30.StylePriority.UseTextAlignment = false;
        this.xrTableCell30.Text = "xrTableCell_nsdldBHXH";
        this.xrTableCell30.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell30.Weight = 7.9701875245367475;
        // 
        // xrTableCell31
        // 
        this.xrTableCell31.Name = "xrTableCell31";
        this.xrTableCell31.StylePriority.UseTextAlignment = false;
        this.xrTableCell31.Text = "xrTableCell_nldBHYT";
        this.xrTableCell31.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell31.Weight = 8.9415553856137748;
        // 
        // xrTableCell32
        // 
        this.xrTableCell32.Name = "xrTableCell32";
        this.xrTableCell32.StylePriority.UseTextAlignment = false;
        this.xrTableCell32.Text = "xrTableCell_nsdldBHYT";
        this.xrTableCell32.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell32.Weight = 9.4272828943123983;
        // 
        // xrTableCell33
        // 
        this.xrTableCell33.Name = "xrTableCell33";
        this.xrTableCell33.StylePriority.UseTextAlignment = false;
        this.xrTableCell33.Text = "xrTableCell_nldBHTN";
        this.xrTableCell33.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell33.Weight = 9.06301927939586;
        // 
        // xrTableCell34
        // 
        this.xrTableCell34.Name = "xrTableCell34";
        this.xrTableCell34.StylePriority.UseTextAlignment = false;
        this.xrTableCell34.Text = "xrTableCell_nsdldBHTN";
        this.xrTableCell34.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell34.Weight = 8.0916069508085116;
        // 
        // xrTableCell35
        // 
        this.xrTableCell35.Name = "xrTableCell35";
        this.xrTableCell35.Text = "xrTableCell_ngayDongBH";
        this.xrTableCell35.Weight = 9.1844244760643257;
        // 
        // TopMargin
        // 
        this.TopMargin.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel_NgayThangNam,
            this.xrLabel16,
            this.xrLabel15,
            this.xrLabel14,
            this.xrLabel13,
            this.xrLabel12,
            this.xrLabel11,
            this.xrLabel10,
            this.xrTable1});
        this.TopMargin.HeightF = 239F;
        this.TopMargin.Name = "TopMargin";
        this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
        this.TopMargin.BeforePrint += new System.Drawing.Printing.PrintEventHandler(this.TopMargin_BeforePrint);
        // 
        // xrTable1
        // 
        this.xrTable1.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTable1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 189F);
        this.xrTable1.Name = "xrTable1";
        this.xrTable1.Rows.AddRange(new DevExpress.XtraReports.UI.XRTableRow[] {
            this.xrTableRow3,
            this.xrTableRow1});
        this.xrTable1.SizeF = new System.Drawing.SizeF(1624F, 50F);
        this.xrTable1.StylePriority.UseBorders = false;
        // 
        // xrTableRow3
        // 
        this.xrTableRow3.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell41,
            this.xrTableCell42,
            this.xrTableCell40,
            this.xrTableCell39,
            this.xrTableCell38,
            this.xrTableCell8,
            this.xrTableCell36,
            this.xrTableCell18,
            this.xrTableCell43,
            this.xrTableCell45,
            this.xrTableCell47,
            this.xrTableCell49,
            this.xrTableCell50});
        this.xrTableRow3.Name = "xrTableRow3";
        this.xrTableRow3.Weight = 1;
        // 
        // xrTableCell41
        // 
        this.xrTableCell41.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell41.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel1});
        this.xrTableCell41.Name = "xrTableCell41";
        this.xrTableCell41.StylePriority.UseBorders = false;
        this.xrTableCell41.Weight = 5.2499084818686548;
        // 
        // xrLabel1
        // 
        this.xrLabel1.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(0F, 16.99999F);
        this.xrLabel1.Name = "xrLabel1";
        this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel1.SizeF = new System.Drawing.SizeF(34.62029F, 23F);
        this.xrLabel1.StylePriority.UseBorders = false;
        this.xrLabel1.Text = "STT";
        // 
        // xrTableCell42
        // 
        this.xrTableCell42.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell42.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel2});
        this.xrTableCell42.Name = "xrTableCell42";
        this.xrTableCell42.StylePriority.UseBorders = false;
        this.xrTableCell42.Weight = 23.342374962254521;
        // 
        // xrTableCell40
        // 
        this.xrTableCell40.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell40.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel3});
        this.xrTableCell40.Name = "xrTableCell40";
        this.xrTableCell40.StylePriority.UseBorders = false;
        this.xrTableCell40.Weight = 10.762590507273083;
        // 
        // xrTableCell39
        // 
        this.xrTableCell39.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell39.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel4});
        this.xrTableCell39.Name = "xrTableCell39";
        this.xrTableCell39.StylePriority.UseBorders = false;
        this.xrTableCell39.Weight = 10.762958510492446;
        // 
        // xrTableCell38
        // 
        this.xrTableCell38.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell38.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel5});
        this.xrTableCell38.Name = "xrTableCell38";
        this.xrTableCell38.StylePriority.UseBorders = false;
        this.xrTableCell38.Weight = 8.21303189967575;
        // 
        // xrTableCell8
        // 
        this.xrTableCell8.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell8.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel6});
        this.xrTableCell8.Name = "xrTableCell8";
        this.xrTableCell8.StylePriority.UseBorders = false;
        this.xrTableCell8.Weight = 12.098670680108597;
        // 
        // xrTableCell36
        // 
        this.xrTableCell36.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell36.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel7});
        this.xrTableCell36.Name = "xrTableCell36";
        this.xrTableCell36.StylePriority.UseBorders = false;
        this.xrTableCell36.Weight = 21.20557615956703;
        // 
        // xrTableCell18
        // 
        this.xrTableCell18.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell18.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel8});
        this.xrTableCell18.Name = "xrTableCell18";
        this.xrTableCell18.StylePriority.UseBorders = false;
        this.xrTableCell18.Weight = 18.16996565753751;
        // 
        // xrTableCell43
        // 
        this.xrTableCell43.Name = "xrTableCell43";
        this.xrTableCell43.StylePriority.UseTextAlignment = false;
        this.xrTableCell43.Text = "Căn cứ đóng BHXH - BHYT";
        this.xrTableCell43.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell43.Weight = 18.247449091561421;
        // 
        // xrTableCell45
        // 
        this.xrTableCell45.Name = "xrTableCell45";
        this.xrTableCell45.StylePriority.UseTextAlignment = false;
        this.xrTableCell45.Text = "Tiền lương đóng BHXH";
        this.xrTableCell45.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell45.Weight = 16.547495303537694;
        // 
        // xrTableCell47
        // 
        this.xrTableCell47.Name = "xrTableCell47";
        this.xrTableCell47.StylePriority.UseTextAlignment = false;
        this.xrTableCell47.Text = "Tiền lương đóng BHYT";
        this.xrTableCell47.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell47.Weight = 18.368838279926173;
        // 
        // xrTableCell49
        // 
        this.xrTableCell49.Name = "xrTableCell49";
        this.xrTableCell49.StylePriority.UseTextAlignment = false;
        this.xrTableCell49.Text = "Tiền lương đóng BHTN";
        this.xrTableCell49.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell49.Weight = 17.154626230204371;
        // 
        // xrTableCell50
        // 
        this.xrTableCell50.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top)
                    | DevExpress.XtraPrinting.BorderSide.Right)));
        this.xrTableCell50.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel9});
        this.xrTableCell50.Name = "xrTableCell50";
        this.xrTableCell50.StylePriority.UseBorders = false;
        this.xrTableCell50.Weight = 9.1844244760643257;
        // 
        // xrTableRow1
        // 
        this.xrTableRow1.Cells.AddRange(new DevExpress.XtraReports.UI.XRTableCell[] {
            this.xrTableCell1,
            this.xrTableCell44,
            this.xrTableCell3,
            this.xrTableCell4,
            this.xrTableCell5,
            this.xrTableCell37,
            this.xrTableCell7,
            this.xrTableCell19,
            this.xrTableCell9,
            this.xrTableCell10,
            this.xrTableCell11,
            this.xrTableCell12,
            this.xrTableCell13,
            this.xrTableCell14,
            this.xrTableCell15,
            this.xrTableCell16,
            this.xrTableCell17});
        this.xrTableRow1.Name = "xrTableRow1";
        this.xrTableRow1.Weight = 1;
        // 
        // xrTableCell1
        // 
        this.xrTableCell1.Borders = ((DevExpress.XtraPrinting.BorderSide)(((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Right)
                    | DevExpress.XtraPrinting.BorderSide.Bottom)));
        this.xrTableCell1.Name = "xrTableCell1";
        this.xrTableCell1.StylePriority.UseBorders = false;
        this.xrTableCell1.StylePriority.UseTextAlignment = false;
        this.xrTableCell1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell1.Weight = 5.2499089271899981;
        // 
        // xrTableCell44
        // 
        this.xrTableCell44.Name = "xrTableCell44";
        this.xrTableCell44.Weight = 23.342375056783794;
        // 
        // xrTableCell3
        // 
        this.xrTableCell3.Name = "xrTableCell3";
        this.xrTableCell3.StylePriority.UseTextAlignment = false;
        this.xrTableCell3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell3.Weight = 10.762587460469845;
        // 
        // xrTableCell4
        // 
        this.xrTableCell4.Name = "xrTableCell4";
        this.xrTableCell4.StylePriority.UseTextAlignment = false;
        this.xrTableCell4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell4.Weight = 10.762965952617938;
        // 
        // xrTableCell5
        // 
        this.xrTableCell5.Name = "xrTableCell5";
        this.xrTableCell5.StylePriority.UseTextAlignment = false;
        this.xrTableCell5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell5.Weight = 8.2130281557806928;
        // 
        // xrTableCell37
        // 
        this.xrTableCell37.Name = "xrTableCell37";
        this.xrTableCell37.Weight = 12.098663240526777;
        // 
        // xrTableCell7
        // 
        this.xrTableCell7.Name = "xrTableCell7";
        this.xrTableCell7.StylePriority.UseTextAlignment = false;
        this.xrTableCell7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell7.Weight = 21.205595123919533;
        // 
        // xrTableCell19
        // 
        this.xrTableCell19.Name = "xrTableCell19";
        this.xrTableCell19.StylePriority.UseTextAlignment = false;
        this.xrTableCell19.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell19.Weight = 18.169952941489022;
        // 
        // xrTableCell9
        // 
        this.xrTableCell9.Name = "xrTableCell9";
        this.xrTableCell9.StylePriority.UseTextAlignment = false;
        this.xrTableCell9.Text = "Tiền lương, tiền công";
        this.xrTableCell9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell9.Weight = 8.4558794592271127;
        // 
        // xrTableCell10
        // 
        this.xrTableCell10.Name = "xrTableCell10";
        this.xrTableCell10.StylePriority.UseTextAlignment = false;
        this.xrTableCell10.Text = "Phụ cấp CV";
        this.xrTableCell10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell10.Weight = 9.7915696323343084;
        // 
        // xrTableCell11
        // 
        this.xrTableCell11.Name = "xrTableCell11";
        this.xrTableCell11.StylePriority.UseTextAlignment = false;
        this.xrTableCell11.Text = "NLĐ";
        this.xrTableCell11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell11.Weight = 8.5773077790009467;
        // 
        // xrTableCell12
        // 
        this.xrTableCell12.Name = "xrTableCell12";
        this.xrTableCell12.StylePriority.UseTextAlignment = false;
        this.xrTableCell12.Text = "NSDLĐ";
        this.xrTableCell12.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell12.Weight = 7.9701875245367475;
        // 
        // xrTableCell13
        // 
        this.xrTableCell13.Name = "xrTableCell13";
        this.xrTableCell13.StylePriority.UseTextAlignment = false;
        this.xrTableCell13.Text = "NLĐ";
        this.xrTableCell13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell13.Weight = 8.9415553856137748;
        // 
        // xrTableCell14
        // 
        this.xrTableCell14.Name = "xrTableCell14";
        this.xrTableCell14.StylePriority.UseTextAlignment = false;
        this.xrTableCell14.Text = "NSDLĐ";
        this.xrTableCell14.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell14.Weight = 9.4272828943123983;
        // 
        // xrTableCell15
        // 
        this.xrTableCell15.Name = "xrTableCell15";
        this.xrTableCell15.StylePriority.UseTextAlignment = false;
        this.xrTableCell15.Text = "NLĐ";
        this.xrTableCell15.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell15.Weight = 9.06301927939586;
        // 
        // xrTableCell16
        // 
        this.xrTableCell16.Name = "xrTableCell16";
        this.xrTableCell16.StylePriority.UseTextAlignment = false;
        this.xrTableCell16.Text = "NSDLĐ";
        this.xrTableCell16.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        this.xrTableCell16.Weight = 8.0916069508085116;
        // 
        // xrTableCell17
        // 
        this.xrTableCell17.Name = "xrTableCell17";
        this.xrTableCell17.StylePriority.UseBorders = false;
        this.xrTableCell17.Weight = 9.1844244760643257;
        // 
        // BottomMargin
        // 
        this.BottomMargin.HeightF = 109F;
        this.BottomMargin.Name = "BottomMargin";
        this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
        this.BottomMargin.StylePriority.UseTextAlignment = false;
        this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel2
        // 
        this.xrLabel2.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(22.67138F, 16.99999F);
        this.xrLabel2.Name = "xrLabel2";
        this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel2.SizeF = new System.Drawing.SizeF(161.7036F, 23F);
        this.xrLabel2.StylePriority.UseBorders = false;
        this.xrLabel2.StylePriority.UseTextAlignment = false;
        this.xrLabel2.Text = "Họ và tên";
        this.xrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel3
        // 
        this.xrLabel3.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(0F, 16.99999F);
        this.xrLabel3.Name = "xrLabel3";
        this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel3.SizeF = new System.Drawing.SizeF(82.32817F, 23F);
        this.xrLabel3.StylePriority.UseBorders = false;
        this.xrLabel3.Text = "Số sổ BHXH";
        // 
        // xrLabel4
        // 
        this.xrLabel4.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel4.LocationFloat = new DevExpress.Utils.PointFloat(3.051758E-05F, 16.99999F);
        this.xrLabel4.Name = "xrLabel4";
        this.xrLabel4.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel4.SizeF = new System.Drawing.SizeF(82.3313F, 23F);
        this.xrLabel4.StylePriority.UseBorders = false;
        this.xrLabel4.StylePriority.UseTextAlignment = false;
        this.xrLabel4.Text = "Ngày sinh";
        this.xrLabel4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel5
        // 
        this.xrLabel5.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel5.LocationFloat = new DevExpress.Utils.PointFloat(0F, 16.99999F);
        this.xrLabel5.Name = "xrLabel5";
        this.xrLabel5.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel5.SizeF = new System.Drawing.SizeF(60.03979F, 23F);
        this.xrLabel5.StylePriority.UseBorders = false;
        this.xrLabel5.StylePriority.UseTextAlignment = false;
        this.xrLabel5.Text = "Giới tính";
        this.xrLabel5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel6
        // 
        this.xrLabel6.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel6.LocationFloat = new DevExpress.Utils.PointFloat(0.0001220703F, 16.99999F);
        this.xrLabel6.Name = "xrLabel6";
        this.xrLabel6.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel6.SizeF = new System.Drawing.SizeF(93.37305F, 23F);
        this.xrLabel6.StylePriority.UseBorders = false;
        this.xrLabel6.StylePriority.UseTextAlignment = false;
        this.xrLabel6.Text = "Số CMND";
        this.xrLabel6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel7
        // 
        this.xrLabel7.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel7.LocationFloat = new DevExpress.Utils.PointFloat(0F, 16.99999F);
        this.xrLabel7.Name = "xrLabel7";
        this.xrLabel7.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel7.SizeF = new System.Drawing.SizeF(171.9146F, 23F);
        this.xrLabel7.StylePriority.UseBorders = false;
        this.xrLabel7.StylePriority.UseTextAlignment = false;
        this.xrLabel7.Text = "Địa chỉ";
        this.xrLabel7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel8
        // 
        this.xrLabel8.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel8.LocationFloat = new DevExpress.Utils.PointFloat(6.103516E-05F, 16.99999F);
        this.xrLabel8.Name = "xrLabel8";
        this.xrLabel8.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel8.SizeF = new System.Drawing.SizeF(145.8732F, 23F);
        this.xrLabel8.StylePriority.UseBorders = false;
        this.xrLabel8.StylePriority.UseTextAlignment = false;
        this.xrLabel8.Text = "Nơi ĐK KCB";
        this.xrLabel8.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel9
        // 
        this.xrLabel9.Borders = DevExpress.XtraPrinting.BorderSide.None;
        this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(0F, 10.00001F);
        this.xrLabel9.Name = "xrLabel9";
        this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel9.SizeF = new System.Drawing.SizeF(77.08362F, 30F);
        this.xrLabel9.StylePriority.UseBorders = false;
        this.xrLabel9.StylePriority.UseTextAlignment = false;
        this.xrLabel9.Text = "Đóng ngày, tháng, năm";
        this.xrLabel9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel10
        // 
        this.xrLabel10.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrLabel10.LocationFloat = new DevExpress.Utils.PointFloat(121.0786F, 10.00001F);
        this.xrLabel10.Name = "xrLabel10";
        this.xrLabel10.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 96F);
        this.xrLabel10.SizeF = new System.Drawing.SizeF(333.2381F, 23F);
        this.xrLabel10.StylePriority.UseFont = false;
        this.xrLabel10.StylePriority.UseTextAlignment = false;
        this.xrLabel10.Text = "TẬP ĐOÀN";
        this.xrLabel10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel11
        // 
        this.xrLabel11.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrLabel11.LocationFloat = new DevExpress.Utils.PointFloat(121.0786F, 33.00001F);
        this.xrLabel11.Name = "xrLabel11";
        this.xrLabel11.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel11.SizeF = new System.Drawing.SizeF(333.2381F, 23F);
        this.xrLabel11.StylePriority.UseFont = false;
        this.xrLabel11.StylePriority.UseTextAlignment = false;
        this.xrLabel11.Text = "BƯU CHÍNH VIỄN THÔNG VIỆT NAM";
        this.xrLabel11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel12
        // 
        this.xrLabel12.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrLabel12.LocationFloat = new DevExpress.Utils.PointFloat(121.0786F, 56.00001F);
        this.xrLabel12.Multiline = true;
        this.xrLabel12.Name = "xrLabel12";
        this.xrLabel12.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel12.SizeF = new System.Drawing.SizeF(333.2381F, 23F);
        this.xrLabel12.StylePriority.UseFont = false;
        this.xrLabel12.StylePriority.UseTextAlignment = false;
        this.xrLabel12.Text = "VIỄN THÔNG ĐẮK LẮK - ĐẮK NÔNG";
        this.xrLabel12.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel13
        // 
        this.xrLabel13.LocationFloat = new DevExpress.Utils.PointFloat(121.0786F, 79F);
        this.xrLabel13.Multiline = true;
        this.xrLabel13.Name = "xrLabel13";
        this.xrLabel13.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel13.SizeF = new System.Drawing.SizeF(333.2381F, 23F);
        this.xrLabel13.StylePriority.UseTextAlignment = false;
        this.xrLabel13.Text = "Địa chỉ: 06 Lê Duẩn, Tp.BMT - Đắk Lắk";
        this.xrLabel13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel14
        // 
        this.xrLabel14.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrLabel14.LocationFloat = new DevExpress.Utils.PointFloat(907.23F, 10.00001F);
        this.xrLabel14.Name = "xrLabel14";
        this.xrLabel14.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel14.SizeF = new System.Drawing.SizeF(438.4463F, 23F);
        this.xrLabel14.StylePriority.UseFont = false;
        this.xrLabel14.StylePriority.UseTextAlignment = false;
        this.xrLabel14.Text = "CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM";
        this.xrLabel14.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel15
        // 
        this.xrLabel15.LocationFloat = new DevExpress.Utils.PointFloat(907.23F, 33.00001F);
        this.xrLabel15.Name = "xrLabel15";
        this.xrLabel15.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel15.SizeF = new System.Drawing.SizeF(438.4463F, 23F);
        this.xrLabel15.StylePriority.UseTextAlignment = false;
        this.xrLabel15.Text = "Đọc lập - Tự do - Hạnh phúc";
        this.xrLabel15.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel16
        // 
        this.xrLabel16.Font = new System.Drawing.Font("Times New Roman", 9.75F, System.Drawing.FontStyle.Bold);
        this.xrLabel16.LocationFloat = new DevExpress.Utils.PointFloat(317.6467F, 126.6667F);
        this.xrLabel16.Name = "xrLabel16";
        this.xrLabel16.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel16.SizeF = new System.Drawing.SizeF(614.329F, 23F);
        this.xrLabel16.StylePriority.UseFont = false;
        this.xrLabel16.StylePriority.UseTextAlignment = false;
        this.xrLabel16.Text = "DANH SÁCH LAO ĐỘNG THAM GIA BẢO HIỂM XÃ HỘI VÀ Y TẾ";
        this.xrLabel16.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // xrLabel_NgayThangNam
        // 
        this.xrLabel_NgayThangNam.LocationFloat = new DevExpress.Utils.PointFloat(317.6467F, 149.6667F);
        this.xrLabel_NgayThangNam.Name = "xrLabel_NgayThangNam";
        this.xrLabel_NgayThangNam.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
        this.xrLabel_NgayThangNam.SizeF = new System.Drawing.SizeF(614.329F, 23F);
        this.xrLabel_NgayThangNam.StylePriority.UseTextAlignment = false;
        this.xrLabel_NgayThangNam.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
        // 
        // XtraReportDSBaoHiem
        // 
        this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin});
        this.Landscape = true;
        this.Margins = new System.Drawing.Printing.Margins(10, 10, 239, 109);
        this.PageHeight = 1169;
        this.PageWidth = 1654;
        this.PaperKind = System.Drawing.Printing.PaperKind.A3;
        this.Version = "10.1";
        ((System.ComponentModel.ISupportInitialize)(this.xrTable2)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this.xrTable1)).EndInit();
        ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

	}
	#endregion

    private void Detail_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {        
        xrTableCell_STT.DataBindings.Add("Text", DataSource, "STT");
        xrTableCell20.DataBindings.Add("Text", DataSource, "hoTen");
        xrTableCell21.DataBindings.Add("Text", DataSource, "soBHXH");
        xrTableCell22.DataBindings.Add("Text", DataSource, "ngaySinh");
        xrTableCell23.DataBindings.Add("Text", DataSource, "gioiTinh");
        xrTableCell24.DataBindings.Add("Text", DataSource, "soCMDN");        
        xrTableCell25.DataBindings.Add("Text", DataSource, "tenTT");
        xrTableCell26.DataBindings.Add("Text", DataSource, "noiKhamBenh");
        xrTableCell27.DataBindings.Add("Text", DataSource, "tienLuong");
        xrTableCell28.DataBindings.Add("Text", DataSource, "phuCapCV");
        xrTableCell29.DataBindings.Add("Text", DataSource, "NLD_BHXH");
        xrTableCell30.DataBindings.Add("Text", DataSource, "NSDLD_BHXH");
        xrTableCell31.DataBindings.Add("Text", DataSource, "NLD_BHYT");
        xrTableCell32.DataBindings.Add("Text", DataSource, "NSDLD_BHYT");
        xrTableCell33.DataBindings.Add("Text", DataSource, "NLD_BHTN");
        xrTableCell34.DataBindings.Add("Text", DataSource, "NLD_BHTN");
        xrTableCell35.DataBindings.Add("Text", DataSource, "ngayDongBHXH");
    }

    private void TopMargin_BeforePrint(object sender, System.Drawing.Printing.PrintEventArgs e)
    {
        xrLabel_NgayThangNam.Text = ngayThongKe;
    }
}
