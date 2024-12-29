let Form = "#ManageCompanyForm";
let btnSave = "#btnSave"
let hdnCompanyID = "#hdnCompanyID";
let txtCompanyName = "#txtCompanyName";
let ddlBusinessTypeID = "#ddlBusinessTypeID";
let ddlTimeZoneID = "#ddlTimeZoneID";
let txtNoOfUsers = "#txtNoOfUsers";
let txtPostalAddress1 = "#txtPostalAddress1";
let txtPostalAddress2 = "#txtPostalAddress2";
let txtPostalPhone = "#txtPostalPhone";
let ddlPostalCountryID = "#ddlPostalCountryID";
let ddlPostalStateID = "#ddlPostalStateID";
let ddlPostalCityID = "#ddlPostalCityID";
let txtBillingAddress1 = "#txtBillingAddress1";
let txtBillingAddress2 = "#txtBillingAddress2";
let txtBillingPhone = "#txtBillingPhone";
let ddlBillingCountryID = "#ddlBillingCountryID";
let ddlBillingStateID = "#ddlBillingStateID";
let ddlBillingCityID = "#ddlBillingCityID";
let txtPostalZipCode = "#txtPostalZipCode";
let txtBillingZipCode = "#txtBillingZipCode";
let txtCompanyLogo = "#txtCompanyLogo";
let txtNTN = "#txtNTN";
let txtSTN = "#txtSTN";
let txtWebsiteURL = "#txtWebsiteURL";
let txtPOSID = "#txtPOSID";
let ddlIsAllowPowerBy = "#ddlIsAllowPowerBy";
let txtPoweredBy = "#txtPoweredBy";
let DataTable = "#dataTableCompany";
let State_arr = [];
let City_arr = [];

let table_header_bg_color = "#table-header-bg-color";
let table_header_text_color = "#table-header-text-color";
let pagination_button_bg_color = "#pagination-button-bg-color";
let pagination_button_text_color = "#pagination-button-text-color";
let pagination_button_bg_color_hover = "#pagination-button-bg-color-hover";
let pagination_button_text_color_hover = "#pagination-button-text-color-hover";
let pagination_button_next_bg_color_hover = "#pagination-button-next-bg-color-hover";
let no_of_entries_text_color = "#no-of-entries-text-color";
let page_heading_color = "#page-heading-color";
let btn_success_color = "#btn-success-color";
let btn_success_border_color = "#btn-success-border-color";
let btn_success_bg_color = "#btn-success-bg-color";
let btn_success_color_hover = "#btn-success-color-hover";
let btn_success_border_color_hover = "#btn-success-border-color-hover";
let btn_success_bg_color_hover = "#btn-success-bg-color-hover";
let btn_success_disable_color = "#btn-success-disable-color";
let btn_success_disable_bg_color = "#btn-success-disable-bg-color";
let btn_success_disable_border_color = "#btn-success-disable-border-color";
let btn_primary_color = "#btn-primary-color";
let btn_primary_border_color = "#btn-primary-border-color";
let btn_primary_bg_color = "#btn-primary-bg-color";
let btn_primary_color_hover = "#btn-primary-color-hover";
let btn_primary_border_color_hover = "#btn-primary-border-color-hover";
let btn_primary_bg_color_hover = "#btn-primary-bg-color-hover";
let btn_primary_disable_color = "#btn-primary-disable-color";
let btn_primary_disable_bg_color = "#btn-primary-disable-bg-color";
let btn_primary_disable_border_color = "#btn-primary-disable-border-color";
let btn_secondary_color = "#btn-secondary-color";
let btn_secondary_border_color = "#btn-secondary-border-color";
let btn_secondary_bg_color = "#btn-secondary-bg-color";
let btn_secondary_color_hover = "#btn-secondary-color-hover";
let btn_secondary_border_color_hover = "#btn-secondary-border-color-hover";
let btn_secondary_bg_color_hover = "#btn-secondary-bg-color-hover";
let btn_secondary_disable_color = "#btn-secondary-disable-color";
let btn_secondary_disable_bg_color = "#btn-secondary-disable-bg-color";
let btn_secondary_disable_border_color = "#btn-secondary-disable-border-color";

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllCompany();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadCompany", function () {

        $(DataTable).DataTable().destroy();

        GetAllCompany();

    });

    $(btnSave).click(function () {
        SaveCompanyData();
    });

    $(ddlPostalCountryID).change(function (e) {

        var PostalCountryID = Number($(ddlPostalCountryID).val());
        if (PostalCountryID != 0) {
            GetAllPostalState(PostalCountryID);
        }
    });

    $(ddlPostalStateID).change(function (e) {

        var PostalStateID = Number($(ddlPostalStateID).val());
        if (PostalStateID != 0) {
            GetAllPostalCity(PostalStateID);
        }
    });

    $(ddlBillingCountryID).change(function (e) {

        var BillingCountryID = Number($(ddlBillingCountryID).val());
        if (BillingCountryID != 0) {
            GetAllBillingState(BillingCountryID);
        }
    });

    $(ddlBillingStateID).change(function (e) {

        var BillingStateID = Number($(ddlBillingStateID).val());
        if (BillingStateID != 0) {
            GetAllBillingCity(BillingStateID);
        }
    });

    $(lnkViewLogo).click(function () {
        ViewSiteLogo();
    });

    AdminGridSectionColorPickerLoad();

});

