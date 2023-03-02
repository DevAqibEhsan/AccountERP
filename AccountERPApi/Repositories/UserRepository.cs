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
    public class UserRepository : IUserRepository
    {
        private readonly IDapper _dapper;
        public UserRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public User AddUser(User obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("RoleID", obj.RoleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("FirstName", obj.FirstName, DbType.String, ParameterDirection.Input);
            parameters.Add("LastName", obj.LastName, DbType.String, ParameterDirection.Input);
            parameters.Add("Email", obj.Email, DbType.String, ParameterDirection.Input);
            parameters.Add("Password", obj.Password, DbType.String, ParameterDirection.Input);
            parameters.Add("Phone", obj.Phone, DbType.String, ParameterDirection.Input);
            parameters.Add("Address1", obj.Address1, DbType.String, ParameterDirection.Input);
            parameters.Add("Address2", obj.Address2, DbType.String, ParameterDirection.Input);
            parameters.Add("CityID", obj.CityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ZipCode", obj.ZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Gender", obj.Gender, DbType.String, ParameterDirection.Input);
            parameters.Add("DOB", obj.DOB, DbType.Date, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedBy", obj.CreatedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("CreatedOn", obj.CreatedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("CreatedByIP", obj.CreatedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyIDs", obj.CompanyIDs, DbType.String, ParameterDirection.Input);
            parameters.Add("BranchIDs", obj.BranchIDs, DbType.String, ParameterDirection.Input);
            return _dapper.Get<User>(@"usp_User_Add", parameters);
        }

        public List<User> GetAll()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<User>(@"usp_User_GetAll", parameters);
        }

        public List<User> GetAllActive()
        {
            DynamicParameters parameters = new DynamicParameters();
            return _dapper.GetAll<User>(@"usp_User_GetAllActive", parameters);
        }

        public User GetUserByID(int id)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("UserID", id, DbType.Int32, ParameterDirection.Input);
            return _dapper.Get<User>(@"usp_User_GetUserByID", parameters);
        }

        public User UpdateUser(User obj)
        {
            DynamicParameters parameters = new DynamicParameters();
            parameters.Add("UserID", obj.UserID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("RoleID", obj.RoleID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("FirstName", obj.FirstName, DbType.String, ParameterDirection.Input);
            parameters.Add("LastName", obj.LastName, DbType.String, ParameterDirection.Input);
            parameters.Add("Email", obj.Email, DbType.String, ParameterDirection.Input);
            parameters.Add("Password", obj.Password, DbType.String, ParameterDirection.Input);
            parameters.Add("Phone", obj.Phone, DbType.String, ParameterDirection.Input);
            parameters.Add("Address1", obj.Address1, DbType.String, ParameterDirection.Input);
            parameters.Add("Address2", obj.Address2, DbType.String, ParameterDirection.Input);
            parameters.Add("CityID", obj.CityID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("StateID", obj.StateID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ZipCode", obj.ZipCode, DbType.String, ParameterDirection.Input);
            parameters.Add("CountryID", obj.CountryID, DbType.Int32, ParameterDirection.Input);
            parameters.Add("Gender", obj.Gender, DbType.String, ParameterDirection.Input);
            parameters.Add("DOB", obj.DOB, DbType.Date, ParameterDirection.Input);
            parameters.Add("IsActive", obj.IsActive, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedBy", obj.ModifiedBy, DbType.Int32, ParameterDirection.Input);
            parameters.Add("ModifiedOn", obj.ModifiedOn, DbType.DateTime, ParameterDirection.Input);
            parameters.Add("ModifiedByIP", obj.ModifiedByIP, DbType.String, ParameterDirection.Input);
            parameters.Add("CompanyIDs", obj.CompanyIDs, DbType.String, ParameterDirection.Input);
            parameters.Add("BranchIDs", obj.BranchIDs, DbType.String, ParameterDirection.Input);
            return _dapper.Get<User>(@"usp_User_Update", parameters);
        }
    }
}
