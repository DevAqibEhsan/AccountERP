let Form = "#ManageUserForm";
let btnSave = "#btnSave"
let hdnUserID = "#hdnUserID";
let txtFirstName = "#txtFirstName";
let txtLastName = "#txtLastName";
let ddlRoleID = "#ddlRoleID";
let ddlCompanyID = "#ddlCompanyID";
let ddlBranchID = "#ddlBranchID";
let txtEmail = "#txtEmail";
let txtPassword = "#txtPassword";
let txtAddress1 = "#txtAddress1";
let txtAddress2 = "#txtAddress2";
let txtPhone = "#txtPhone";
let ddlCountryID = "#ddlCountryID";
let ddlStateID = "#ddlStateID";
let ddlCityID = "#ddlCityID";
let txtZipCode = "#txtZipCode";
let ddlGender = "#ddlGender";
let txtDOB = "#txtDOB";
let DataTable = "#dataTableUser";
let Branch_arr = [];
let State_arr = [];
let City_arr = [];

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllUser();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadUser", function () {

        $(DataTable).DataTable().destroy();

        GetAllUser();

    });

    $(btnSave).click(function () {
        SaveUserData();
    });

    $(ddlCompanyID).change(function (e) {

        var CompanyID = Number($(ddlCompanyID).val());
        if (CompanyID != "") {
            GetAllBranchByCompanyID(CompanyID);
        }
    });

    $(ddlCountryID).change(function (e) {

        var CountryID = Number($(ddlCountryID).val());
        if (CountryID != 0) {
            GetAllState(CountryID);
        }
    });

    $(ddlStateID).change(function (e) {

        var StateID = Number($(ddlStateID).val());
        if (StateID != 0) {
            GetAllCity(StateID);
        }
    });

    $(txtDOB).datetimepicker({
        format: 'MM/DD/YYYY',
        //keepOpen: true,
        //debug: true
    });

});

function GetAllState(CountryID) {
    let objState = State_arr.filter(function (e2) {
        return e2.CountryID == CountryID;
    });

    fillData(objState, "#temp_ddlStateID", ddlStateID, false);
}

function GetAllCity(StateID) {
    let objCity = City_arr.filter(function (e2) {
        return e2.StateID == StateID;
    });

    fillData(objCity, "#temp_ddlCityID", ddlCityID, false);
}

