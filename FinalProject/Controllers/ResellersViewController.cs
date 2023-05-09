using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Configuration;
using System.Web.Mvc;
using FinalProject.Models;
using FinalProject.Views;

namespace FinalProject.Controllers
{
    public class ResellersViewController : Controller
    {
        private FinalDatabaseEntities db = new FinalDatabaseEntities();

        // GET: ResellersView
        //[Authorize]
        public ActionResult Index()
        {
            return View(db.Resellers.ToList());
        }

        // GET: ResellersView/Details/5
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

        // GET: ResellersView/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ResellersView/Create
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

        // GET: ResellersView/Edit/5
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

        // POST: ResellersView/Edit/5
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

        // GET: ResellersView/Delete/5
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

        // POST: ResellersView/Delete/5
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
        public ActionResult ListPhone()
        {
            var phones = db.Phones.ToList();
            var reseller = db.Resellers.FirstOrDefault();
            var viewModel = new AccountantPhoneViewModel { Phones = phones, Reseller = reseller };
            return View(viewModel);
        }

        public List<ResellersCartItem> GetCartItems()
        {
            if (SessionHelper.GetObjectFromJson<List<CartItem>>(HttpContext.Session, "cart") != null)
            {
                return SessionHelper.GetObjectFromJson<List<ResellersCartItem>>(HttpContext.Session, "cart");
            }
            return new List<ResellersCartItem>();
        }
        private void ClearCart()
        {
            HttpContext.Session.Remove("cart");
        }

        private void SaveCart(List<ResellersCartItem> cartItems)
        {
            SessionHelper.SetObjectAsJson(HttpContext.Session, "cart", cartItems);
        }
        public ActionResult Cart(int phoneId, int quantity)
        {
            // Lấy sản phẩm từ database
            var phone = db.Phones.Find(phoneId);

            // Tạo một đối tượng CartItem từ sản phẩm và số lượng
            var item = new CartItem
            {
                Phone = phone,
                Quantity = quantity
            };

            // Thêm đối tượng CartItem vào giỏ hàng (Cart)
            var cart = SessionHelper.GetObjectFromJson<List<CartItem>>(Session, "cart");
            if (cart == null)
            {
                cart = new List<CartItem>();
            }
            cart.Add(item);
            SessionHelper.SetObjectAsJson(Session, "cart", cart);

            // Chuyển hướng đến trang Cart/Index
            return RedirectToAction("Index", "Cart");
        }
    }
}
