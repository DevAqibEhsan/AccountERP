let Form = "#ManageSiteConfigForm";
let btnSave = "#btnSave"
let txtLogo = "#txtLogo";
let txtPoweredBy = "#txtPoweredBy";
let hdnConfigurationID = "#hdnConfigurationID";
let DataTable = "#dataTableSiteConfig";

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

    LoginSectionColorPickerLoad();

    AdminGridSectionColorPickerLoad();

});

function GetSiteConfigByID(id) {

    postRequest(BaseUrl + "/SiteConfiguration/GetSiteConfigByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnConfigurationID).val(res.Data.ConfigurationID);
                $(txtPoweredBy).val(res.Data.PoweredBy);
                $('#imgLogo').attr('src', ".././SiteConfigMedia/"+res.Data.Logo);
                
                if (res.Data.IsActive == 1) {
                    $("#chkSiteConfigIsActive").prop("checked", true);
                }
                else {
                    $("#chkSiteConfigIsActive").prop("checked", false);
                }

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

    let ConfigurationID = Number($(hdnConfigurationID).val());

    var formData = new FormData();

    formData.append("ConfigurationID", ConfigurationID);
    formData.append("file", $(txtLogo)[0].files[0]);
    formData.append("PoweredBy", $(txtPoweredBy).val());
    formData.append("IsActive", CheckboxIsChecked("chkSiteConfigIsActive"));

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

function AdminGridSectionColorPickerLoad() {
    $('#table-header-bg-color').colorpicker();
    $('#table-header-text-color').colorpicker();
    $('#pagination-button-bg-color').colorpicker();
    $('#pagination-button-text-color').colorpicker();
    $('#pagination-button-bg-color-hover').colorpicker();
    $('#pagination-button-text-color-hover').colorpicker();
    $('#pagination-button-next-bg-color-hover').colorpicker();
    $('#no-of-entries-text-color').colorpicker();
    $('#page-heading-color').colorpicker();
    $('#btn-success-color').colorpicker();
    $('#btn-success-border-color').colorpicker();
    $('#btn-success-bg-color').colorpicker();
    $('#btn-success-color-hover').colorpicker();
    $('#btn-success-border-color-hover').colorpicker();
    $('#btn-success-bg-color-hover').colorpicker();
    $('#btn-success-disable-color').colorpicker();
    $('#btn-success-disable-bg-color').colorpicker();
    $('#btn-success-disable-border-color').colorpicker();
    $('#btn-primary-color').colorpicker();
    $('#btn-primary-border-color').colorpicker();
    $('#btn-primary-bg-color').colorpicker();
    $('#btn-primary-color-hover').colorpicker();
    $('#btn-primary-border-color-hover').colorpicker();
    $('#btn-primary-bg-color-hover').colorpicker();
    $('#btn-primary-disable-color').colorpicker();
    $('#btn-primary-disable-bg-color').colorpicker();
    $('#btn-primary-disable-border-color').colorpicker();
    $('#btn-secondary-color').colorpicker();
    $('#btn-secondary-border-color').colorpicker();
    $('#btn-secondary-bg-color').colorpicker();
    $('#btn-secondary-color-hover').colorpicker();
    $('#btn-secondary-border-color-hover').colorpicker();
    $('#btn-secondary-bg-color-hover').colorpicker();
    $('#btn-secondary-disable-color').colorpicker();
    $('#btn-secondary-disable-bg-color').colorpicker();
    $('#btn-secondary-disable-border-color').colorpicker();
}

function AdminGridColorTextboxChange(id) {

    var ElementID = id.id;

    AdmiGridFormThemeChange(ElementID, "#" + $("#" + ElementID).val());
}

function AdmiGridFormThemeChange(cssvariablename, property) {

    document.getElementById('admingriddemoframe').contentWindow.document.documentElement.style.setProperty('--' + cssvariablename, property);
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
    $(DataTable).DataTable().destroy();
    GetAllSiteConfig();
    GridShow();
}