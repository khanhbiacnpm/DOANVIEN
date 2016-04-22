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

namespace Philip.Modules.TinTuc
{
    partial class VideoChiTiet : PortalModuleBase, IActionable
    {
        public string get_img(string anh,string id)
        {
            if (anh.Trim() == "")
                return "";
            else
            {
                return "<a href='" + DotNetNuke.Common.Globals.ApplicationPath + "/TinTuc.aspx?id=" + id + "_a'> <img border=\"0\" height=\"95px\" width=\"132px\" src='" + DotNetNuke.Common.Globals.ApplicationPath + "/images/TinTuc/" + anh.TrimStart().TrimEnd() + "' />";


            }
        }
        //public string get_li(string idTintuc)
        //{
        //    tintucInfo objtintucInfo = new tintucInfo();
        //    tintucController objControl = new tintucController();
        //    objtintucInfo.idtintuc = int.Parse(idTintuc);
        //    objtintucInfo = objControl.Gettintuc(objtintucInfo);

        //    string link="<a href='"+DotNetNuke.Common.Globals.NavigateURL(59, "", "id/" +objtintucInfo.idtintuc.ToString())+"'class=\"Tintuc_tieude_ListLink\">"+objtintucInfo.tieude+"</a>";

        //    if ((objtintucInfo.idnhom == 2) || (objtintucInfo.idnhom == 3) || (objtintucInfo.idnhom == 21) || (objtintucInfo.idnhom == 23) || (objtintucInfo.idnhom == 25))
        //    {
        //        return "<li class=\"listDuthao\">"+link+"</li>";

        //    }
        //    else
        //    {
        //        return link;
        //    }

        //}
        //public string get_tomtat(string idTintuc)
        //{
        //    tintucInfo objtintucInfo = new tintucInfo();
        //    tintucController objControl = new tintucController();
        //    objtintucInfo.idtintuc = int.Parse(idTintuc);
        //    objtintucInfo = objControl.Gettintuc(objtintucInfo);
        //    if ((objtintucInfo.idnhom == 2) || (objtintucInfo.idnhom == 3) || (objtintucInfo.idnhom == 21) || (objtintucInfo.idnhom == 23) || (objtintucInfo.idnhom == 25))
        //    {
        //        return "";
        //    }
        //    else
        //    {
        //        return "<div id=\"divtomtat\" class=\"text_tintuc_tomtat\">" + objtintucInfo.tomtat + "</div>";

        //    }

        //}
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {


                TinTucInfo objtintucInfo = new TinTucInfo();
                TinTucController objControl = new TinTucController();

                if (Request.Params["id"] != null)
                {

                    objtintucInfo.idtintuc = int.Parse(Request.Params["id"].Trim());
                    objtintucInfo = objControl.GetTinTuc(objtintucInfo);
                    lblTieude.Text = objtintucInfo.tieude;
                    divNoidung.InnerHtml = objtintucInfo.tomtat;
                    //NhomTinInfo objnhomtin = new NhomTinInfo();
                    //objnhomtin.IdNhom = objtintucInfo.idnhom;
                    //objnhomtin = objControl.GetNhomTin(objnhomtin);


                  
                    List<TinTucInfo> list = objControl.GetTinTucDaDua(objtintucInfo);
                    listDadua.DataSource = list;
                    listDadua.DataBind();
                    divChitiet.Visible = true;
                    divList.Visible = false;

                    //objControl.UpdateLanDoc(objtintucInfo);
                }
                else
                {

                    //if (Request.Params["catid"] != null)
                    //{
                    //    NhomTinInfo objnhomtin = new NhomTinInfo();
                    //    objnhomtin.IdNhom = int.Parse(Request.Params["catid"].Trim());
                    //    objnhomtin = objControl.GetNhomTin(objnhomtin);


                    
                       // objtintucInfo.hienthi = 2;
                        objtintucInfo.idnhom = 2;
                        divChitiet.Visible = false;
                        divList.Visible = true;
                        listVideo.DataSource = objControl.GetTinMoi_Dataset(objtintucInfo);
                        listVideo.DataBind();
                    //}
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
            //TinTucInfo objtintucInfo = new TinTucInfo();
            //TinTucController objControl = new TinTucController();
            //if (Request.Params["catid"] != null)
            //{
            //    //NhomTinInfo objnhomtin = new NhomTinInfo();
            //    //objnhomtin.IdNhom = int.Parse(Request.Params["catid"].Trim());
            //    //objnhomtin = objControl.GetNhomTin(objnhomtin);


            //    //hplNhom.InnerText = objnhomtin.TenNhomTin.ToUpper();
            //    //hplNhom.HRef = DotNetNuke.Common.Globals.ApplicationPath + "/TinTuc.aspx?catid=" + objnhomtin.IdNhom.ToString();
            //    gridTintuc.CurrentPageIndex = e.NewPageIndex;
            //    objtintucInfo.hienthi = 1;
            //    objtintucInfo.idnhom = int.Parse(Request.Params["catid"].Trim());
            //    divChitiet.Visible = false;
            //    divList.Visible = true;
            //    gridTintuc.DataSource = objControl.GetTinMoi_Dataset(objtintucInfo);
            //    gridTintuc.DataBind();
            //}
        }
    }
}
