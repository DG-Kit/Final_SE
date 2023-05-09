using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.Models;

namespace FinalProject.Areas.Admin.Controllers
{
    public class ResellersController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();
        // GET: Admin/Resellers
        public ActionResult Index()
        {
            return View(db.Resellers.ToList());
        }

        // GET: Admin/Resellers/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reseller reseller = db.Resellers.Find(id);
            if (reseller == null)
            {
                return HttpNotFound();
            }
            return View(reseller);
        }

        // GET: Admin/Resellers/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Resellers/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ResellerId,ResellerName,ResellerEmail,ResellerPassword,ResellerLocation")] Reseller reseller)
        {
            if (ModelState.IsValid)
            {
                db.Resellers.Add(reseller);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(reseller);
        }

        // GET: Admin/Resellers/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reseller reseller = db.Resellers.Find(id);
            if (reseller == null)
            {
                return HttpNotFound();
            }
            return View(reseller);
        }

        // POST: Admin/Resellers/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ResellerId,ResellerName,ResellerEmail,ResellerPassword,ResellerLocation")] Reseller reseller)
        {
            if (ModelState.IsValid)
            {
                db.Entry(reseller).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(reseller);
        }

        // GET: Admin/Resellers/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Reseller reseller = db.Resellers.Find(id);
            if (reseller == null)
            {
                return HttpNotFound();
            }
            return View(reseller);
        }

        // POST: Admin/Resellers/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Reseller reseller = db.Resellers.Find(id);
            db.Resellers.Remove(reseller);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
