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
    partial class GalleryVideoTrangChu : PortalModuleBase, IActionable
    {
      

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!Page.IsPostBack)
                {

                    TinTucInfo objtintucInfo = new TinTucInfo();
                    TinTucController objControl = new TinTucController();

                    objtintucInfo.idnhom = 5;//hinh anh
                    rptHinhAnh.DataSource = objControl.GetTinMoi(objtintucInfo);
                    rptHinhAnh.DataBind();

                }
               


            }
            catch(Exception ex)
            {
                string t = ex.Message;
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
