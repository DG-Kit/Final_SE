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
    
    public partial class ExportReceipt
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ExportReceipt()
        {
            this.ExportReceiptDetails = new HashSet<ExportReceiptDetail>();
        }
    
        public int ExportReceiptId { get; set; }
        public int TotalPrice { get; set; }
        public System.DateTime DateCreated { get; set; }
        public int AccountantId { get; set; }
    
        public virtual Accountant Accountant { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ExportReceiptDetail> ExportReceiptDetails { get; set; }
    }
}
