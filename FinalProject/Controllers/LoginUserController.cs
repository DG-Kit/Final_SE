using FinalProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProject.Controllers
{
    public class LoginUserController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();
        // GET: Admin/Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var Accountant = db.Accountants.FirstOrDefault(u => u.AccountantEmail == model.Email && u.AccountantPassword == model.Password);


                if (Accountant != null)
                {
                    // Đăng nhập thành công, lưu thông tin người dùng vào session và chuyển hướng đến trang quản trị
                    Session["AdminUser"] = Accountant;
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    // Đăng nhập không thành công, đặt thông báo lỗi vào TempData và chuyển hướng về trang login view
                    TempData["Error"] = "Email hoặc mật khẩu không đúng.";
                    return RedirectToAction("Index", "LoginUser");
                }
            }

            return View(model);
        }

        // GET: Admin/Logout
        public ActionResult Logout()
        {
            Session.Abandon();
            return RedirectToAction("Index", "LoginUser");
        }
    }
}