function GetAllPostalState(PostalCountryID) {
    let objPostalState = State_arr.filter(function (e2) {
        return e2.CountryID == PostalCountryID;
    });

    fillData(objPostalState, "#temp_ddlPostalStateID", ddlPostalStateID, false);
}

function GetAllPostalCity(PostalStateID) {
    let objPostalCity = City_arr.filter(function (e2) {
        return e2.StateID == PostalStateID;
    });

    fillData(objPostalCity, "#temp_ddlPostalCityID", ddlPostalCityID, false);
}

function GetAllBillingState(BillingCountryID) {
    let objBillingState = State_arr.filter(function (e2) {
        return e2.CountryID == BillingCountryID;
    });

    fillData(objBillingState, "#temp_ddlBillingStateID", ddlBillingStateID, false);
}

function GetAllBillingCity(BillingStateID) {
    let objBillingCity = City_arr.filter(function (e2) {
        return e2.StateID == BillingStateID;
    });

    fillData(objBillingCity, "#temp_ddlBillingCityID", ddlBillingCityID, false);
}

function GetCompanyByID(id) {

    postRequest(BaseUrl + "/SystemManagement/GetCompanyByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnCompanyID).val(res.Data.CompanyID);
                $(txtCompanyName).val(res.Data.CompanyName);
                $(ddlBusinessTypeID).val(res.Data.BusinessTypeID);
                $(ddlTimeZoneID).val(res.Data.TimeZoneID);
                $(txtNoOfUsers).val(res.Data.NoOfUsers);
                $(txtPostalAddress1).val(res.Data.PostalAddress1);
                $(txtPostalAddress2).val(res.Data.PostalAddress2);
                $(txtPostalPhone).val(res.Data.PostalPhone);
                $(ddlPostalCountryID).val(res.Data.PostalCountryID);
                GetAllPostalState(res.Data.PostalCountryID);
                $(ddlPostalStateID).val(res.Data.PostalStateID);
                GetAllPostalCity(res.Data.PostalStateID);
                $(ddlPostalCityID).val(res.Data.PostalCityID);
                $(txtBillingAddress1).val(res.Data.BillingAddress1);
                $(txtBillingAddress2).val(res.Data.BillingAddress2);
                $(txtBillingPhone).val(res.Data.BillingPhone);
                $(ddlBillingCountryID).val(res.Data.BillingCountryID);
                GetAllBillingState(res.Data.BillingCountryID);
                $(ddlBillingStateID).val(res.Data.BillingStateID);
                GetAllBillingCity(res.Data.BillingStateID);
                $(ddlBillingCityID).val(res.Data.BillingCityID);
                $(txtPostalZipCode).val(res.Data.PostalZipCode);
                $(txtBillingZipCode).val(res.Data.BillingZipCode);
                
                $(txtNTN).val(res.Data.NTN);
                $(txtSTN).val(res.Data.STN);
                $(txtWebsiteURL).val(res.Data.WebsiteURL);
                $(txtPOSID).val(res.Data.POSID);
                $(ddlIsAllowPowerBy).val(res.Data.IsAllowPowerBy);
                $(txtPoweredBy).val(res.Data.PoweredBy);

                if (res.Data.CompanyLogo != null && res.Data.CompanyLogo != "") {
                    $(hdnUploadedURL).val(".././CompanyMedia/" + res.Data.CompanyLogo);
                    $("#dvLogo").show();
                }
               
                if (res.Data.SiteThemeSetting != null) {
                    AdminGridFilColorTextboxWithValue(res.Data.SiteThemeSetting);
                }
                else {
                    $("#chkIsDefaultThemeSetting").prop("checked", true);
                }

                SetAdminGridIframeCSS();
                $("#iFrameSection2").show();
                FormShow();
            }
        }
        else if (res.Status == 401) {
            localStorage.removeItem("userData");
            localStorage.removeItem("Menu");

            window.location.href = baseWebUrl + "Account/Login";
        }
        else if (res.Status == 403) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.statusCode == 404) {
            ErrorAlert(res.reasonPhrase);
        }
        else if (res.Status == 320) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 500) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 600) {
            ErrorAlert(res.ResponseMsg);
        }
        else {
            ErrorAlert(res.ResponseMsg);
        }
    });
}

