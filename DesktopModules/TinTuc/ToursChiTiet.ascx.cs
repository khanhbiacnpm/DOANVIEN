using System;
using System.Data;
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
using System.Web.UI.HtmlControls;
using DotNetNuke.Entities.Users;
using Philip.Modules.Text;
namespace Philip.Modules.TinTuc
{
    partial class ToursChiTiet : PortalModuleBase, IActionable
    {
        public string get_img(string anh,string id)
        {
            if (anh.Trim() == "")
                return "";
            else
            {
                return "<a href='" + DotNetNuke.Common.Globals.ApplicationPath + "/TinTuc.aspx?id=" + id + "'_a> <img border=\"0\" height=\"95px\" width=\"132px\" src='" + DotNetNuke.Common.Globals.ApplicationPath + "/images/TinTuc/" + anh.TrimStart().TrimEnd() + "' />";


            }
        }
       
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                TinTucInfo objtintucInfo = new TinTucInfo();
                TinTucController objControl = new TinTucController();

                if (Request.Params["id"] != null)
                {
                    string[] arr = Request.Params["id"].Trim().Split('_');

                    objtintucInfo.idtintuc = int.Parse(arr[0]);
                    objtintucInfo = objControl.GetTinTuc(objtintucInfo);
                    lblTieude.Text = objtintucInfo.tieude;
                    divNoidung.InnerHtml = objtintucInfo.noidung;        

               

                    List<TinTucInfo> list = objControl.GetTinTucDaDua(objtintucInfo);
                    listDadua.DataSource = list;
                    listDadua.DataBind();
                    divChitiet.Visible = true;
                    divList.Visible = false;

                    //objControl.UpdateLanDoc(objtintucInfo);
                }
                else
                {

                    if (Request.Params["catid"] != null)
                    {
                        NhomTinInfo objnhomtin = new NhomTinInfo();
                        objnhomtin.IdNhom =int.Parse(Request.Params["catid"].Trim());
                        objnhomtin = objControl.GetNhomTin(objnhomtin);


                        lblTenNhomTin.Text = objnhomtin.TenNhomTin;

                        objtintucInfo.hienthi = 1;
                        objtintucInfo.idnhom = int.Parse(Request.Params["catid"].Trim());
                        divChitiet.Visible = false;
                        divList.Visible = true;

                        dgrSanPham.DataSource = objControl.GetTinMoi_Dataset(objtintucInfo);
                        dgrSanPham.DataBind();



                     

                    }
                }


            }
            catch
            { }

        }


        #region Optional Interfaces
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


        protected void gridTintuc_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
        //    TinTucInfo objtintucInfo = new TinTucInfo();
        //    TinTucController objControl = new TinTucController();
        //    if (Request.Params["catid"] != null)
        //    {
        //        //NhomTinInfo objnhomtin = new NhomTinInfo();
        //        //objnhomtin.IdNhom = int.Parse(Request.Params["catid"].Trim());
        //        //objnhomtin = objControl.GetNhomTin(objnhomtin);


        //        //hplNhom.InnerText = objnhomtin.TenNhomTin.ToUpper();
        //        //hplNhom.HRef = DotNetNuke.Common.Globals.ApplicationPath + "/TinTuc.aspx?catid=" + objnhomtin.IdNhom.ToString();
        //        listVideo.CurrentPageIndex = e.NewPageIndex;
        //        objtintucInfo.hienthi = 1;
        //        objtintucInfo.idnhom = int.Parse(Request.Params["catid"].Trim());
        //        divChitiet.Visible = false;
        //        divList.Visible = true;
        //        gridTintuc.DataSource = objControl.GetTinMoi_Dataset(objtintucInfo);
        //        gridTintuc.DataBind();
        //    }
        }
        protected void dgrSanPham_PageIndexChanged(object source, DataGridPageChangedEventArgs e)
        {
            TinTucInfo objtintucInfo = new TinTucInfo();
            TinTucController objControl = new TinTucController();

            dgrSanPham.CurrentPageIndex = e.NewPageIndex;
            dgrSanPham.SelectedIndex = -1;
            dgrSanPham.EditItemIndex = -1;

        
          


            objtintucInfo.hienthi = 1;
            objtintucInfo.idnhom = 1;
            divChitiet.Visible = false;
            divList.Visible = true;

            dgrSanPham.DataSource = objControl.GetTinMoi_Dataset(objtintucInfo);
            dgrSanPham.DataBind();


          
        }
}
}
