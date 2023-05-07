using FinalProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FinalProject.Areas.Admin.Controllers
{ 
    public class HomeAdminController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();
        // GET: Admin/HomeAdmin
        public ActionResult Index()
        {
            return View();
        }
    }
}