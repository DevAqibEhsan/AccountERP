﻿let Form = "#ManageChartAccountForm";
let btnSave = "#btnSave"
let hdnChartAccountID = "#hdnChartAccountID";
let txtChartAccountName = "#txtChartAccountName ";
let ddlSubAccountID = "#ddlSubAccountID";
let txtDescription = "#txtDescription";
let ddlIsActive = "#ddlIsActive";
let ddlIsSystemAccount = "#ddlIsSystemAccount";
let DataTable = "#dataTableChartAccount";

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllChartAccount();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadChartAccount", function () {

        $(DataTable).DataTable().destroy();

        GetAllChartAccount();

    });

    $(btnSave).click(function () {
        SaveChartAccountData();
    });

});

function GetChartAccountByID(id) {

    postRequest(BaseUrl + "/AccountsManagement/GetChartAccountByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnChartAccountID).val(res.Data.AccountID);
                $(txtChartAccountName).val(res.Data.AccountName);
                $(ddlSubAccountID).val(res.Data.IsSubAccountOf);
                $(txtDescription).val(res.Data.Description);
                $(ddlIsActive).val(res.Data.IsActive);
                $(ddlIsSystemAccount).val(res.Data.IsSystemAccount);

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

function GetAllChartAccount() {

    GetAccountForSubAccountDropdown();

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
            "url": BaseUrl + "/AccountsManagement/GetAllChartAccount",
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
                "targets": [11],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "ChartAccountID",
                "name": "ChartAccountID",
                "width": "110px",
                "render": function (data, type, full, meta) { return '<a href="javascript:void(0);" onclick="GetChartAccountByID(' + full.AccountID + ')" data-id="' + full.AccountID + '">' + full.AccountCode + '</a>' }
            },
            {
                "data": "AccountName",
                "name": "AccountName",
                "width": "200px"
            },
            {
                "data": "IsSubAccountOfName",
                "name": "IsSubAccountOfName",
                "width": "200px"
            },
            {
                "data": "Description",
                "name": "Description",
                "width": "200px"
            },
            {
                "data": "IsActive",
                "name": "IsActive",
                "width": "200px",
                "render": function (data) {
                    return (data == 1 ? "True" : "False")
                }
            },
            {
                "data": "IsSystemAccount",
                "name": "IsSystemAccount",
                "width": "200px",
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
                    return "<i class='fas fa-edit' onclick='GetChartAccountByID(" + full.AccountID + ")' data-id='" + full.AccountID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveChartAccountData() {
    $(btnSave).prop("disabled", true);

    let ChartAccountID = Number($(hdnChartAccountID).val());

    let obj = {
        AccountID: ChartAccountID,
        AccountName: $(txtChartAccountName).val(),
        IsSubAccountOf: Number($(ddlSubAccountID).val()),
        Description: $(txtDescription).val(),
        IsActive: Number($(ddlIsActive).val()),
        IsSystemAccount: Number($(ddlIsSystemAccount).val())
    };

    if (ChartAccountID > 0) {
        postRequest(BaseUrl + "/AccountsManagement/UpdateChartAccount", obj, function (res) {
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
        postRequest(BaseUrl + "/AccountsManagement/AddChartAccount", obj, function (res) {
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

function GetAccountForSubAccountDropdown() {
    postRequest(BaseUrl + "/AccountsManagement/GetAccountForSubAccountDropdown", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                fillData(res.Data, "#temp_ddlSubAccountID", ddlSubAccountID, false);
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

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnChartAccountID).val(0);
    $(txtChartAccountName).val("");
    $(ddlSubAccountID).val("");
    $(txtDescription).val("");
    $(ddlIsActive).val("1");
    $(ddlIsSystemAccount).val("1");
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllChartAccount();
    GridShow();
}