#pragma checksum "E:\AccountERP\AccountERPApp\Views\AccountsManagement\JournalEntry.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "5a1f743d05c37c77c1ca8bff5c9e901c313e531f"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_AccountsManagement_JournalEntry), @"mvc.1.0.view", @"/Views/AccountsManagement/JournalEntry.cshtml")]
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
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"5a1f743d05c37c77c1ca8bff5c9e901c313e531f", @"/Views/AccountsManagement/JournalEntry.cshtml")]
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"61859c60a9fc6c2de1818466928a03645e301b22", @"/Views/_ViewImports.cshtml")]
    public class Views_AccountsManagement_JournalEntry : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/CommonStyle.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/Common.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_3 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/AccountsManagement/JournalEntry.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_4 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("id", new global::Microsoft.AspNetCore.Html.HtmlString("ManageJournalEntryForm"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
#line 2 "E:\AccountERP\AccountERPApp\Views\AccountsManagement\JournalEntry.cshtml"
  
    ViewData["Title"] = "Journal Entry";

#line default
#line hidden
#nullable disable
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "5a1f743d05c37c77c1ca8bff5c9e901c313e531f5432", async() => {
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
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "5a1f743d05c37c77c1ca8bff5c9e901c313e531f6546", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "5a1f743d05c37c77c1ca8bff5c9e901c313e531f7585", async() => {
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_3);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral(@"

<style>

    #form {
        display: none;
    }

    .card-header .btnsection {
        display: inline-block;
        float: right;
    }
</style>

<script type=""text/javascript"">

    $(document).ready(function () {

        $(""#btnAddJournalEntry"").click(function () {
            FormShow(); $('#dataTableJournalEntryDetail').dataTable({
                ""bSort"": false
            }); $(""#dataTableJournalEntryDetail_length"").hide(); $(""#dataTableJournalEntryDetail_filter"").hide(); $(""#dataTableJournalEntryDetail_info"").hide(); $(""#dataTableJournalEntryDetail_paginate"").hide(); });

        $(""#btnCancel"").click(function () { CancelButtonAction(); });

        RemoveSortingClass('tblAction');

    });

</script>

<div class=""maincontent"">

");
            WriteLiteral("    <div id=\"grid\" class=\"card\">\r\n        <div class=\"card-header\">\r\n            <div class=\"dvPageHeading\">");
#nullable restore
#line 44 "E:\AccountERP\AccountERPApp\Views\AccountsManagement\JournalEntry.cshtml"
                                  Write(ViewData["Title"]);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"</div>
            <div class=""btnsection"">
                <button type=""button"" id=""btnAddJournalEntry"" class=""btn btn-success1""><i class=""fa fa-plus"" style=""margin-right: 10px;""></i> Add</button>
            </div>
        </div>
        <div class=""card-body"">
            <div id=""dvDataTable"">
                <table id=""dataTableJournalEntry"" class=""display"" style=""width:100%"">
                    <thead>
                        <tr>
                            <th class=""text-center"">S.No</th>
                            <th class=""text-center"">Company Name</th>
                            <th class=""text-center"">Debit</th>
                            <th class=""text-center"">Credit</th>
                            <th class=""text-center"">Memo</th>
                            <th class=""text-center"">Attachment</th>
                            <th class=""text-center"">Created User</th>
                            <th class=""text-center"">Created On</th>
                            <th clas");
            WriteLiteral(@"s=""text-center"">Created User IP</th>
                            <th class=""text-center"">Last User</th>
                            <th class=""text-center"">Last Modified</th>
                            <th class=""text-center"">Last User IP</th>
                            <th class=""text-center"" id=""tblAction"">Action</th>
                        </tr>
                    </thead>
                    <tbody id=""dataRow"">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
");
            WriteLiteral("\r\n");
            WriteLiteral("    <div id=\"form\" class=\"card\">\r\n        <div class=\"card-header\">\r\n            <div class=\"dvPageHeading\">");
#nullable restore
#line 80 "E:\AccountERP\AccountERPApp\Views\AccountsManagement\JournalEntry.cshtml"
                                  Write(ViewData["Title"]);

#line default
#line hidden
#nullable disable
            WriteLiteral("</div>\r\n        </div>\r\n        <div class=\"card-body\">\r\n            ");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("form", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "5a1f743d05c37c77c1ca8bff5c9e901c313e531f11977", async() => {
                WriteLiteral(@"
                <input type=""hidden"" name=""hdnJournalEntryID"" id=""hdnJournalEntryID"" value=""0"" />
                <input type=""hidden"" name=""hdnJournalEntryDetailCount"" id=""hdnJournalEntryDetailCount"" value=""1"" />

                <div id=""dvDataTableJournalEntryDetail"" style="" display: block; width: 100%; overflow-x: auto;"">
                    <table id=""dataTableJournalEntryDetail"" class=""display"" style=""width: 100%; table-layout: fixed;"">
                        <thead>
                            <tr>
                                <th style="" width: 50px;"" class=""text-center"">S.No</th>
                                <th style=""width: 222px;"" class=""text-center"">Account Code</th>
                                <th style=""width: 200px;"" class=""text-center"">Description</th>
                                <th style=""width: 108px;"" class=""text-center"">Debit</th>
                                <th style=""width: 117px;"" class=""text-center"">Credit</th>
                                <th styl");
                WriteLiteral(@"e=""width: 152px;"" class=""text-center"">Created User</th>
                                <th style=""width: 152px;"" class=""text-center"">Created On</th>
                                <th style=""width: 152px;"" class=""text-center"">Created User IP</th>
                                <th style=""width: 152px;"" class=""text-center"">Last User</th>
                                <th style=""width: 152px;"" class=""text-center"">Last Modified</th>
                                <th style=""width: 152px;"" class=""text-center"">Last User IP</th>
                                <th style=""width: 152px;"" class=""text-center"" id=""tblAction"">Action</th>
                            </tr>
                        </thead>
                        <tbody id=""JournalEntryDetaildataRow"">
                            <tr class=""clsRowJournalEntryDetail"" id=""JournalEntryRowCount_1"">
                                <td>1</td>
                                <td><select id=""ddlSubAccountID_1"" class=""form-control""></select></td>
 ");
                WriteLiteral(@"                               <td><input type=""text"" class=""form-control"" id=""txtDescription_1"" placeholder=""Description""></td>
                                <td><input type=""text"" class=""form-control txtDebitField"" id=""txtDebit_1"" placeholder=""Debit Amount""></td>
                                <td><input type=""text"" class=""form-control txtCreditField"" id=""txtCredit_1"" placeholder=""Credit Amount""></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id=""JournalEntryDebitCreditRow"">
                                <td></td>
                                <td>Total</td>
                                <td></td>
                                <td id=""tdDebitTotal"">0.00</td>
          ");
                WriteLiteral(@"                      <td id=""tdCreditTotal"">0.00</td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id=""JournalEntryAddMoreRow"">
                                <td><button type=""button"" id=""btnAddJournalEntryDetailAddMoreRow"" class=""btn btn-success1""><i class=""fa fa-plus""></i></button></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                  ");
                WriteLiteral(@"              <td></td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <br />
                <br />
                <div class=""form-row"">
                    <div class=""form-group col-md-6"">
                        <label for=""txtMemo"">Memo</label>
                        <input type=""text"" class=""form-control"" id=""txtMemo"" placeholder=""Journal Entry Memo"">
                    </div>

                    <div class=""form-group col-md-6"">
                        <label for=""txtAttachment"">Attachment</label>
                        <input type=""file"" class=""form-control"" id=""txtAttachment"" placeholder=""Attachment"">
                    </div>
                </div>

                <div id=""dvLogo"" class=""form-row"" style=""display:none;"">
                    <div class=""form-group col-md-6"">
                        <input type=""hidden"" id=""hdnUploadedURL"" />");
                WriteLiteral(@"
                        <button type=""button"" class=""btn btn-primary1"" id=""lnkViewLogo"">View Logo</button>
                    </div>
                </div>

                <div class=""btnsection"">
                    <button type=""button"" class=""btn btn-primary1"" id=""btnSave"">Save</button>
                    <button type=""button"" id=""btnCancel"" class=""btn btn-secondary1""><i class=""fa fa-close"" style=""margin-right: 10px;""></i>Cancel</button>
                </div>
            ");
            }
            );
            __Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.FormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_FormTagHelper);
            __Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.TagHelpers.RenderAtEndOfFormTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_TagHelpers_RenderAtEndOfFormTagHelper);
            __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_4);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n        </div>\r\n    </div>\r\n");
            WriteLiteral(@"
</div>

<script type=""text/x-handlebars"" id=""temp_ddlSubAccountID_1"">
    <option value=""0"">Plesae Select</option>
    {{#each this}}
<option value=""{{AccountID}}"">{{AccountCode}}  {{AccountByCompanyBranchName}}</option>
    {{/each}}
</script>

");
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
