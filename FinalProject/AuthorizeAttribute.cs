using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject
{
    public class AuthorizeAttribute : System.Web.Mvc.AuthorizeAttribute
    {
        protected override bool AuthorizeCore(HttpContextBase httpContext)
        {
            if (httpContext.Session["AdminUser"] != null)
            {
                // Nếu người dùng đã đăng nhập, cho phép truy cập
                return true;
            }
            else
            {
                // Nếu người dùng chưa đăng nhập, chuyển hướng đến trang đăng nhập
                httpContext.Response.Redirect("~/LoginUser/Index");
                return false;
            }
        }
    }
}