function GetUserByID(id) {

    postRequest(BaseUrl + "/SystemManagement/GetUserByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {
                                
                $(hdnUserID).val(res.Data.UserID);
                $(txtFirstName).val(res.Data.FirstName);
                $(txtLastName).val(res.Data.LastName);
                $(ddlRoleID).val(res.Data.RoleID);
                $(ddlCompanyID).val(res.Data.CompanyID);
                $(ddlBranchID).val(res.Data.BranchID);
                $(txtEmail).val(res.Data.Email);
                $(txtPassword).val(res.Data.Password);
                $(txtAddress1).val(res.Data.Address1);
                $(txtAddress2).val(res.Data.Address2);
                $(txtPhone).val(res.Data.Phone);
                $(ddlCountryID).val(res.Data.CountryID);
                GetAllState(res.Data.CountryID);
                $(ddlStateID).val(res.Data.StateID);
                GetAllCity(res.Data.StateID);
                $(ddlCityID).val(res.Data.CityID);
                $(txtZipCode).val(res.Data.ZipCode);
                $(ddlGender).val(res.Data.Gender);
                $(txtDOB).val(MomentDateFormat(res.Data.DOB));
                if (res.Data.IsActive == 1) {
                    $("#chkUserIsActive").prop("checked", true);
                }
                else {
                    $("#chkUserIsActive").prop("checked", false);
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

function GetAllUser() {

    GetAllUserRoleForDropDown();

    GetAllCompany_Branch_Data();

    GetAllCountry_State_City_Data();

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
            "url": BaseUrl + "/SystemManagement/GetAllUser",
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
                "targets": [19],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "UserID",
                "name": "UserID",
                "width": "110px",
                "render": function (data, type, full, meta) { return '<a href="javascript:;" onclick="GetUserByID(' + full.UserID + ')" data-id="' + full.UserID + '">' + full.UserCode + '</a>' }
            },
            {
                "data": "UserName",
                "name": "UserName",
                "width": "200px"
            },
            {
                "data": "RoleName",
                "name": "RoleName",
                "width": "200px"
            },
            {
                "data": "Email",
                "name": "Email",
                "width": "200px"
            },
            {
                "data": "Address1",
                "name": "Address1",
                "width": "200px"
            },
            {
                "data": "Address2",
                "name": "Address2",
                "width": "200px"
            },
            {
                "data": "Phone",
                "name": "Phone",
                "width": "200px"
            },
            {
                "data": "CountryName",
                "name": "CountryName",
                "width": "200px"
            },
            {
                "data": "StateName",
                "name": "StateName",
                "width": "200px"
            },
            {
                "data": "CityName",
                "name": "CityName",
                "width": "200px"
            },
            {
                "data": "ZipCode",
                "name": "ZipCode",
                "width": "200px"
            },
            {
                "data": "Gender",
                "name": "Gender",
                "width": "200px"
            },
            {
                "data": "DOB",
                "name": "DOB",
                "width": "200px",
                "render": function (data) {
                    return MomentDateTimeFormat(data);
                }
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
                    return "<i class='fas fa-edit' onclick='GetUserByID(" + full.UserID + ")' data-id='" + full.UserID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveUserData() {
    $(btnSave).prop("disabled", true);

    let UserID = Number($(hdnUserID).val());
    let UserIsActive = CheckboxIsChecked("chkUserIsActive");

    let obj = {
        UserID: UserID,
        FirstName: $(txtFirstName).val(),
        LastName: $(txtLastName).val(),
        RoleID: Number($(ddlRoleID).val()),
        CompanyIDs: $(ddlCompanyID).val(),
        BranchIDs: $(ddlBranchID).val(),
        Email: $(txtEmail).val(),
        Password: $(txtPassword).val(),
        Address1: $(txtAddress1).val(),
        Address2: $(txtAddress2).val(),
        Phone: $(txtPhone).val(),
        CountryID: Number($(ddlCountryID).val()),
        StateID: Number($(ddlStateID).val()),
        CityID: Number($(ddlCityID).val()),
        ZipCode: $(txtZipCode).val(),
        Gender: $(ddlGender).val(),
        DOB: $(txtDOB).val(),
        IsActive: UserIsActive
    };

    if (UserID > 0) {
        postRequest(BaseUrl + "/SystemManagement/UpdateUser", obj, function (res) {
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
        postRequest(BaseUrl + "/SystemManagement/AddUser", obj, function (res) {
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

function GetAllCountry_State_City_Data() {
    postRequest(BaseUrl + "/SystemManagement/GetAllBusinessType_TimeZone_Country_State_City_Data", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                fillData(res.Data.Country, "#temp_ddlCountryID", ddlCountryID, false);

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

function GetAllUserRoleForDropDown() {
    postRequest(BaseUrl + "/SiteConfiguration/GetAllRole", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                fillData(res.Data, "#temp_ddlRoleID", ddlRoleID, false);
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
    $(hdnUserID).val(0);
    $(txtFirstName).val("");
    $(txtLastName).val("");
    $(ddlRoleID).val();
    $(ddlCompanyID).val();
    $(ddlBranchID).val();
    $(txtEmail).val("");
    $(txtPassword).val("");
    $(txtAddress1).val("");
    $(txtAddress2).val("");
    $(txtPhone).val("");
    $(ddlCountryID).val();
    $(ddlStateID).val();
    $(ddlCityID).val();
    $(txtZipCode).val("");
    $(ddlGender).val();
    $(txtDOB).val("");
    $("#chkUserIsActive").prop("checked", false);
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllUser();
    GridShow();
}