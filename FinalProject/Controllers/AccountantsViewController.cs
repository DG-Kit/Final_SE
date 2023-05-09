using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using FinalProject.Models;

namespace FinalProject.Controllers
{
    public class AccountantsViewController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();

        // GET: AccountantsView
        //[Authorize]
        public ActionResult Index()
        {
            var accountants = db.Accountants.Include(a => a.Warehouse);
            return View(accountants.ToList());
        }

        // GET: AccountantsView/Details/5
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

        // GET: AccountantsView/Create
        public ActionResult Create()
        {
            ViewBag.WarehouseID = new SelectList(db.Warehouses, "WarehouseId", "WarehouseName");
            return View();
        }

        // POST: AccountantsView/Create
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

        // GET: AccountantsView/Edit/5
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

        // POST: AccountantsView/Edit/5
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

        // GET: AccountantsView/Delete/5
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

        // POST: AccountantsView/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Accountant accountant = db.Accountants.Find(id);
            db.Accountants.Remove(accountant);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        public ActionResult ListPhone()
        {
            var phones = db.Phones.ToList();
            var accountant = db.Accountants.FirstOrDefault();
            var viewModel = new AccountantPhoneViewModel { Phones = phones, Accountant = accountant };
            return View(viewModel);
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        public ActionResult CreateReceipt()
        {
            var phones = db.Phones.ToList();
            var warehouses = db.Warehouses.ToList();

            ViewBag.Phones = phones;
            ViewBag.Warehouses = warehouses;

            return View();
        }
    }
}
