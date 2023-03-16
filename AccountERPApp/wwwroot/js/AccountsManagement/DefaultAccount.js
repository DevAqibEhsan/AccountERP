let Form = "#ManageDefaultAccountForm";
let btnSave = "#btnSave"
let hdnDefaultAccountID = "#hdnDefaultAccountID";
let txtDefaultAccountName = "#txtDefaultAccountName ";
let ddlSubAccountID = "#ddlSubAccountID";
let txtDescription = "#txtDescription";
let ddlIsActive = "#ddlIsActive";
let ddlIsSystemAccount = "#ddlIsSystemAccount";
let DataTable = "#dataTableDefaultAccount";

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllDefaultAccount();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadDefaultAccount", function () {

        $(DataTable).DataTable().destroy();

        GetAllDefaultAccount();

    });

    $(btnSave).click(function () {
        SaveDefaultAccountData();
    });

});

function GetDefaultAccountByID(id) {

    postRequest(BaseUrl + "/AccountsManagement/GetDefaultAccountByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnDefaultAccountID).val(res.Data.AccountID);
                $(txtDefaultAccountName).val(res.Data.AccountName);
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

function GetAllDefaultAccount() {

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
            "url": BaseUrl + "/AccountsManagement/GetAllDefaultAccount",
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
                "data": "DefaultAccountID",
                "name": "DefaultAccountID",
                "width": "110px",
                "render": function (data, type, full, meta) { return '<a href="javascript:void(0);" onclick="GetDefaultAccountByID(' + full.AccountID + ')" data-id="' + full.AccountID + '">' + full.AccountCode + '</a>' }
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
                    return "<i class='fas fa-edit' onclick='GetDefaultAccountByID(" + full.AccountID + ")' data-id='" + full.AccountID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveDefaultAccountData() {
    $(btnSave).prop("disabled", true);

    let DefaultAccountID = Number($(hdnDefaultAccountID).val());

    let obj = {
        AccountID: DefaultAccountID,
        AccountName: $(txtDefaultAccountName).val(),
        IsSubAccountOf: Number($(ddlSubAccountID).val()),
        Description: $(txtDescription).val(),
        IsActive: Number($(ddlIsActive).val()),
        IsSystemAccount: Number($(ddlIsSystemAccount).val())
    };

    if (DefaultAccountID > 0) {
        postRequest(BaseUrl + "/AccountsManagement/UpdateDefaultAccount", obj, function (res) {
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
        postRequest(BaseUrl + "/AccountsManagement/AddDefaultAccount", obj, function (res) {
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
    $(hdnDefaultAccountID).val(0);
    $(txtDefaultAccountName).val("");
    $(ddlSubAccountID).val("");
    $(txtDescription).val("");
    $(ddlIsActive).val("1");
    $(ddlIsSystemAccount).val("1");
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllDefaultAccount();
    GridShow();
}