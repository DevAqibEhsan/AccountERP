using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.IServices
{
   public interface IJournalEntryService
    {
        public List<JournalEntry> GetAll();
        JournalEntry AddJournalEntry(JournalEntry obj);
        JournalEntry UpdateJournalEntry(JournalEntry obj);
        JournalEntry GetJournalEntryByID(int id);
    }
}
