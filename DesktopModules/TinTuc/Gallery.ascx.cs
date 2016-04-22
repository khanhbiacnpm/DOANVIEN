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
    partial class Gallery : PortalModuleBase, IActionable
    {
       
    
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                TinTucInfo objTinTucInfo = new TinTucInfo();
                TinTucController objControl = new TinTucController();

                objTinTucInfo.hienthi = 1;

                objTinTucInfo.idnhom = 5;// thu vien anh

                // repeat_slide.DataSource = objControl.GetTinMoi(objTinTucInfo);    


                this.lblText.Text += "<div id=\"container\">";
                this.lblText.Text += "<div id=\"gallery\" class=\"ad-gallery\">";
                this.lblText.Text += " <div class=\"ad-image-wrapper\"></div>";
                this.lblText.Text += "  <div class=\"ad-controls\"></div>";

                this.lblText.Text += " <div class=\"ad-nav\">";
                this.lblText.Text += "  <div class=\"ad-thumbs\">";
                //ul
                this.lblText.Text += " <ul class=\"ad-thumb-list\">";
                //li

                foreach (TinTucInfo h in objControl.GetTinTucs(objTinTucInfo))
                {

                    string small = "images/TinTuc/" + h.anh;
                    string large = "images/TinTuc/" + h.anh;
                    string title = h.tieude;

                    this.lblText.Text += "  <li>";
                    this.lblText.Text += " <a href=\"" + small + "\"><img title=\"" + title + "\" src=\"" + large + "\" style='height:64px;' class=\"image0\"></a>";
                    this.lblText.Text += "  </li>";

                }

                this.lblText.Text += "</ul>";

                this.lblText.Text += "</div>";
                this.lblText.Text += "</div>";
                this.lblText.Text += "</div>";
                this.lblText.Text += "</div>";




            }
            catch (Exception exc) //Module failed to load
            {
                Exceptions.ProcessModuleLoadException(this, exc);
            }

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


       
    }
}
