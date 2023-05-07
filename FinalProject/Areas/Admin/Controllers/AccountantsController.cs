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
    public class AccountantsController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();

        // GET: Admin/Accountants
        public ActionResult Index()
        {
            var accountants = db.Accountants.Include(a => a.Warehouse);
            return View(accountants.ToList());
        }

        // GET: Admin/Accountants/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Accountant accountant = db.Accountants.Find(id);
            if (accountant == null)
            {
                return HttpNotFound();
            }
            return View(accountant);
        }

        // GET: Admin/Accountants/Create
        public ActionResult Create()
        {
            ViewBag.WarehouseID = new SelectList(db.Warehouses, "WarehouseId", "WarehouseName");
            return View();
        }

        // POST: Admin/Accountants/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "AccountantID,AccountantName,AccountantEmail,AccountantPassword,WarehouseID")] Accountant accountant)
        {
            if (ModelState.IsValid)
            {
                db.Accountants.Add(accountant);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.WarehouseID = new SelectList(db.Warehouses, "WarehouseId", "WarehouseName", accountant.WarehouseID);
            return View(accountant);
        }

        // GET: Admin/Accountants/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Accountant accountant = db.Accountants.Find(id);
            if (accountant == null)
            {
                return HttpNotFound();
            }
            ViewBag.WarehouseID = new SelectList(db.Warehouses, "WarehouseId", "WarehouseName", accountant.WarehouseID);
            return View(accountant);
        }

        // POST: Admin/Accountants/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "AccountantID,AccountantName,AccountantEmail,AccountantPassword,WarehouseID")] Accountant accountant)
        {
            if (ModelState.IsValid)
            {
                db.Entry(accountant).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.WarehouseID = new SelectList(db.Warehouses, "WarehouseId", "WarehouseName", accountant.WarehouseID);
            return View(accountant);
        }

        // GET: Admin/Accountants/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Accountant accountant = db.Accountants.Find(id);
            if (accountant == null)
            {
                return HttpNotFound();
            }
            return View(accountant);
        }

        // POST: Admin/Accountants/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Accountant accountant = db.Accountants.Find(id);
            db.Accountants.Remove(accountant);
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
