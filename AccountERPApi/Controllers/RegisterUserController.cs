using AccountERPApi.IServices;
using AccountERPApi.Utility;
using AccountERPClassLibraries;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace AccountERPApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RegisterUserController : ControllerBase
    {
        private readonly IRegisterUserService _registerUserService;
        public RegisterUserController(IRegisterUserService registerUserService)
        {
            _registerUserService = registerUserService;
        }
        [HttpPost("RegisterUser")]
        public Response RegisterUser(RegisterUser obj)
        {
            Response response = new Response();

            try
            {
                obj.CreatedOn = TimeZoneManager.GetDateTimeByTimeZone(TimeZonesStarndard.PakistanTimeZone);
                obj.CreatedByIP = Request.HttpContext.Connection.RemoteIpAddress.ToString();

                var res = _registerUserService.RegisterUser(obj);

                response.Status = 200;
                response.ResponseMsg = "Successfully created your account, Now please login with your credentials.";
                response.Data = res;
            
            }
            catch (Exception ex)
            {
                response.Status = ExceptionStatusCode.GetExceptionCode(ex);
                response.ResponseMsg = ex.Message;
            }

            return response;
        }
    }
}
