using AccountERPClassLibraries;
using Microsoft.AspNetCore.Http;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;

namespace AccountERPApp.htputlty
{
    public class HttpUtility
    {
        public static async Task<object> CustomHttp(string BaseUrl, string Url, string content, HttpContext httpContext)
        {
            using (var client = new HttpClient())
            {

                client.BaseAddress = new Uri(BaseUrl);

                client.DefaultRequestHeaders
                      .Accept
                      .Add(new MediaTypeWithQualityHeaderValue("application/json"));

                HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Post, Url);
                if (!String.IsNullOrEmpty(httpContext.Session.GetString("authorization")))
                    request.Headers.Add("authorization", httpContext.Session.GetString("authorization"));
                request.Content = new StringContent(content, Encoding.UTF8, "application/json");

                HttpResponseMessage Res = await client.SendAsync(request);
                if (Res.IsSuccessStatusCode)
                {
                    var response = Res.Content.ReadAsStringAsync().Result;
                    var obj = JsonConvert.DeserializeObject<Response>(response);
                    httpContext.Session.SetString("authorization", obj.Token == null ? "" : obj.Token);
                    return response;
                }
                else
                    return null;
            }
        }
    }
}
