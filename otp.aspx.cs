using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using DotNetNuke.Entities.Portals;
using System.Web.Security;

public partial class otp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string CASHOST = ConfigurationManager.AppSettings["cashost"];
        String certPath = ConfigurationManager.AppSettings["casCert"];
        string casLogout = "";
        string casLogin = "";
        Utils utils = new Utils();
        string netid = "";

        String servicePath = Request.Url.GetLeftPart(UriPartial.Path);
        casLogout = CASHOST + "logout?service=" + servicePath;
        casLogin = CASHOST + "login?service=" + servicePath;

       netid = utils.getUserID(CASHOST, certPath, Response, Request);

        if (netid != "")
        {
            String username = netid;

            /*
             * username là tên truy cập của người sử dụng (email VNPT)
             * thực hiện các bước tiếp theo trong hệ thống 
             * - Kiểm tra username có trong ứng dụng hay không
             *  + Nếu có gán quyền tương ứng trong hệ thống cho account username và Redirect trình duyệt đến trang chủ ứng dụng gán Session tương ứng
             *  + Trong ứng dụng kiểm tra Session xem đăng nhập hay chưa nếu chưa thì redirect đến trang này
             *  + Không có thực hiện Response.Redirect(this.casLogin) để yêu cầu người sử dụng login lại hoặc báo lỗi
             */
            Session["username"] = username;
            // Kiem tra user co trong he thong
            if (username != "")
            {
                // User co quyen vao he thong
                string nexturl = Request.QueryString["next"];
                var PortalSettings = ((PortalSettings)HttpContext.Current.Items["PortalSettings"]);

                string AuthType = "DNN";
                try
                {
                    MembershipUser user = Membership.GetUser(username);
                    string pass = user.GetPassword();

                    DotNetNuke.Security.Membership.UserLoginStatus status = new DotNetNuke.Security.Membership.UserLoginStatus();
                    DotNetNuke.Entities.Users.UserInfo userInfo = DotNetNuke.Entities.Users.UserController.ValidateUser(PortalSettings.PortalId, username, pass, AuthType, "", PortalSettings.PortalName, DotNetNuke.Services.Authentication.AuthenticationLoginBase.GetIPAddress(), ref status);

                    switch (status)
                    {
                        case DotNetNuke.Security.Membership.UserLoginStatus.LOGIN_SUCCESS:
                            DotNetNuke.Entities.Users.UserController.UserLogin(PortalSettings.PortalId, userInfo, PortalSettings.PortalName, DotNetNuke.Services.Authentication.AuthenticationLoginBase.GetIPAddress(), true);
                            if (!string.IsNullOrEmpty(nexturl))
                                Response.Redirect(nexturl, false);
                            else
                                Response.Redirect(FullyQualifiedApplicationPath, false);
                            break;
                        case DotNetNuke.Security.Membership.UserLoginStatus.LOGIN_SUPERUSER:
                            DotNetNuke.Entities.Users.UserController.UserLogin(PortalSettings.PortalId, userInfo, PortalSettings.PortalName, DotNetNuke.Services.Authentication.AuthenticationLoginBase.GetIPAddress(), true);
                            Response.Redirect(FullyQualifiedApplicationPath, false);
                            break;
                        default:
                            Response.Redirect(string.Format("{0}/tai_khoan_khong_ton_tai.aspx", FullyQualifiedApplicationPath));
                            break;
                    }
                }
                catch(Exception ex)
                {
                    Response.Redirect(string.Format("{0}/tai_khoan_khong_ton_tai.aspx", FullyQualifiedApplicationPath));
                }
            }
            else
            {
                Response.Write("<center>Bạn chưa được cấp quyền truy cập ứng dụng này<br>Hãy liên hệ với người quản trị. Xin cám ơn<br>");
                Response.Write("<a href=http://portal.vnpt.com.vn>Trở lại VNPT Portal</a></center>");
            }
        }

        else
        {
            //Response.Write("kết nối ko thành công");
            Response.Redirect(casLogin);
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
}