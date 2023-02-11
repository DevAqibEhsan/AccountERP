let Form = "#ManageModulePageForm";
let btnSave = "#btnSave"
let ddlModuleID = "#ddlModuleID";
let txtModulePageName = "#txtModulePageName";
let txtControllerURL = "#txtControllerURL";
let txtActionURL = "#txtActionURL";
let hdnModulePageID = "#hdnModulePageID";
let txtModulePageOrderNo = "#txtModulePageOrderNo";

let DataTable = "#dataTableModulePage";

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllModulePages();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadModulePages", function () {

        $(DataTable).DataTable().destroy();

        GetAllModulePages();

    });

    $(btnSave).click(function () {
        SaveModulePageData();
    });

});

function GetAllModulePages() {
    oTable = $(DataTable).DataTable({

        "lengthChange": true,
        "processing": false, // for show progress bar
        "serverSide": false, // for process server side
        "filter": true, // this is for disable filter (search box)
        "orderMulti": false, // for disable multiple column at once
        "pageLength": 10,
        "orderClasses": false,
        "aaSorting": [
            [11, 'desc']
        ],
        //"initComplete": function (settings, json) {
        //    HideKeys();
        //},

        "ajax": {
            "url": BaseUrl + "/SiteConfiguration/GetAllModulePages",
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

        "columnDefs": [{
            "targets": [13],
            "visible": true,
            "searchable": false,
            "sortable": true
        }],

        "columns": [
            {
                "data": "ModulePageID",
                "name": "ModulePageID",
                "width": "50px",
                "render": function (data) { return '<a href="javascript:;" onclick="GetModulePageByID(' + data + ')" data-id="' + data + '">' + data + '</a>' }
            },
            {
                "data": "ModuleName",
                "name": "ModuleName",
                "width": "200px"
            },
            {
                "data": "ModulePageName",
                "name": "ModulePageName",
                "width": "200px"
            },
            {
                "data": "ControllerURL",
                "name": "ControllerURL",
                "width": "200px"
            },
            {
                "data": "ActionURL",
                "name": "ActionURL",
                "width": "200px"
            },
            {
                "data": "OrderN",
                "name": "OrderN",
                "width": "190px"
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
                    return "<i class='fas fa-edit' onclick='GetModulePageByID('" + data + "')' data-id='" + full.ModulePageID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function GetModulePageByID() {
    postRequest(BaseUrl + "/SiteConfiguration/GetModulePageByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnModulePageID).val(res.Data.ModulePageID);
                $(ddlModuleID).val(res.Data.ModuleID);
                $(txtModulePageName).val(res.Data.ModulePageName);
                $(txtControllerURL).val(res.Data.ControllerURL);
                $(txtActionURL).val(res.Data.ActionURL);
                $(txtModulePageOrderNo).val(res.Data.OrderN);
                
                if (res.Data.IsActive == 1) {
                    $("#chkModulePageIsActive").prop("checked", true);
                }
                else {
                    $("#chkModulePageIsActive").prop("checked", false);
                }

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

function SaveModulePageData() {
    $(btnSave).prop("disabled", true);

    let ModulePageID = Number($(hdnModulePageID).val());

    let ModulePageIsActive = CheckboxIsChecked("chkModulePageIsActive");

    let obj = {
        ModulePageID: ModulePageID,
        ModuleID: Number($(ddlModuleID).val()),
        ModulePageName: $(txtModulePageName).val(),
        ControllerURL: $(txtControllerURL).val(),
        ActionURL: $(txtActionURL).val(),
        OrderN: Number($(txtModulePageOrderNo).val()),
        IsActive: Number(ModulePageIsActive)
    };

    if (ModulePageID > 0) {
        postRequest(BaseUrl + "/SiteConfiguration/UpdateModulePge", obj, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    Swal.fire({
                        title: 'Saved',
                        icon: 'success',
                        html: res.ResponseMsg
                    }).then((result) => {
                        if (result.isConfirmed) {
                            ClearAllField();
                            $(DataTable).DataTable().destroy();
                            GetAllModulePages();
                            GridShow();
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
        postRequest(BaseUrl + "/SiteConfiguration/AddModulePge", obj, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    Swal.fire({
                        title: 'Saved',
                        icon: 'success',
                        html: res.ResponseMsg
                    }).then((result) => {
                        if (result.isConfirmed) {
                            ClearAllField();
                            $(DataTable).DataTable().destroy();
                            GetAllModulePages();
                            GridShow();
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
}

function GetAllModuleForDropDown() {
    postRequest(BaseUrl + "/SiteConfiguration/GetAllModuleForDropDown", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {
                fillData(res.Data, "#temp_ddlModuleID", ddlModuleID, true);
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
    $(hdnModulePageID).val(0);
    $(ddlModuleID).val();
    $(txtModulePageName).val("");
    $(txtControllerURL).val("");
    $(txtActionURL).val("");
    $(txtModulePageOrderNo).val("");
    $("#chkModulePageIsActive").prop("checked", false);
}