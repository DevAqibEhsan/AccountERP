using AccountERPApi.DBManager;
using AccountERPApi.IRepositories;
using AccountERPClassLibraries;
using AccountERPClassLibraries.DTOLibraries;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Repositories
{
    public class AuthenticationRepository : IAuthenticationRepository
    {
        private readonly IDapper _dapper;

        public AuthenticationRepository(IDapper dapper)
        {
            _dapper = dapper;
        }

        public ClaimDTO Authenticate(LoginCredentials obj)
        {
            try
            {
                DynamicParameters parameters = new DynamicParameters();
                parameters.Add("Email", obj.Email, DbType.String, ParameterDirection.Input);
                parameters.Add("Password", obj.Password, DbType.String, ParameterDirection.Input);

                var data = _dapper.Get<ClaimDTOInherit>(@"usp_ValidateLogin", parameters);
                ClaimDTO claimDTO = null;

                if (data != null && data.UserID != 0 && data.RoleID != 0)
                {
                    claimDTO = new ClaimDTO();
                    claimDTO = data;

                    claimDTO.Companies = new System.Collections.Generic.List<int>();
                    if (data.CompanyIdsText != null)
                    {
                        claimDTO.Companies = data.CompanyIdsText.Split(',').Select(x => int.Parse(x)).ToList();
                    }

                    claimDTO.Branches = new System.Collections.Generic.List<int>();
                    if (data.BranchIdsText != null)
                    {
                        claimDTO.Branches = data.BranchIdsText.Split(',').Select(x => int.Parse(x)).ToList();
                    }
                }
                else
                {
                    claimDTO = null;
                }
                
                return claimDTO;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
