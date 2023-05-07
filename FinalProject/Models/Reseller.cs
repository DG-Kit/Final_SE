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
    
    public partial class Reseller
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Reseller()
        {
            this.ExportReceiptDetails = new HashSet<ExportReceiptDetail>();
            this.ResellerImportReceipts = new HashSet<ResellerImportReceipt>();
            this.ResellerStorages = new HashSet<ResellerStorage>();
        }
    
        public int ResellerId { get; set; }
        public string ResellerName { get; set; }
        public string ResellerEmail { get; set; }
        public string ResellerPassword { get; set; }
        public string ResellerLocation { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExportReceiptDetail> ExportReceiptDetails { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResellerImportReceipt> ResellerImportReceipts { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ResellerStorage> ResellerStorages { get; set; }
    }
}