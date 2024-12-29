using System;
using System.Collections.Generic;
using System.Text;

namespace AccountERPClassLibraries
{
    public class JournalEntry
    {
        public int JournalEntryID { get; set; }
        public int JournalEntryCodeID { get; set; }
        public string JournalEntryCode { get; set; }
        public int CompanyID { get; set; }
        public string CompanyName { get; set; }
        public decimal Debit { get; set; }
        public decimal Credit { get; set; }
        public string Memo { get; set; }
        public string Attachment { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
        public string CreatedByUserName { get; set; }
        public string ModifiedByUserName { get; set; }
        public List<JournalEntryDetail> JournalEntryDetail { get; set; }
    }

    public class JournalEntryDetail
    {
        public int JournalEntryDetailID { get; set; }
        public int JournalEntryID { get; set; }
        public int AccountID { get; set; }
        public string Description { get; set; }
        public decimal Debit { get; set; }
        public decimal Credit { get; set; }
        public int CreatedBy { get; set; }
        public DateTime CreatedOn { get; set; }
        public string CreatedByIP { get; set; }
        public int ModifiedBy { get; set; }
        public DateTime ModifiedOn { get; set; }
        public string ModifiedByIP { get; set; }
    }
}
