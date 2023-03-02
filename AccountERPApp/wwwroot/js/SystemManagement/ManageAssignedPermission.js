let Form = "#ManageAssignedPermissionForm";
let btnSave = "#btnSave"
let hdnAssignedPermissionRoleID = "#hdnAssignedPermissionRoleID";
let ddlRoleID = "#ddlRoleID";
let ddlModulePageID = "#ddlModulePageID";
let ddlModulePageActionID = "#ddlModulePageActionID";
let DataTable = "#dataTableAssignedPermission";
let ModulePageAction_arr = [];

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllAssignedPermission();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadAssignedPermission", function () {

        $(DataTable).DataTable().destroy();

        GetAllAssignedPermission();

    });

    $(btnSave).click(function () {
        SaveAssignedPermissionData();
    });

    $(ddlModulePageID).change(function (e) {

        var ModulePageID = Number($(ddlModulePageID).val());
        if (ModulePageID != 0) {
            GetAllModulePageAction(ModulePageID);
        }
    });

});

function GetAllModulePageAction(ModulePageID) {
    let objModulePageAction = ModulePageAction_arr.filter(function (e2) {
        return e2.ModulePageID == ModulePageID;
    });

    fillData(objModulePageAction, "#temp_ddlModulePageActionID", ddlModulePageActionID, false);
}

function GetAssignedPermissionByID(id) {

    postRequest(BaseUrl + "/SystemManagement/GetAssignedPermissionByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {



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

function GetAllAssignedPermission() {

    GetAllRole_Module_ModulePageAction_Data();

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
            "url": BaseUrl + "/SystemManagement/GetAllAssignedPermission",
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
                "targets": [10],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "AssignedPermissionID",
                "name": "AssignedPermissionID",
                "width": "50px",
                "render": function (data, type, full, meta) 
                {
                    return '<a href="javascript:;" onclick="GetAssignedPermissionByID(' + full.RoleID + ')" data-id="' + full.RoleID + '">' + data + '</a>'
                }
            },
            {
                "data": "RoleName",
                "name": "RoleName",
                "width": "200px"
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
                "data": "ModulePageActionName",
                "name": "ModulePageActionName",
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
                    return "";
                    //return "<i class='fas fa-edit' onclick='GetAssignedPermissionByID(" + full.RoleID + ")' data-id='" + full.RoleID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveAssignedPermissionData() {
    $(btnSave).prop("disabled", true);

    let AssignedPermissionRoleID = Number($(hdnAssignedPermissionRoleID).val());

    if (AssignedPermissionRoleID == 0) {
        AssignedPermissionRoleID = Number($(ddlRoleID).val());
    }

    let obj = {
        RoleID: AssignedPermissionRoleID,
        ModulePageActionIDs: $(ddlModulePageActionID).val()
    };

    if (AssignedPermissionRoleID > 0) {
        postRequest(BaseUrl + "/SystemManagement/UpdateAssignedPermission", obj, function (res) {
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
        postRequest(BaseUrl + "/SystemManagement/AddAssignedPermission", obj, function (res) {
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

function GetAllRole_Module_ModulePageAction_Data() {
    postRequest(BaseUrl + "/SystemManagement/GetAllRole_Module_ModulePageAction_Data", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {
                fillData(res.Data.Role, "#temp_ddlRoleID", ddlRoleID, false);
                fillData(res.Data.ModulePages, "#temp_ddlModulePageID", ddlModulePageID, false);

                ModulePageAction_arr = res.Data.ModulePageAction;
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
    $(hdnAssignedPermissionRoleID).val(0);
    $(ddlModulePageActionID).val("");
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllAssignedPermission();
    GridShow();
}