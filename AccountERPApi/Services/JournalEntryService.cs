using AccountERPApi.IRepositories;
using AccountERPApi.IServices;
using AccountERPClassLibraries;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Services
{
    public class JournalEntryService : IJournalEntryService
    {

        private readonly IJournalEntryRepository _repository;

        public JournalEntryService(IJournalEntryRepository repository)
        {
            _repository = repository;
        }

        public JournalEntry AddJournalEntry(JournalEntry obj)
        {
            return _repository.AddJournalEntry(obj);
        }

        public List<JournalEntry> GetAll()
        {
            return _repository.GetAll();
        }

        public JournalEntry GetJournalEntryByID(int id)
        {
            return _repository.GetJournalEntryByID(id);
        }

        public JournalEntry UpdateJournalEntry(JournalEntry obj)
        {
            return _repository.UpdateJournalEntry(obj);
        }
    }
}
