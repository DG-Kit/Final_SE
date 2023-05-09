using FinalProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Views
{
    public class ResellersCartItem
    {
        public Warehouse Warehouse { get; set; }
        public Phone Phone { get; set; }
        public int Quantity { get; set; }
    }
}