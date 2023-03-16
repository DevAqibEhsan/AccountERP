using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class CodePrefixRepository : ICodePrefixRepository
    {
        private readonly IDapper _dapper;
        public CodePrefixRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public CodePrefix AddCodePrefix(CodePrefix obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CodePrefixName", obj.CodePrefixName, DbType.String, ParameterDirection.Input);
            parameters.Add("CodePrefixKey", obj.CodePrefixKey, DbType.String, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<CodePrefix>(@"usp_CodePrefixes_Add", parameters);
        }

        public List<CodePrefix> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();

            return _dapper.GetAll<CodePrefix>(@"usp_CodePrefixes_GetAll", parameters);
        }

        public CodePrefix GetCodePrefixByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CodePrefixeID", id, DbType.Int32, ParameterDirection.Input);

            return _dapper.Get<CodePrefix>(@"usp_CodePrefixes_GetCodePrefixByID", parameters);
        }

        public CodePrefix UpdateCodePrefix(CodePrefix obj)
        {
            DynamicParameters parameters = new DynamicParameters();

            parameters.Add("CodePrefixeID", obj.CodePrefixeID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CodePrefixName", obj.CodePrefixName, DbType.String, ParameterDirection.Input);
            parameters.Add("CodePrefixKey", obj.CodePrefixKey, DbType.String, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);

            return _dapper.Get<CodePrefix>(@"usp_CodePrefixes_Update", parameters);
        }
    }
}
