using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using VNPT.Modules.Employees;
using DotNetNuke;
using DotNetNuke.Entities;
using DotNetNuke.Security;
using DotNetNuke.Common;
using DevExpress.Web.ASPxEditors;
using DotNetNuke.Entities.Modules;
using DevExpress.Web.ASPxTreeList;
using DevExpress.Web.ASPxHiddenField;
using DevExpress.Web.ASPxUploadControl;

using VNPT.Modules.Unit;
using System.Configuration;
using System.Text;
using Microsoft.ApplicationBlocks.Data;
using DevExpress.Web.ASPxSiteMapControl;
namespace DotNetNuke.Modules.NghiViec
{
    public partial class MHTC : PortalModuleBase, IActionable
    {
        SqlConnection conn = null;
        public int sodonvi = 0;
        private string strconn = ConfigurationManager.ConnectionStrings["DNNLocalConnectionString"].ConnectionString;

        VNPT.Modules.Employees.EmployeesInfo employees = new EmployeesInfo();
        VNPT.Modules.Employees.EmployeesController objEmployees = new EmployeesController();
        VNPT.Modules.Unit.UnitController objUnit = new VNPT.Modules.Unit.UnitController();
        VNPT.Modules.Position.PositionController objPosition = new VNPT.Modules.Position.PositionController();
        VNPT.Modules.WorkHistory.WorkHistoryController objHistory = new VNPT.Modules.WorkHistory.WorkHistoryController();
        
       protected void Page_Load(object sender, EventArgs e)
        {

            DataSet ds = SqlHelper.ExecuteDataset(strconn, "[SoDoToChuc_KQL]");
            DataSet ds1 = SqlHelper.ExecuteDataset(strconn, "[SoDoToChuc_DonViTrucThuoc]");
            
           
            BuildChartKQL(ds.Tables[0], ds.Tables[0].Rows.Count);
            BuildChartChucNang(ds1.Tables[0], ds1.Tables[0].Rows.Count);
           
            Drawing(ds.Tables[0], sodonvi);
            DinhBien();
         
        }
       private void DinhBien()
       {
           DataSet ds = SqlHelper.ExecuteDataset(strconn, "[dbo].[DinhBienLaoDong]");
           DataTable dtBGD = ds.Tables[0];
           DataTable dtKQl = ds.Tables[1];
           DataTable dtDonVi = ds.Tables[2];
           DataTable dtVTT = ds.Tables[3];
           lblKQL.Text = "Khối quản lý&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     " + "<span style='font-size:11pt;font-family:Times New Roman;color:#fbe706;'><b>Lao động  </b> TT/ĐB :" + dtKQl.Rows[0][0].ToString() + "</span>";

           lblDonViTrucThuoc.Text = "Đơn vị trực thuộc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;     " + "<span style='font-size:11pt;font-family:Times New Roman;color:#fbe706;'><b>Lao động  </b> TT/ĐB : " + dtDonVi.Rows[0][0].ToString() + "</span>";
           lblNode.Text += "<div style=\"height:40px;width:160px;\" class=\"node level0\">";

           //tr 1

           lblNode.Text += "Ban giám đốc<br/>" + "<span style='font-size:10pt;font-family:Times New Roman;color:#fbe706;'><b>Lao động  </b> TT/ĐB : " + dtBGD.Rows[0][0].ToString() + "</span>";

           lblNode.Text += @"</div>";
           lblVTT.Text = "<span style='font-size:11pt;font-family:Times New Roman;color:#0066b3;'><b>Viễn thông Đắk Lắk - Lao động  </b> TT/ĐB :" + dtVTT.Rows[0][0].ToString() + "</span>";
       }
       #region SoDoToChuc

