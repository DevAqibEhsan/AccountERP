#pragma checksum "E:\AccountERP\AccountERPApp\Views\Account\Login.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "76ca04bd21548cffebbd09c12af61dcdef1ab1bc"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Account_Login), @"mvc.1.0.view", @"/Views/Account/Login.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "E:\AccountERP\AccountERPApp\Views\_ViewImports.cshtml"
using AccountERPApp;

#line default
#line hidden
#nullable disable
#nullable restore
#line 2 "E:\AccountERP\AccountERPApp\Views\_ViewImports.cshtml"
using AccountERPApp.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"76ca04bd21548cffebbd09c12af61dcdef1ab1bc", @"/Views/Account/Login.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"61859c60a9fc6c2de1818466928a03645e301b22", @"/Views/_ViewImports.cshtml")]
    public class Views_Account_Login : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/mdbootstrap4/core.min.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/font_awesome/all.min.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/Account.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper;
        private global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("\r\n");
#nullable restore
#line 2 "E:\AccountERP\AccountERPApp\Views\Account\Login.cshtml"
  
    ViewData["Title"] = "Login";
    Layout = null;

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "76ca04bd21548cffebbd09c12af61dcdef1ab1bc4987", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "76ca04bd21548cffebbd09c12af61dcdef1ab1bc6101", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "76ca04bd21548cffebbd09c12af61dcdef1ab1bc7215", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"

