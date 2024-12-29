let Form = "#ManageSiteConfigForm";
let btnSave = "#btnSave"
let txtLogo = "#txtLogo";
let txtPoweredBy = "#txtPoweredBy";
let hdnConfigurationID = "#hdnConfigurationID";
let DataTable = "#dataTableSiteConfig";
let hdnUploadedURL = "#hdnUploadedURL";
let lnkViewLogo = "#lnkViewLogo";

let btn_navlink_color = "#btn-navlink-color";
let btn_navlink_bg_color = "#btn-navlink-bg-color";
let btn_navlink_active_color = "#btn-navlink-active-color";
let btn_navlink_active_bg_color = "#btn-navlink-active-bg-color";
let btn_action_color = "#btn-action-color";
let btn_action_bg_color = "#btn-action-bg-color";

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

    GetAllSiteConfig();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadSiteConfig", function () {

        $(DataTable).DataTable().destroy();

        GetAllSiteConfig();

    });

    $(btnSave).click(function () {
        SaveSiteConfigData();
    });

    $(lnkViewLogo).click(function () {
        ViewSiteLogo();
    });
        

    LoginSectionColorPickerLoad();

    AdminGridSectionColorPickerLoad();

});

function GetSiteConfigByID(id) {

    postRequest(BaseUrl + "/SiteConfiguration/GetSiteConfigByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnConfigurationID).val(res.Data.ConfigurationID);
                $(txtPoweredBy).val(res.Data.PoweredBy);
                $(hdnUploadedURL).val(".././SiteConfigMedia/" + res.Data.Logo);
                
                if (res.Data.IsActive == 1) {
                    $("#chkSiteConfigIsActive").prop("checked", true);
                }
                else {
                    $("#chkSiteConfigIsActive").prop("checked", false);
                }

                if (res.Data.SiteThemeSetting != null) {
                    FilColorTextboxWithValue(res.Data.SiteThemeSetting);
                    AdminGridFilColorTextboxWithValue(res.Data.SiteThemeSetting);
                }
                else {
                    $("#chkIsDefaultThemeSetting").prop("checked", true);
                }
                
                $("#iFrameSection").show();
                $("#iFrameSection2").show();

                $("#dvLogo").show();

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

function GetAllSiteConfig() {
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
            "url": BaseUrl + "/SiteConfiguration/GetAllSiteConfig",
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
                "targets": [9],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "ConfigurationID",
                "name": "ConfigurationID",
                "width": "50px",
                "render": function (data) { return '<a href="javascript:;" onclick="GetSiteConfigByID(' + data + ')" data-id="' + data + '">' + data + '</a>' }
            },
            {
                "data": "Logo",
                "name": "Logo",
                "width": "115px",
                "render": function (data) {
                    return (data != null ? "<a href='.././SiteConfigMedia/" + data + "' target='blank'>View Logo</a>" : "-")
                }
            },
            {
                "data": "PoweredBy",
                "name": "PoweredBy",
                "width": "200px"
            },
            {
                "data": "IsActive",
                "name": "IsActive",
                "width": "80px",
                "render": function (data) {
                    return (data == 1 ? "True" : "False")
                }
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
                    return "<i class='fas fa-edit' onclick='GetSiteConfigByID(" + full.ConfigurationID + ")' data-id='" + full.ConfigurationID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveSiteConfigData() {
    $(btnSave).prop("disabled", true);

    let ThemeObj = {
        btn_navlink_color: $(btn_navlink_color).val(),
        btn_navlink_bg_color: $(btn_navlink_bg_color).val(),
        btn_navlink_active_color: $(btn_navlink_active_color).val(),
        btn_navlink_active_bg_color: $(btn_navlink_active_bg_color).val(),
        btn_action_color: $(btn_action_color).val(),
        btn_action_bg_color: $(btn_action_bg_color).val(),

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

    let ConfigurationID = Number($(hdnConfigurationID).val());
        
    if (CheckboxIsChecked("chkIsDefaultThemeSetting") == 1) {
        ThemeObj = null;
    }

    var formData = new FormData();

    formData.append("ConfigurationID", ConfigurationID);
    formData.append("file", $(txtLogo)[0].files[0]);
    formData.append("PoweredBy", $(txtPoweredBy).val());
    formData.append("IsActive", CheckboxIsChecked("chkSiteConfigIsActive"));
    formData.append("SiteThemeSetting", JSON.stringify(ThemeObj));

    if (ConfigurationID > 0) {
        postRequestFormData(baseApiUrl + "api/ManageSiteConfig/UpdateSiteConfig", formData, function (res) {
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
    else {
        postRequestFormData(baseApiUrl + "api/ManageSiteConfig/AddSiteConfig", formData, function (res) {
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

function LoginSectionColorPickerLoad() {
    $('#btn-navlink-color').colorpicker();
    $('#btn-navlink-bg-color').colorpicker();
    $('#btn-navlink-active-color').colorpicker();
    $('#btn-navlink-active-bg-color').colorpicker();
    $('#btn-action-color').colorpicker();
    $('#btn-action-bg-color').colorpicker();
}

function LoginColorTextboxChange(id) {

    var ElementID = id.id;

    LoginFormThemeChange(ElementID, "#" + $("#" + ElementID).val());
}

function LoginFormThemeChange(cssvariablename, property) {

    document.getElementById('logindemoframe').contentWindow.document.documentElement.style.setProperty('--' + cssvariablename, property);
}

function FilColorTextboxWithValue(Data) {
    $(btn_navlink_color).val(Data.btn_navlink_color);
    $(btn_navlink_bg_color).val(Data.btn_navlink_bg_color);
    $(btn_navlink_active_color).val(Data.btn_navlink_active_color);
    $(btn_navlink_active_bg_color).val(Data.btn_navlink_active_bg_color);
    $(btn_action_color).val(Data.btn_action_color);
    $(btn_action_bg_color).val(Data.btn_action_bg_color);

    LoginFormThemeChange(ReplaceFunc("btn_navlink_color", "_", "-"), "#" + Data.btn_navlink_color);
    LoginFormThemeChange(ReplaceFunc("btn_navlink_bg_color", "_", "-"), "#" + Data.btn_navlink_bg_color);
    LoginFormThemeChange(ReplaceFunc("btn_navlink_active_color", "_", "-"), "#" + Data.btn_navlink_active_color);
    LoginFormThemeChange(ReplaceFunc("btn_navlink_active_bg_color", "_", "-"), "#" + Data.btn_navlink_active_bg_color);
    LoginFormThemeChange(ReplaceFunc("btn_action_color", "_", "-"), "#" + Data.btn_action_color);
    LoginFormThemeChange(ReplaceFunc("btn_action_bg_color", "_", "-"), "#" + Data.btn_action_bg_color);
}

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnConfigurationID).val(0);
    $(txtLogo).val(null);
    $(txtPoweredBy).val("");
    $("#chkSiteConfigIsActive").prop("checked", false);
}

function CancelButtonAction() {
    ClearAllField();
    $("#iFrameSection").hide();
    $("#iFrameSection2").hide();
    $(DataTable).DataTable().destroy();
    GetAllSiteConfig();
    GridShow();
}