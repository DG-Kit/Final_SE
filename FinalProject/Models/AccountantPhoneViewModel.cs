using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FinalProject.Models
{
    public class AccountantPhoneViewModel
    {
        public List<Phone> Phones { get; set; }
        public Accountant Accountant { get; set; }

        public Reseller Reseller { get; set; }
    }
}