       private void Drawing(DataTable dt,int sodv)
       {
           sodv = 2;
           int chieurong = (1100 / (sodv * 2));


           tochuc.Text += "<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
           tochuc.Text += "  <tr class=\"lines v\">";



           int k = 0;
           for (int i = 0; i < sodv * 2; i++)
           {
               k = i % 2;
               if (i == 0)
               {
                   tochuc.Text += "<td class=\"line left\" style=\"width:" + chieurong + "\">&nbsp;</td>";
               }
               else
               {
                   if (i == (sodv * 2) - 1)
                   {
                       tochuc.Text += "<td class=\"line  right\" style=\"width:" + chieurong + "\">&nbsp;</td>";
                   }
                   else
                   {
                       if (k == 0)
                       {
                           tochuc.Text += "<td class=\"line top left\" style=\"width:" + chieurong + "\">&nbsp;</td>";
                       }
                       else
                       {
                           tochuc.Text += "<td class=\"line top  right\" style=\"width:" + chieurong + "\">&nbsp;</td>";
                       }
                   }
               }


           }

           tochuc.Text += "</tr>";
           tochuc.Text += "</table>";
       }
       private void BuildChartKQL(DataTable dt, int sodv)
       {
          
           lblDonVi.Text += "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
           lblDonVi.Text += "<tr>";
           lblDonVi.Text += "<td class=\"nodexuongca\"></td>";
           lblDonVi.Text += "<td>";

          for(int i=0;i<sodv;i++)
           {
               lblDonVi.Text += "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";

                 lblDonVi.Text += "<tr style='height:2px;'><td colspan='2'></td></tr>";             
                   
                     lblDonVi.Text += "<tr>";
                   
                   lblDonVi.Text += "<td style='background-color: #0066b3;border-radius: 2px;padding: 3px;	border-width: 1px;width:148px;'>";
                   lblDonVi.Text += "<table   cellpadding=\"0\" cellspacing=\"0\">";
                   var list = objUnit.GetChildUnits(Int32.Parse(dt.Rows[i]["Id"].ToString()));
                   if (list.Count > 0)
                   {
                       lblDonVi.Text += "<tr>";
                       lblDonVi.Text += "<td align='left' style='width:160'>";
                       lblDonVi.Text += "<a style='cursor:pointer;font-size:10pt;color:#ffffff;' onclick='ShowMHTC(" + dt.Rows[i]["Id"].ToString() + ")'>" + dt.Rows[i]["Name"].ToString() + "</a>";                       
                       lblDonVi.Text += "</td>";

                       lblDonVi.Text += "<td align='left' style='width:120'>";                    
                       lblDonVi.Text += "<div style='font-size:9pt;font-family:Times New Roman;color:#fbe706;'><b>Lao động</b>  TT/ĐB : " + dt.Rows[i]["songuoi"].ToString() + "/" + dt.Rows[i]["dinhbien"].ToString() + "</div></div>";
                       lblDonVi.Text += "</td>";
                       lblDonVi.Text += "</tr>";
                   }
                   else
                   {
                       lblDonVi.Text += "<tr>";
                       lblDonVi.Text += "<td align='left' style='width:160'>";
                       lblDonVi.Text += "<font size='2' color='#ffffff'>" + dt.Rows[i]["Name"].ToString() + "</font>";
                       lblDonVi.Text += "</td>";

                       lblDonVi.Text += "<td align='left' style='width:120'>";
                       lblDonVi.Text += "<div style='font-size:9pt;font-family:Times New Roman;color:#fbe706;'><b>Lao động</b>  TT/ĐB : " + dt.Rows[i]["songuoi"].ToString() + "/" + dt.Rows[i]["dinhbienlaodong"].ToString() + "</div></div>";
                       lblDonVi.Text += "</td>";
                       lblDonVi.Text += "</tr>";
                   }
                   
                   lblDonVi.Text += "</table>";
                   lblDonVi.Text += "</td>";
                   lblDonVi.Text += "</tr>";
                   lblDonVi.Text += "</table>";

           }

          lblDonVi.Text += "</td>";
          lblDonVi.Text += "</tr>";
           lblDonVi.Text += "</table>";

       }
       private void BuildChartChucNang(DataTable dt, int sodv)
       {

           lblDonViChucNang.Text += "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
           lblDonViChucNang.Text += "<tr>";
           lblDonViChucNang.Text += "<td class=\"nodexuongca\"></td>";
           lblDonViChucNang.Text += "<td>";



           for (int i = 0; i < sodv; i++)
           {
               lblDonViChucNang.Text += "<table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
               lblDonViChucNang.Text += "<tr style='height:2px;'><td colspan='2'></td></tr>";
               lblDonViChucNang.Text += "<tr>";
               lblDonViChucNang.Text += "<td style='background-color: #0066b3;border-radius: 2px;padding: 3px;	border-width: 1px;width:148px;'>";
               lblDonViChucNang.Text += "<table  cellpadding=\"0\" cellspacing=\"0\">";
               var list = objUnit.GetChildUnits(Int32.Parse(dt.Rows[i]["Id"].ToString()));
               if (list.Count > 0)
               {
                   lblDonViChucNang.Text += "<tr>";
                   lblDonViChucNang.Text += "<td align='left' style='width:260;'>";
                   lblDonViChucNang.Text += "<a style='cursor:pointer;font-size:10pt;color:#ffffff;' onclick='ShowMHTC(" + dt.Rows[i]["Id"].ToString() + ")'>" + dt.Rows[i]["Name"].ToString() + "</a>";
                   lblDonViChucNang.Text += "</td>";
                 
                   lblDonViChucNang.Text += "<td align='left' style='font-size:9pt;font-family:Times New Roman;color:#fbe706;width:130px;'>";
                   lblDonViChucNang.Text += "<b>Lao động</b>  TT/ĐB : " + dt.Rows[i]["songuoi"].ToString() + "/" + dt.Rows[i]["dinhbien"].ToString() + "";
                   lblDonViChucNang.Text += "</td>";
                   lblDonViChucNang.Text += "</tr>";
               }
               //else
               //{
               //    lblDonViChucNang.Text += "<tr>";
               //    lblDonViChucNang.Text += "<td align='left' style='width:260;'>";
               //    lblDonViChucNang.Text += "<font size='2' color='#ffffff'>" + dt.Rows[i]["Name"].ToString() + "</font>";
               //    lblDonViChucNang.Text += "</td>";

               //    lblDonViChucNang.Text += "<td align='left' style='font-size:9pt;font-family:Times New Roman;color:#fbe706;width:130px;'>";
               //    lblDonViChucNang.Text += "<b>Lao động</b>  TT/ĐB : " + dt.Rows[i]["songuoi"].ToString() + "/" + dt.Rows[i]["dinhbien"].ToString() + "";
               //    lblDonViChucNang.Text += "</td>";
               //    lblDonViChucNang.Text += "</tr>";
               //}

               lblDonViChucNang.Text += "</table>";
               lblDonViChucNang.Text += "</td>";
               lblDonViChucNang.Text += "</tr>";
               lblDonViChucNang.Text += "</table>";

           }

           lblDonViChucNang.Text += "</td>";
           lblDonViChucNang.Text += "</tr>";
           lblDonViChucNang.Text += "</table>";

       }

     