<section class=""pb-4"">
    <div class=""bg-white border rounded-5"">

        <section class=""w-100 p-4 d-flex justify-content-center pb-4"">
            <div style=""width: 26rem;"">
                <!-- Pills navs -->
                <ul class=""nav nav-pills nav-justified mb-3"" id=""ex1"" role=""tablist"">
                    <li class=""nav-item"" role=""presentation"">
                        <a class=""nav-link active"" id=""tab-login"" data-mdb-toggle=""pill"" href=""javascript.void(0)"" role=""tab"" aria-controls=""pills-login"" aria-selected=""true"">Login</a>
                    </li>
                    <li class=""nav-item"" role=""presentation"">
                        <a class=""nav-link"" id=""tab-register"" data-mdb-toggle=""pill""");
            BeginWriteAttribute("href", " href=\"", 983, "\"", 1023, 1);
#nullable restore
#line 23 "E:\AccountERP\AccountERPApp\Views\Account\Login.cshtml"
WriteAttributeValue("", 990, Url.Action("Register","Account"), 990, 33, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(@" role=""tab"" aria-controls=""pills-register"" aria-selected=""false"" tabindex=""-1"">Register</a>
                    </li>
                </ul>
                <!-- Pills navs -->
                <!-- Pills content -->
                <div class=""tab-content"">
                    <div class=""tab-pane fade active show"" id=""pills-login"" role=""tabpanel"" aria-labelledby=""tab-login"">
                        ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "76ca04bd21548cffebbd09c12af61dcdef1ab1bc9887", async() => {
                WriteLiteral(@"
                            <div class=""text-center mb-3"">
                                <p>Sign in with:</p>
                                <button type=""button"" class=""btn btn-link btn-floating mx-1"">
                                    <i class=""fab fa-facebook-f""></i>
                                </button>

                                <button type=""button"" class=""btn btn-link btn-floating mx-1"">
                                    <i class=""fab fa-google""></i>
                                </button>

                                <button type=""button"" class=""btn btn-link btn-floating mx-1"">
                                    <i class=""fab fa-twitter""></i>
                                </button>

                                <button type=""button"" class=""btn btn-link btn-floating mx-1"">
                                    <i class=""fab fa-github""></i>
                                </button>
                            </div>

                            <p class=""t");
                WriteLiteral(@"ext-center"">or:</p>

                            <!-- Email input -->
                            <div class=""form-outline mb-4"">
                                <input type=""email"" id=""loginName"" class=""form-control"" style=""background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASCAYAAABSO15qAAAAAXNSR0IArs4c6QAAAPhJREFUOBHlU70KgzAQPlMhEvoQTg6OPoOjT+JWOnRqkUKHgqWP4OQbOPokTk6OTkVULNSLVc62oJmbIdzd95NcuGjX2/3YVI/Ts+t0WLE2ut5xsQ0O+90F6UxFjAI8qNcEGONia08e6MNONYwCS7EQAizLmtGUDEzTBNd1fxsYhjEBnHPQNG3KKTYV34F8ec/zwHEciOMYyrIE3/ehKAqIoggo9inGXKmFXwbyBkmSQJqmUNe15IRhCG3byphitm1/eUzDM4qR0TTNjEixGdAnSi3keS5vSk2UDKqqgizLqB4YzvassiKhGtZ/jDMtLOnHz7TE+yf8BaDZXA509yeBAAAAAElFTkSuQmCC&quot;); background-repeat: no-repeat; background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%; cursor: auto;"">
                                <label class=""form-label"" for=""loginName"" style=""margin-left: 0px;"">Email or username</label>
                                <div class=""form-");
                WriteLiteral(@"notch"">
                                    <div class=""form-notch-leading"" style=""width: 9px;""></div>
                                    <div class=""form-notch-middle"" style=""width: 114.4px;""></div>
                                    <div class=""form-notch-trailing""></div>
                                </div>
                            </div>

                            <!-- Password input -->
                            <div class=""form-outline mb-4"">
                                <input type=""password"" id=""loginPassword"" class=""form-control"" style=""background-image: url(&quot;data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAASCAYAAABSO15qAAAAAXNSR0IArs4c6QAAAPhJREFUOBHlU70KgzAQPlMhEvoQTg6OPoOjT+JWOnRqkUKHgqWP4OQbOPokTk6OTkVULNSLVc62oJmbIdzd95NcuGjX2/3YVI/Ts+t0WLE2ut5xsQ0O+90F6UxFjAI8qNcEGONia08e6MNONYwCS7EQAizLmtGUDEzTBNd1fxsYhjEBnHPQNG3KKTYV34F8ec/zwHEciOMYyrIE3/ehKAqIoggo9inGXKmFXwbyBkmSQJqmUNe15IRhCG3byphitm1/eUzDM4qR0TTNjEixGdAnSi3keS5vSk2UDKqqgizLqB4YzvassiKhGtZ/jDMtLOnHz7TE+yf8BaD");
                WriteLiteral(@"ZXA509yeBAAAAAElFTkSuQmCC&quot;); background-repeat: no-repeat; background-attachment: scroll; background-size: 16px 18px; background-position: 98% 50%; cursor: auto;"">
                                <label class=""form-label"" for=""loginPassword"" style=""margin-left: 0px;"">Password</label>
                                <div class=""form-notch""><div class=""form-notch-leading"" style=""width: 9px;""></div><div class=""form-notch-middle"" style=""width: 64.8px;""></div><div class=""form-notch-trailing""></div></div>
                            </div>

                            <!-- 2 column grid layout -->
                            <div class=""row mb-4"">
                                <div class=""col-md-6 d-flex justify-content-center"">
                                    <!-- Checkbox -->
                                    <div class=""form-check mb-3 mb-md-0"">
                                        <input class=""form-check-input"" type=""checkbox""");
                BeginWriteAttribute("value", " value=\"", 5476, "\"", 5484, 0);
                EndWriteAttribute();
                WriteLiteral(" id=\"loginCheck\"");
                BeginWriteAttribute("checked", " checked=\"", 5501, "\"", 5511, 0);
                EndWriteAttribute();
                WriteLiteral(@">
                                        <label class=""form-check-label"" for=""loginCheck""> Remember me </label>
                                    </div>
                                </div>

                                <div class=""col-md-6 d-flex justify-content-center"">
                                    <!-- Simple link -->
                                    <a");
                BeginWriteAttribute("href", " href=\"", 5895, "\"", 5941, 1);
#nullable restore
#line 82 "E:\AccountERP\AccountERPApp\Views\Account\Login.cshtml"
WriteAttributeValue("", 5902, Url.Action("ForgotPassword","Account"), 5902, 39, false);

#line default
#line hidden
#nullable disable
                EndWriteAttribute();
                WriteLiteral(">Forgot password?</a>\r\n                                </div>\r\n                            </div>\r\n\r\n                            <!-- Submit button -->\r\n");
                WriteLiteral("                            <a");
                BeginWriteAttribute("href", " href=\"", 6236, "\"", 6279, 1);
#nullable restore
#line 88 "E:\AccountERP\AccountERPApp\Views\Account\Login.cshtml"
WriteAttributeValue("", 6243, Url.Action("Dashboard","Dashboard"), 6243, 36, false);

#line default
#line hidden
#nullable disable
                EndWriteAttribute();
                WriteLiteral(" class=\"btn btn-primary btn-block mb-4\">Sign in</a>\r\n\r\n                            <!-- Register buttons -->\r\n                            <div class=\"text-center\">\r\n                                <p>Not a member? <a");
                BeginWriteAttribute("href", " href=\"", 6496, "\"", 6536, 1);
#nullable restore
#line 92 "E:\AccountERP\AccountERPApp\Views\Account\Login.cshtml"
WriteAttributeValue("", 6503, Url.Action("Register","Account"), 6503, 33, false);

#line default
#line hidden
#nullable disable
                EndWriteAttribute();
                WriteLiteral(">Register</a></p>\r\n                            </div>\r\n                        ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n                    </div>\r\n                </div>\r\n                <!-- Pills content -->\r\n            </div>\r\n        </section>\r\n\r\n    </div>\r\n</section>\r\n");
        }
        #pragma warning restore 1998
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; }
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; }
    }
}
#pragma warning restore 1591
