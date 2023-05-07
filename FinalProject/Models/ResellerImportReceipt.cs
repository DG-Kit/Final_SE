//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace FinalProject.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class ResellerImportReceipt
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ResellerImportReceipt()
        {
            this.ResellerImportReceiptDetails = new HashSet<ResellerImportReceiptDetail>();
        }
    
        public int ResellerImportReceiptId { get; set; }
        public int TotalPrice { get; set; }
        public System.DateTime DateCreated { get; set; }
        public string PaymentMethod { get; set; }
        public int PaymentStatus { get; set; }
        public int DeliveryStatusId { get; set; }
        public int ResellerId { get; set; }
    
        public virtual DeliveryStatu DeliveryStatu { get; set; }
        public virtual Reseller Reseller { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResellerImportReceiptDetail> ResellerImportReceiptDetails { get; set; }
    }
}
