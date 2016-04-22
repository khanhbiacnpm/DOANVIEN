using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DotNetNuke.UI.Utilities;
using DotNetNuke.Security.Membership;
using DotNetNuke.Security;
using DotNetNuke.Entities.Portals;

public partial class direct_login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        btnLogin.Click += OnLoginClick;

        ClientAPI.RegisterKeyCapture(Parent, btnLogin, 13);     
    }

    private void OnLoginClick(object sender, EventArgs e)
    {
        var loginStatus = UserLoginStatus.LOGIN_FAILURE;
        string userName = new PortalSecurity().InputFilter(txtUsername.Text,
                                                 PortalSecurity.FilterFlag.NoScripting |
                                                 PortalSecurity.FilterFlag.NoAngleBrackets |
                                                 PortalSecurity.FilterFlag.NoMarkup);
        var PortalSettings = ((PortalSettings)HttpContext.Current.Items["PortalSettings"]);
        DotNetNuke.Entities.Users.UserInfo userInfo = DotNetNuke.Entities.Users.UserController.ValidateUser(PortalSettings.PortalId, userName, txtPassword.Text, "DNN", "", PortalSettings.PortalName, DotNetNuke.Services.Authentication.AuthenticationLoginBase.GetIPAddress(), ref loginStatus);

        switch (loginStatus)
        {
            case DotNetNuke.Security.Membership.UserLoginStatus.LOGIN_SUCCESS:
                DotNetNuke.Entities.Users.UserController.UserLogin(PortalSettings.PortalId, userInfo, PortalSettings.PortalName, DotNetNuke.Services.Authentication.AuthenticationLoginBase.GetIPAddress(), true);
                Response.Redirect(FullyQualifiedApplicationPath, false);
                break;
            case DotNetNuke.Security.Membership.UserLoginStatus.LOGIN_SUPERUSER:
                DotNetNuke.Entities.Users.UserController.UserLogin(PortalSettings.PortalId, userInfo, PortalSettings.PortalName, DotNetNuke.Services.Authentication.AuthenticationLoginBase.GetIPAddress(), true);
                Response.Redirect(FullyQualifiedApplicationPath, false);
                break;
            default:
                break;
        }
    }
	public string FullyQualifiedApplicationPath
        {
            get
            {
                string appPath = null;
                appPath = string.Format("{0}://{1}{2}{3}",
                    Request.Url.Scheme,
                    Request.Url.Host,
                    Request.Url.Port == 80 ? string.Empty : (":" + Request.Url.Port),
                    Request.ApplicationPath);
                return appPath;
            }
        }
    public string SkinPath
    {
        get
        {
            return ((PortalSettings)HttpContext.Current.Items["PortalSettings"]).DefaultPortalSkin;
        }
    }
}