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
                    Swal.fire({
                        title: 'Saved',
                        icon: 'success',
                        html: res.ResponseMsg
                    }).then((result) => {
                        if (result.isConfirmed) {
                            CancelButtonAction();
                        }
                    });
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
                    Swal.fire({
                        title: 'Saved',
                        icon: 'success',
                        html: res.ResponseMsg
                    }).then((result) => {
                        if (result.isConfirmed) {
                            CancelButtonAction();
                        }
                    });
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