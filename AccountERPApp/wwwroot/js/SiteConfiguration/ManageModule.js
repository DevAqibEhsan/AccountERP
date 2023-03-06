let Form = "#ManageModuleForm";
let btnSave = "#btnSave"
let txtModuleName = "#txtModuleName";
let txtModuleIcon = "#txtModuleIcon";
let txtModuleNameasID = "#txtModuleNameasID";
let txtModuleOrderNo = "#txtModuleOrderNo";
let hdnModuleID = "#hdnModuleID";
let DataTable = "#dataTableModule";

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllModule();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadModules", function () {

        $(DataTable).DataTable().destroy();

        GetAllModule();
        
    });

    $(btnSave).click(function () {
        SaveModuleData();
    });

});

function GetModuleByID(id) {

    postRequest(BaseUrl + "/SiteConfiguration/GetModuleByID/"+id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(txtModuleName).val(res.Data.ModuleName);
                $(txtModuleIcon).val(res.Data.Icon);
                $(txtModuleNameasID).val(res.Data.NameAsModuleID);
                $(txtModuleOrderNo).val(res.Data.OrderN);
                $(hdnModuleID).val(res.Data.ModuleID);

                if (res.Data.IsActive == 1) {
                    $("#chkModuleIsActive").prop("checked", true);
                }
                else {
                    $("#chkModuleIsActive").prop("checked", false);
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

function GetAllModule() {

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
            "url": BaseUrl + "/SiteConfiguration/GetAllModule",
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
                    ShowWhiteSpaceWithAssignedPermissionError(data.ResponseMsg);

                    ErrorAlert(data.ResponseMsg);                    
                }
                else if (data.statusCode == 404) {
                    ErrorAlert(data.reasonPhrase);
                }
                else if (data.Status == 320) {
                    ErrorAlert(data.ResponseMsg);
                }
                else if (data.Status == 500) {
                    ErrorAlert(data.ResponseMsg);
                }
                else if (data.Status == 600) {
                    ErrorAlert(data.ResponseMsg);
                }
                else {
                    ErrorAlert(data.ResponseMsg);
                }

                return data.Data;
            }
        },

        "columnDefs": [{
            "targets": [12],
            "visible": true,
            "searchable": false,
            "sortable": true
        }],

        "columns": [
            {
                "data": "ModuleID",
                "name": "ModuleID",
                "width": "50px",
                "render": function (data) { return '<a href="javascript:;" onclick="GetModuleByID(' + data + ')" data-id="' + data + '">' + data + '</a>' }
            },
            {
                "data": "ModuleName",
                "name": "ModuleName",
                "width": "200px"
            },
            {
                "data": "Icon",
                "name": "Icon",
                "width": "110px",
                "render": function (data) { return '<li class="fas ' + data +'"></li>' }
            },
            {
                "data": "NameAsModuleID",
                "name": "NameAsModuleID",
                "width": "200px"
            },
            {
                "data": "OrderN",
                "name": "OrderN",
                "width": "147px"
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
                    return "<i class='fas fa-edit' onclick='GetModuleByID(" + full.ModuleID+")' data-id='" + full.ModuleID+"'></i>";
                }
            }
        ]

    //}).on("draw.dt", function () {
    //    HideKeys();

    });
}

function SaveModuleData() {
    $(btnSave).prop("disabled", true);

    let ModuleID = Number($(hdnModuleID).val());

    let ModuleIsActive = CheckboxIsChecked("chkModuleIsActive");

    let obj = {
        ModuleID: ModuleID,
        ModuleName: $(txtModuleName).val(),
        NameAsModuleID: $(txtModuleNameasID).val(),
        Icon: $(txtModuleIcon).val(),
        OrderN: Number($(txtModuleOrderNo).val()),
        IsActive: Number(ModuleIsActive)
    };

    if (ModuleID > 0) {
        postRequest(BaseUrl + "/SiteConfiguration/UpdateModule", obj, function (res) {
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
                            GetAllModule();
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
        postRequest(BaseUrl + "/SiteConfiguration/AddModule", obj, function (res) {
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
                            GetAllModule();
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
    $(btnSave).prop("disabled", false);
}

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnModuleID).val(0);
    $(txtModuleName).val("");
    $(txtModuleNameasID).val("");
    $(txtModuleIcon).val("");
    $(txtModuleOrderNo).val("");
    $("#chkModuleIsActive").prop("checked", false);
}