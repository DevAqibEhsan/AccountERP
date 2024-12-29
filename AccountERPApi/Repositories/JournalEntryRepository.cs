using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using Dapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class JournalEntryRepository : IJournalEntryRepository
    {
        private readonly IDapper _dapper;
        public JournalEntryRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public JournalEntry AddJournalEntry(JournalEntry obj)
        {
            string json = JsonConvert.SerializeObject(obj.JournalEntryDetail, Formatting.None);
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Debit", obj.Debit, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("Credit", obj.Credit, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("Memo", obj.Memo, DbType.String, ParameterDirection.Input);
            parameters.Add("Attachment", obj.Attachment, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("JournalEntryDetail", json, DbType.String, ParameterDirection.Input);
            return _dapper.Get<JournalEntry>(@"usp_JournalEntry_Add", parameters);
        }

        public List<JournalEntry> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<JournalEntry>(@"usp_JournalEntry_GetAll", parameters);
        }

        public JournalEntry GetJournalEntryByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("JournalEntryID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<JournalEntry>(@"usp_JournalEntry_GetJournalEntryByID", parameters);
        }

        public JournalEntry UpdateJournalEntry(JournalEntry obj)
        {
            string json = JsonConvert.SerializeObject(obj.JournalEntryDetail, Formatting.None);
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("JournalEntryID", obj.JournalEntryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CompanyID", obj.CompanyID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Debit", obj.Debit, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("Credit", obj.Credit, DbType.Decimal, ParameterDirection.Input);
            parameters.Add("Memo", obj.Memo, DbType.String, ParameterDirection.Input);
            parameters.Add("Attachment", obj.Attachment, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("JournalEntryDetail", json, DbType.String, ParameterDirection.Input);
            return _dapper.Get<JournalEntry>(@"usp_JournalEntry_Update", parameters);
        }
    }
}
