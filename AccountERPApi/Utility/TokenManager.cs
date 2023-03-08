using AccountERPClassLibraries.DTOLibraries;
using Microsoft.AspNetCore.Http;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;

namespace AccountERPApi.Utility
{
    public class TokenManager
    {
        public static Dictionary<string, string> GeneratedTokens = new Dictionary<string, string>();

        private static string Secret = "J8c20cxkPZCC/0e0ZUcjrGocsk95gOAqjzJ09apAklM=";
        private static double TokenExpireTime = 3600.0;

        public static string GenerateToken(ClaimDTO obj)
        {

            byte[] key = Convert.FromBase64String(Secret);  
            SymmetricSecurityKey securityKey = new SymmetricSecurityKey(key);
            SecurityTokenDescriptor descriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[] {
                    new Claim("UserID", Convert.ToString(obj.UserID)),
                    new Claim("RoleID",Convert.ToString(obj.RoleID)),
                    new Claim("FirstName",Convert.ToString(obj.FirstName)),
                    new Claim("LastName", Convert.ToString(obj.LastName)),
                    new Claim("RoleName",obj.RoleName),
                    new Claim("Email", Convert.ToString(obj.Email==null ? "" : obj.Email)),
                    new Claim("Companies", string.Join(',',obj.Companies)),
                    new Claim("Branches", string.Join(',',obj.Branches)),
                    new Claim("Permissions", obj.Permissions),
                    new Claim("SiteLogo", obj.SiteLogo),
                    new Claim("PoweredByText", obj.PoweredByText),
                    new Claim("SiteURL", obj.SiteURL),

                    //new Claim("ImagePath", Convert.ToString(obj.ImagePath)),
                    //new Claim("DesignationId",string.Join(',',obj.DesignationId)),
                    //new Claim("DynamicMenu", obj.DynamicMenu),
                    //new Claim("MaxDiscountApproval", Convert.ToString(obj.MaxDiscountApproval)),
                    //new Claim("Factories", string.Join(',',obj.Factories)),
                    //new Claim("Teams", string.Join(',',obj.Teams)),
                    //new Claim("EmployeeLevelID", string.Join(',',obj.EmployeeLevelID)),
                }
                ),
                Issuer = "AccountERP",
                /*IssuedAt = DateTime.UtcNow.AddHours(Convert.ToDouble(ConfigurationManager.AppSettings["UTCTime"])),*/
                Expires = DateTime.Now.AddMinutes(TokenExpireTime),
                SigningCredentials = new SigningCredentials(securityKey,
                SecurityAlgorithms.HmacSha256Signature)
            };

            JwtSecurityTokenHandler handler = new JwtSecurityTokenHandler();
            JwtSecurityToken token = handler.CreateJwtSecurityToken(descriptor);

            string value = string.Empty;
            bool keyExists = GeneratedTokens.TryGetValue(obj.UserID.ToString(), out value);

            if (keyExists)
            {
                GeneratedTokens.Remove(obj.UserID.ToString());
                GeneratedTokens.Add(obj.UserID.ToString(), handler.WriteToken(token).ToString());
            }
            else
            {
                GeneratedTokens.Add(obj.UserID.ToString(), handler.WriteToken(token).ToString());
            }