function GetAllCompany() {

    GetAllBusinessType_TimeZone_Country_State_City_Data();

    oTable = $(DataTable).DataTable({

        "lengthChange": true,
        "processing": false, // for show progress bar
        "serverSide": false, // for process server side
        "filter": true, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "pageLength": 10,
        "orderClasses": false,
        "aaSorting": [
            [0, 'desc']
        ],
        //"initComplete": function (settings, json) {
        //    HideKeys();
        //},

        "ajax": {
            "url": BaseUrl + "/SystemManagement/GetAllCompany",
            "type": "POST",
            "datatype": "json",
            'beforeSend': function (request) {

            },
            "dataSrc": function (data) {
                if (data.Status == 200) {

                }

                else if (data.Status == 401) {
                    localStorage.removeItem("userData");
                    localStorage.removeItem("Menu");

                    window.location.href = baseWebUrl + "Account/Login";
                }
                else if (data.Status == 403) {
                    ErrorAlert(res.ResponseMsg);
                }
                else if (data.statusCode == 404) {
                    ErrorAlert(res.reasonPhrase);
                }
                else if (data.Status == 320) {
                    ErrorAlert(res.ResponseMsg);
                }
                else if (data.Status == 500) {
                    ErrorAlert(res.ResponseMsg);
                }
                else if (data.Status == 600) {
                    ErrorAlert(res.ResponseMsg);
                }
                else {
                    ErrorAlert(data.ResponseMsg);
                }

                return data.Data;
            }
        },

        "columnDefs": [
            {
                "targets": [31],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "CompanyID",
                "name": "CompanyID",
                "width": "110px",
                "render": function (data, type, full, meta) { return '<a href="javascript:;" onclick="GetCompanyByID(' + full.CompanyID + ')" data-id="' + full.CompanyID + '">' + full.CompanyCode + '</a>' }
            },
            {
                "data": "CompanyName",
                "name": "CompanyName",
                "width": "200px"
            },
            {
                "data": "BusinessTypeName",
                "name": "BusinessTypeName",
                "width": "200px"
            },
            {
                "data": "TimeZoneName",
                "name": "TimeZoneName",
                "width": "200px"
            },
            
            {
                "data": "PostalAddress1",
                "name": "PostalAddress1",
                "width": "200px"
            },
            {
                "data": "PostalAddress2",
                "name": "PostalAddress2",
                "width": "200px"
            },
            {
                "data": "PostalPhone",
                "name": "PostalPhone",
                "width": "200px"
            },
            {
                "data": "PostalCountryName",
                "name": "PostalCountryName",
                "width": "200px"
            },
            {
                "data": "PostalStateName",
                "name": "PostalStateName",
                "width": "200px"
            },
            {
                "data": "PostalCityName",
                "name": "PostalCityName",
                "width": "200px"
            },
            {
                "data": "PostalZipCode",
                "name": "PostalZipCode",
                "width": "200px"
            },
            {
                "data": "BillingAddress1",
                "name": "BillingAddress1",
                "width": "200px"
            },
            {
                "data": "BillingAddress2",
                "name": "BillingAddress2",
                "width": "200px"
            },
            {
                "data": "BillingPhone",
                "name": "BillingPhone",
                "width": "200px"
            },
            {
                "data": "BillingCountryName",
                "name": "BillingCountryName",
                "width": "200px"
            },
            {
                "data": "BillingStateName",
                "name": "BillingStateName",
                "width": "200px"
            },
            {
                "data": "BillingCityName",
                "name": "BillingCityName",
                "width": "200px"
            },
            {
                "data": "BillingZipCode",
                "name": "BillingZipCode",
                "width": "200px"
            },
            {
                "data": "CompanyLogo",
                "name": "CompanyLogo",
                "width": "200px",
                "render": function (data) {
                    return (data != null ? "<a href='.././CompanyMedia/" + data + "' target='blank'>View Logo</a>" : "-")
                }
            },
            {
                "data": "NTN",
                "name": "NTN",
                "width": "200px"
            },
            {
                "data": "STN",
                "name": "STN",
                "width": "200px"
            },
            {
                "data": "WebsiteURL",
                "name": "WebsiteURL",
                "width": "200px"
            },
            {
                "data": "POSID",
                "name": "POSID",
                "width": "200px"
            },
            
            {
                "data": "NoOfUsers",
                "name": "NoOfUsers",
                "width": "200px"
            },
            {
                "data": "IsAllowPowerBy",
                "name": "IsAllowPowerBy",
                "width": "200px",
                "render": function (data) {
                    return (data == 1 ? "Yes" : "No")
                }
            },
            {
                "data": "PoweredBy",
                "name": "PoweredBy",
                "width": "200px"
            },
            {
                "data": "CreatedByUserName",
                "name": "CreatedByUserName",
                "width": "200px"
            },
            {
                "data": "CreatedOn",
                "name": "CreatedOn",
                "width": "175px",
                "render": function (data) {
                    return MomentDateTimeFormat(data);
                }
            },
            {
                "data": "CreatedByIP",
                "name": "CreatedByIP",
                "width": "200px",
                "render": function (data) {
                    return (data != null ? data : "-")
                }
            },
            {
                "data": "ModifiedByUserName",
                "name": "ModifiedByUserName",
                "width": "200px"
            },
            {
                "data": "ModifiedOn",
                "name": "ModifiedOn",
                "width": "175px",
                "render": function (data) {
                    return MomentDateTimeFormat(data);
                }
            },
            {
                "data": "ModifiedByIP",
                "name": "ModifiedByIP",
                "width": "200px",
                "render": function (data) {
                    return (data != null ? data : "-")
                }
            },
            {
                "width": "75px",
                "render": function (data, type, full, meta) {
                    return "<i class='fas fa-edit' onclick='GetCompanyByID(" + full.CompanyID + ")' data-id='" + full.CompanyID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveCompanyData() {
    $(btnSave).prop("disabled", true);

    let ThemeObj = {
        table_header_bg_color: $(table_header_bg_color).val(),
        table_header_text_color: $(table_header_text_color).val(),
        pagination_button_bg_color: $(pagination_button_bg_color).val(),
        pagination_button_text_color: $(pagination_button_text_color).val(),
        pagination_button_bg_color_hover: $(pagination_button_bg_color_hover).val(),
        pagination_button_text_color_hover: $(pagination_button_text_color_hover).val(),
        pagination_button_next_bg_color_hover: $(pagination_button_next_bg_color_hover).val(),
        no_of_entries_text_color: $(no_of_entries_text_color).val(),
        page_heading_color: $(page_heading_color).val(),
        btn_success_color: $(btn_success_color).val(),
        btn_success_border_color: $(btn_success_border_color).val(),
        btn_success_bg_color: $(btn_success_bg_color).val(),
        btn_success_color_hover: $(btn_success_color_hover).val(),
        btn_success_border_color_hover: $(btn_success_border_color_hover).val(),
        btn_success_bg_color_hover: $(btn_success_bg_color_hover).val(),
        btn_success_disable_color: $(btn_success_disable_color).val(),
        btn_success_disable_bg_color: $(btn_success_disable_bg_color).val(),
        btn_success_disable_border_color: $(btn_success_disable_border_color).val(),
        btn_primary_color: $(btn_primary_color).val(),
        btn_primary_border_color: $(btn_primary_border_color).val(),
        btn_primary_bg_color: $(btn_primary_bg_color).val(),
        btn_primary_color_hover: $(btn_primary_color_hover).val(),
        btn_primary_border_color_hover: $(btn_primary_border_color_hover).val(),
        btn_primary_bg_color_hover: $(btn_primary_bg_color_hover).val(),
        btn_primary_disable_color: $(btn_primary_disable_color).val(),
        btn_primary_disable_bg_color: $(btn_primary_disable_bg_color).val(),
        btn_primary_disable_border_color: $(btn_primary_disable_border_color).val(),
        btn_secondary_color: $(btn_secondary_color).val(),
        btn_secondary_border_color: $(btn_secondary_border_color).val(),
        btn_secondary_bg_color: $(btn_secondary_bg_color).val(),
        btn_secondary_color_hover: $(btn_secondary_color_hover).val(),
        btn_secondary_border_color_hover: $(btn_secondary_border_color_hover).val(),
        btn_secondary_bg_color_hover: $(btn_secondary_bg_color_hover).val(),
        btn_secondary_disable_color: $(btn_secondary_disable_color).val(),
        btn_secondary_disable_bg_color: $(btn_secondary_disable_bg_color).val(),
        btn_secondary_disable_border_color: $(btn_secondary_disable_border_color).val()
    };

    let CompanyID = Number($(hdnCompanyID).val());

    if (CheckboxIsChecked("chkIsDefaultThemeSetting") == 1) {
        ThemeObj = null;
    }

    var formData = new FormData();

    formData.append("CompanyID", CompanyID);
    formData.append("CompanyName", $(txtCompanyName).val());
    formData.append("BusinessTypeID", Number($(ddlBusinessTypeID).val()));
    formData.append("TimeZoneID", Number($(ddlTimeZoneID).val()));
    formData.append("NoOfUsers", Number($(txtNoOfUsers).val()));
    formData.append("PostalAddress1", $(txtPostalAddress1).val());
    formData.append("PostalAddress2", $(txtPostalAddress2).val());
    formData.append("PostalPhone", $(txtPostalPhone).val());
    formData.append("PostalCountryID", Number($(ddlPostalCountryID).val()));
    formData.append("PostalStateID", Number($(ddlPostalStateID).val()));
    formData.append("PostalCityID", Number($(ddlPostalCityID).val()));
    formData.append("BillingAddress1", $(txtBillingAddress1).val());
    formData.append("BillingAddress2", $(txtBillingAddress2).val());
    formData.append("BillingPhone", $(txtBillingPhone).val());
    formData.append("BillingCountryID", Number($(ddlBillingCountryID).val()));
    formData.append("BillingStateID", Number($(ddlBillingStateID).val()));
    formData.append("BillingCityID", Number($(ddlBillingCityID).val()));
    formData.append("PostalZipCode", $(txtPostalZipCode).val());
    formData.append("BillingZipCode", $(txtBillingZipCode).val());
    formData.append("file", $(txtCompanyLogo)[0].files[0]);
    formData.append("NTN", $(txtNTN).val());
    formData.append("STN", $(txtSTN).val());
    formData.append("WebsiteURL", $(txtWebsiteURL).val());
    formData.append("POSID", $(txtPOSID).val());
    formData.append("IsAllowPowerBy", Number($(ddlIsAllowPowerBy).val()));
    formData.append("PoweredBy", $(txtPoweredBy).val());
    formData.append("SiteThemeSetting", JSON.stringify(ThemeObj));

    if (CompanyID > 0) {
        postRequestFormData(baseApiUrl + "api/ManageCompany/UpdateCompany", formData, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    SuccessAlertWithConfirmAndCancelButtonActionFuncExecute(res.ResponseMsg);
                }
            }
            else if (res.Status == 401) {
                ErrorAlertWithConfirmAndOpenURL(res.ResponseMsg, baseWebUrl + "Account/Login");
            }
            else if (res.Status == 403) {
                ErrorAlert(res.ResponseMsg);
            }
            else if (res.statusCode == 404) {
                ErrorAlert(res.reasonPhrase);
            }
            else if (res.Status == 320) {
                ErrorAlert(res.ResponseMsg);
            }
            else if (res.Status == 500) {
                ErrorAlert(res.ResponseMsg);
            }
            else if (res.Status == 600) {
                ErrorAlert(res.ResponseMsg);
            }
            else {
                ErrorAlert(res.ResponseMsg);
            }
        });
    }
    else {
        postRequestFormData(baseApiUrl + "api/ManageCompany/AddCompany", formData, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    SuccessAlertWithConfirmAndCancelButtonActionFuncExecute(res.ResponseMsg);
                }
            }
            else if (res.Status == 401) {
                localStorage.removeItem("userData");
                localStorage.removeItem("Menu");

                window.location.href = baseWebUrl + "Account/Login";
            }
            else if (res.Status == 403) {
                ErrorAlert(res.ResponseMsg);
            }
            else if (res.statusCode == 404) {
                ErrorAlert(res.reasonPhrase);
            }
            else if (res.Status == 320) {
                ErrorAlert(res.ResponseMsg);
            }
            else if (res.Status == 500) {
                ErrorAlert(res.ResponseMsg);
            }
            else if (res.Status == 600) {
                ErrorAlert(res.ResponseMsg);
            }
            else {
                ErrorAlert(res.ResponseMsg);
            }
        });
    }
    $(btnSave).prop("disabled", false);
}

