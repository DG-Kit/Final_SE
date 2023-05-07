using FinalProject.Areas.Admin.Models;
using FinalProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProject.Areas.Admin.Controllers
{
    public class LoginAdminController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoginViewModelAdmin model)
        {
            if (ModelState.IsValid)
            {
                var Admin = db.Admins.FirstOrDefault(u => u.AdminEmail == model.Email && u.AdminPassword == model.Password);
                

                if (Admin  != null)
                {
                    // Đăng nhập thành công, lưu thông tin người dùng vào session và chuyển hướng đến trang quản trị
                    Session["AdminUser"] = Admin;
                    return RedirectToAction("Index", "HomeAdmin");
                }
                else
                {
                    // Đăng nhập không thành công, đặt thông báo lỗi vào TempData và chuyển hướng về trang login view
                    TempData["Error"] = "Email hoặc mật khẩu không đúng.";
                    return RedirectToAction("Index", "LoginAdmin");
                }
            }

            return View(model);
        }

        // GET: Admin/Logout
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "LoginAdmin");
        }
    }
}