            return handler.WriteToken(token);
        }
        public static ClaimsPrincipal GetPrincipal(string token)
        {
            try
            {
                JwtSecurityTokenHandler tokenHandler = new JwtSecurityTokenHandler();
                JwtSecurityToken jwtToken = (JwtSecurityToken)tokenHandler.ReadToken(token);
                if (jwtToken == null)
                    return null;
                byte[] key = Convert.FromBase64String(Secret);
                TokenValidationParameters parameters = new TokenValidationParameters()
                {
                    RequireExpirationTime = true,
                    ValidateIssuer = false,
                    ValidateAudience = false,
                    IssuerSigningKey = new SymmetricSecurityKey(key)
                };
                SecurityToken securityToken;
                ClaimsPrincipal principal = tokenHandler.ValidateToken(token,
                      parameters, out securityToken);
                return principal;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
        public static ClaimDTO ValidateToken(string token)
        {
            ClaimDTO obj = new ClaimDTO();
            ClaimsPrincipal principal = GetPrincipal(token);
            if (principal == null)
                return null;
            ClaimsIdentity identity = null;
            try
            {
                identity = (ClaimsIdentity)principal.Identity;
            }
            catch (NullReferenceException)
            {
                return null;
            }
            Claim UserID = identity.FindFirst("UserID");
            Claim RoleID = identity.FindFirst("RoleID");
            Claim FirstName = identity.FindFirst("FirstName");
            Claim LastName = identity.FindFirst("LastName");
            Claim RoleName = identity.FindFirst("RoleName");
            Claim Email = identity.FindFirst("Email");
            Claim Companies = identity.FindFirst("Companies");
            Claim Branches = identity.FindFirst("Branches");
            Claim Permissions = identity.FindFirst("Permissions");
            Claim SiteLogo = identity.FindFirst("SiteLogo");
            Claim PoweredByText = identity.FindFirst("PoweredByText");
            Claim SiteURL = identity.FindFirst("SiteURL");
            

            //Claim imagePath = identity.FindFirst("ImagePath");
            //Claim designationId = identity.FindFirst("DesignationId");
            //Claim dynamicMenu = identity.FindFirst("DynamicMenu");
            //Claim maxDiscountApproval = identity.FindFirst("MaxDiscountApproval");
            //Claim factories = identity.FindFirst("Factories");
            //Claim teams = identity.FindFirst("Teams");
            //Claim EmployeeLevelID = identity.FindFirst("EmployeeLevelID");

            obj.UserID = Convert.ToInt32(UserID.Value);
            obj.RoleID = Convert.ToInt32(RoleID.Value);
            obj.FirstName = FirstName.Value;
            obj.LastName = LastName.Value;
            obj.Email = Email.Value;
            obj.Permissions = Permissions.Value;
            obj.SiteLogo = SiteLogo.Value;
            obj.PoweredByText = PoweredByText.Value;
            obj.SiteURL = SiteURL.Value;
            obj.RoleName = RoleName.Value;



            List<int> CompaniesList = new List<int>();
            if (Companies.Value != null && Companies.Value != "")
            {
                CompaniesList = Companies.Value.Split(',').Select(x => int.Parse(x.Trim())).ToList();
                obj.Companies = CompaniesList;
            }
            else
            {
                obj.Companies = CompaniesList;
            }

            List<int> BranchesList = new List<int>();
            if (Branches.Value != null && Branches.Value != "")
            {
                BranchesList = Branches.Value.Split(',').Select(x => int.Parse(x.Trim())).ToList();
                obj.Branches = BranchesList;
            }
            else
            {
                obj.Branches = BranchesList;
            }


            //obj.LoginId = Convert.ToInt32(loginId.Value);
            //obj.ImagePath = imagePath.Value;
            //obj.MaxDiscountApproval = Convert.ToInt32(maxDiscountApproval.Value);
            //obj.EmployeeLevelID = Convert.ToInt32(EmployeeLevelID.Value);
            //if (designationId.Value != null && designationId.Value != "")
            //{
            //    obj.DesignationId = designationId.Value.Split(',').Select(x => int.Parse(x)).ToList();
            //}
            //else
            //{
            //    obj.DesignationId = new List<int>();
            //}
            //obj.DynamicMenu = dynamicMenu.Value;
            //obj.MaxApprovalAmount = Convert.ToDecimal(maxApprovalAmount.Value);
            //obj.MinApprovalAmount = Convert.ToDecimal(minApprovalAmount.Value);
            //obj.GeoLocation = Convert.ToInt32(geoLocation.Value);

            //List<decimal> maxApproveAmount = new List<decimal>();
            //if (maxApprovalAmount.Value != null && maxApprovalAmount.Value != "")
            //{
            //    maxApproveAmount = maxApprovalAmount.Value.Split(',').Select(x => decimal.Parse(x.Trim())).ToList();
            //    obj.MaxApprovalAmount = maxApproveAmount;
            //}

            //List<int> factoriesList = new List<int>();
            //if (factories.Value != null && factories.Value != "")
            //{
            //    factoriesList = factories.Value.Split(',').Select(x => int.Parse(x.Trim())).ToList();
            //    obj.Factories = factoriesList;
            //}
            //else
            //{

            //    obj.Factories = factoriesList;
            //}
            //List<int> teamList = new List<int>();
            //if (teams.Value != null && teams.Value != "")
            //{
            //    teamList = teams.Value.Split(',').Select(x => int.Parse(x.Trim())).ToList();
            //    obj.Teams = teamList;
            //}
            //else
            //{

            //    obj.Teams = teamList;
            //}

            //user = userClaim.Value;
            return obj;
        }

        public static ClaimDTO GetValidateToken(HttpRequest httpRequest)
        {
            string value = string.Empty;
            if (!httpRequest.Headers.ContainsKey("Authorization"))
            {
                return null;
            }

            string authHeader = httpRequest.Headers["Authorization"];
            ClaimDTO claimDTO = null;
            string token = authHeader;
            //if (authHeader !=n)
            //{
            //    token = Request.Headers.Authorization.Scheme.ToString() + " " + Request.Headers.Authorization.Parameter.ToString();
            //}
            //else
            //{
            //    return null;
            //}
            //if (authHeader != null)
            //{
            //    token = authHeader.ToString().Split(" ")[1];
            //}

            //var token = Request.Headers.Authorization.Parameter.ToString(); //GetValues("Authorization").FirstOrDefault();
            //if (token == null)
            //{
            //    token = Request.Headers.GetValues("Authorization").FirstOrDefault();
            //    if(token==null)
            //        return null;
            //}



            // string[] headerValues = token.Split(' ');
            //string generatedToken = null;
            if (token != null)
            {
                var item = GeneratedTokens.FirstOrDefault(kvp => kvp.Value == token);
                //if (GeneratedTokens.TryGetValue(headerValues[2], out generatedToken))
                //{
                //    generatedToken=GeneratedTokens[headerValues[2]];
                //}
                if (!item.Equals(default(KeyValuePair<string, string>)))
                {
                    GeneratedTokens.Remove(item.Key);
                }

            }

            claimDTO = TokenManager.ValidateToken(token);
            if (claimDTO == null)
            {
                return null;
            }

            return claimDTO;
        }

        public static string RemoveToken(string token)
        {
            var item = GeneratedTokens.FirstOrDefault(kvp => kvp.Value == token);
            if (!item.Equals(default(KeyValuePair<string, string>)))
            {
                GeneratedTokens.Remove(item.Key);
                return null;
            }
            else
            {
                return null;
            }

        }
    }
}