       private void DrawingDonVi(int id)
       {
           DataSet ds = SqlHelper.ExecuteDataset(strconn, "[SoDoToChuc_DonVi]", id, 3);           
           int sodv = ds.Tables[0].Rows.Count;


           int chieurong = 360;


           lblDonVi_2.Text += "<table border=\"0\" width=\"100%\" cellpadding=\"0\" cellspacing=\"0\">";
           lblDonVi_2.Text += "  <tr class=\"lines v\">";



           int k = 0;
           for (int i = 0; i < sodv * 2; i++)
           {
               k = i % 2;
               if (i == 0)
               {
                   lblDonVi_2.Text += "<td class=\"line left\" style=\"width:" + chieurong + "\">&nbsp;</td>";
               }
               else
               {
                   if (i == (sodv * 2) - 1)
                   {
                       lblDonVi_2.Text += "<td class=\"line  right\" style=\"width:" + chieurong + "\">&nbsp;</td>";
                   }
                   else
                   {
                       if (k == 0)
                       {
                           lblDonVi_2.Text += "<td class=\"line top left\" style=\"width:" + chieurong + "\">&nbsp;</td>";
                       }
                       else
                       {
                           lblDonVi_2.Text += "<td class=\"line top  right\" style=\"width:" + chieurong + "\">&nbsp;</td>";
                       }
                   }
               }
           }

           lblDonVi_2.Text += "</tr>";
           lblDonVi_2.Text += "</table>";
       }
       private void BuildChartDonVi(int id)
       {
           DataSet ds = SqlHelper.ExecuteDataset(strconn, "[SoDoToChuc_DonVi]", id, 3);
           
           DataTable dt = ds.Tables[0];
           
           int sodv = dt.Rows.Count;
           
          


           lblDonVi_1.Text += "<div style=\"width:300px;height:25px;\" class=\"node level0\">";

           //tr 1
           lblDonVi_1.Text += objUnit.GetUnit(id).name;

           lblDonVi_1.Text += @"</div>";
           lblDonVi_3.Text += "<table width=\"650px\" cellpadding=\"0\" cellspacing=\"0\">";
           lblDonVi_3.Text += "<tr>";

           for (int i = 0; i < sodv; i++)
           {
               int w = 660;
               int chieurong = (w / sodv);
               lblDonVi_3.Text += "<td style='font-size:10pt;font-family:Times New Roman;color:#fbe706;'>";
               lblDonVi_3.Text += "<div style='width:" + chieurong + "'  class=\"node level1 node0 level1-node0 drama-title\">";
               lblDonVi_3.Text += "" + dt.Rows[i]["Name"].ToString() + "";
               lblDonVi_3.Text += "<br/><font color='#fbe706'> LĐTT/LĐĐB : " + dt.Rows[i]["songuoi"].ToString() + "/" + dt.Rows[i]["dinhbienlaodong"].ToString() + "</font>";
               lblDonVi_3.Text += "</div></td>";
           }          

           lblDonVi_3.Text += "</tr>";
           lblDonVi_3.Text += "</table>";

           
       }
       private void BuildChartDonViQuanLy(int id)       {
           
           DataSet ds1 = SqlHelper.ExecuteDataset(strconn, "[SoDoToChuc_DonVi]", id, 1);
         
           DataTable dt1 = ds1.Tables[0];
           int sodv1 = dt1.Rows.Count;

           lblDonVi_4.Text += "<table border=\"0\" width=\"350px\"  cellpadding=\"0\" cellspacing=\"0\">";
           lblDonVi_4.Text += "<tr style='height:80px;'>";
           if (dt1.Rows.Count > 0)
           {
               for (int l = 0; l < sodv1; l++)
               {
                   if (l == 0)
                   {
                       int w = 150;
                       int chieurong = (w / sodv1);
                       lblDonVi_4.Text += "<td style='padding:0px;'><table cellpadding='0' cellspacing='0' style='width:210px;' border='0'><tr style='height:20px;'><td>&nbsp;</td></tr>";
                       lblDonVi_4.Text += "<tr style='height:60px;'><td  style='border-top: 3px solid #000000;'>&nbsp;</td></tr>";
                       lblDonVi_4.Text += "</table></td>";
                       lblDonVi_4.Text += "<td style='font-size:10pt;font-family:Times New Roman;'>";
                       lblDonVi_4.Text += "<div style='height:40px; width:" + chieurong + "'  class=\"node level1 node0 level1-node0 drama-title\">";
                       lblDonVi_4.Text += dt1.Rows[l]["Name"].ToString();
                       lblDonVi_4.Text += "<br/><font color='#fbe706'>LĐTT/LĐĐB : " + dt1.Rows[l]["songuoi"].ToString() + "/" + dt1.Rows[l]["dinhbienlaodong"].ToString() + "</font>";
                       lblDonVi_4.Text += "</div></td>";
                   }
               }

           }
           
           lblDonVi_4.Text += "</tr>";
           lblDonVi_4.Text += "</table>";


           DataSet ds2 = SqlHelper.ExecuteDataset(strconn, "[SoDoToChuc_DonVi]", id, 2);

           DataTable dt2 = ds2.Tables[0];

           int sodv2 = dt2.Rows.Count;

           if (sodv2 > 0)
           {
               lblDonVi_5.Text += "<table border=\"1\" width=\"350px\"  cellpadding=\"0\" cellspacing=\"0\">";
               lblDonVi_5.Text += "<tr>";
               for (int l = 0; l < sodv2; l++)
               {
                   if (l == 0)
                   {
                       int w = 150;
                       int chieurong = (w / sodv2);

                       lblDonVi_5.Text += "<td style='font-size:10pt;font-family:Times New Roman;'>";
                       lblDonVi_5.Text += "<div style='height:auto; width:" + chieurong + "'  class=\"node level1 node0 level1-node0 drama-title\">123123";                       
                       lblDonVi_5.Text +=  dt2.Rows[l]["Name"].ToString();
                       lblDonVi_5.Text += "<br/><font color='#fbe706'>LĐTT/LĐĐB : " + dt2.Rows[l]["songuoi"].ToString() + "/" + dt2.Rows[l]["dinhbienlaodong"].ToString() + "</font>";
                       lblDonVi_5.Text += "</div></td>";
                       lblDonVi_5.Text += "<td style='padding:0px;'><table cellpadding='0' cellspacing='0' style='width:210px;' border='0'><tr style='height:20px;'><td>&nbsp;</td></tr>";
                       lblDonVi_5.Text += "<tr style='height:60px;'><td  style='border-top: 3px solid #000000;'>&nbsp;</td></tr>";
                       lblDonVi_5.Text += "</table></td>";
                   }
               }
               lblDonVi_5.Text += "</tr>";
               lblDonVi_5.Text += "</table>";
           }
           
        
       }
       #endregion
       protected void callbackPanelEmployees_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
       {
           DrawingDonVi(Int32.Parse(e.Parameter.ToString()));
           BuildChartDonVi(Int32.Parse(e.Parameter.ToString()));
           BuildChartDonViQuanLy(Int32.Parse(e.Parameter.ToString()));
       }
       
       
        public DotNetNuke.Entities.Modules.Actions.ModuleActionCollection ModuleActions
        {
            get
            {
                Entities.Modules.Actions.ModuleActionCollection Actions = new Entities.Modules.Actions.ModuleActionCollection();
                Actions.Add(GetNextActionID(),
                "Edit",
                Entities.Modules.Actions.ModuleActionType.AddContent,
                "",
                "",
                EditUrl(),
                false,
                SecurityAccessLevel.Edit,
                true, false);
                return Actions;
            }
        }       
}
}