function GetAllBusinessType_TimeZone_Country_State_City_Data() {
    postRequest(BaseUrl + "/SystemManagement/GetAllBusinessType_TimeZone_Country_State_City_Data", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                fillData(res.Data.BusinessType, "#temp_ddlBusinessTypeID", ddlBusinessTypeID, false);
                fillData(res.Data.TimeZones, "#temp_ddlTimeZoneID", ddlTimeZoneID, false);
                fillData(res.Data.Country, "#temp_ddlPostalCountryID", ddlPostalCountryID, false);
                fillData(res.Data.Country, "#temp_ddlBillingCountryID", ddlBillingCountryID, false);

                State_arr = res.Data.State;
                City_arr = res.Data.City;
            }
        }
        else if (res.Status == 401) {
            localStorage.removeItem("userData");
            localStorage.removeItem("Menu");

            window.location.href = baseWebUrl + "Account/Login";
        }
        else if (res.Status == 403) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.statusCode == 404) {
            ErrorAlert(res.reasonPhrase);
        }
        else if (res.Status == 320) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 500) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 600) {
            ErrorAlert(res.ResponseMsg);
        }
        else {
            ErrorAlert(res.ResponseMsg);
        }
    });
}

function SetAdminGridIframeCSS() {
    let head = $("#admingriddemoframe").contents().find("head");
    let css = "<style type='text/css'>.maincontent{width:100% !important;}</style>";
    $(head).append(css);
}

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnCompanyID).val(0);
    $(txtCompanyName).val("");
    $(ddlBusinessTypeID).val();
    $(ddlTimeZoneID).val();
    $(txtNoOfUsers).val("");
    $(txtPostalAddress1).val("");
    $(txtPostalAddress2).val("");
    $(txtPostalPhone).val("");
    $(ddlPostalCountryID).val();
    $(ddlPostalStateID).val();
    $(ddlPostalCityID).val();
    $(txtBillingAddress1).val("");
    $(txtBillingAddress2).val("");
    $(txtBillingPhone).val("");
    $(ddlBillingCountryID).val();
    $(ddlBillingStateID).val();
    $(ddlBillingCityID).val();
    $(txtPostalZipCode).val("");
    $(txtBillingZipCode).val("");
    $(txtCompanyLogo).val("");
    $(txtNTN).val("");
    $(txtSTN).val("");
    $(txtWebsiteURL).val("");
    $(txtPOSID).val("");
    $(ddlIsAllowPowerBy).val();
    $(txtPoweredBy).val("");
}

function CancelButtonAction() {
    ClearAllField();
    $("#iFrameSection2").hide();
    $(DataTable).DataTable().destroy();
    GetAllCompany();
    GridShow();
}