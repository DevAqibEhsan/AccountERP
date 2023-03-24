let Form = "#ManageVendorForm";
let btnSave = "#btnSave"
let hdnVendorID = "#hdnVendorID";
let txtVendorName = "#txtVendorName";
let ddlCompanyID = "#ddlCompanyID";
let ddlBranchID = "#ddlBranchID";
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
let DataTable = "#dataTableVendor";
let Branch_arr = [];
let State_arr = [];
let City_arr = [];

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllVendor();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadVendor", function () {

        $(DataTable).DataTable().destroy();

        GetAllVendor();

    });

    $(btnSave).click(function () {
        SaveVendorData();
    });

    $(ddlCompanyID).change(function (e) {

        var CompanyID = Number($(ddlCompanyID).val());
        if (CompanyID != "") {
            GetAllBranchByCompanyID(CompanyID);
        }
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

function GetVendorByID(id) {

    postRequest(BaseUrl + "/SystemManagement/GetVendorByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnVendorID).val(res.Data.VendorID);
                $(txtVendorName).val(res.Data.VendorName);
                $(ddlCompanyID).val(res.Data.CompanyID);
                GetAllBranchByCompanyID(res.Data.CompanyID);
                $(ddlBranchID).val(res.Data.BranchID);
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
                if (res.Data.IsActive == 1) {
                    $("#chkVendorIsActive").prop("checked", true);
                }
                else {
                    $("#chkVendorIsActive").prop("checked", false);
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

function GetAllVendor() {

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
            "url": BaseUrl + "/SystemManagement/GetAllVendor",
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
                "targets": [8],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "VendorID",
                "name": "VendorID",
                "width": "110px",
                "render": function (data, type, full, meta) { return '<a href="javascript:;" onclick="GetVendorByID(' + full.VendorID + ')" data-id="' + full.VendorID + '">' + full.VendorCode + '</a>' }
            },
            {
                "data": "VendorName",
                "name": "VendorName",
                "width": "200px"
            },
            {
                "data": "CompanyName",
                "name": "CompanyName",
                "width": "200px"
            },
            {
                "data": "BranchName",
                "name": "BranchName",
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
                    return "<i class='fas fa-edit' onclick='GetVendorByID(" + full.VendorID + ")' data-id='" + full.VendorID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveVendorData() {
    $(btnSave).prop("disabled", true);

    let VendorID = Number($(hdnVendorID).val());
    let VendorIsActive = CheckboxIsChecked("chkVendorIsActive");

    let obj = {
        VendorID: VendorID,
        VendorName: $(txtVendorName).val(),
        CompanyID: Number($(ddlCompanyID).val()),
        BranchID: Number($(ddlBranchID).val()),
        PostalAddress1: $(txtPostalAddress1).val(),
        PostalAddress2: $(txtPostalAddress2).val(),
        PostalPhone: $(txtPostalPhone).val(),
        PostalCountryID: Number($(ddlPostalCountryID).val()),
        PostalStateID: Number($(ddlPostalStateID).val()),
        PostalCityID: Number($(ddlPostalCityID).val()),
        BillingAddress1: $(txtBillingAddress1).val(),
        BillingAddress2: $(txtBillingAddress2).val(),
        BillingPhone: $(txtBillingPhone).val(),
        BillingCountryID: Number($(ddlBillingCountryID).val()),
        BillingStateID: Number($(ddlBillingStateID).val()),
        BillingCityID: Number($(ddlBillingCityID).val()),
        PostalZipCode: $(txtPostalZipCode).val(),
        BillingZipCode: $(txtBillingZipCode).val(),
        IsActive: VendorIsActive
    };

    if (VendorID > 0) {
        postRequest(BaseUrl + "/SystemManagement/UpdateVendor", obj, function (res) {
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
        postRequest(BaseUrl + "/SystemManagement/AddVendor", obj, function (res) {
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

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnVendorID).val(0);
    $(txtVendorName).val("");
    $(ddlCompanyID).val("");
    $(ddlBranchID).val("");
    $(txtPostalAddress1).val("");
    $(txtPostalAddress2).val("");
    $(txtPostalPhone).val("");
    $(ddlPostalCountryID).val("");
    $(ddlPostalStateID).val("");
    $(ddlPostalCityID).val("");
    $(txtBillingAddress1).val("");
    $(txtBillingAddress2).val("");
    $(txtBillingPhone).val("");
    $(ddlBillingCountryID).val("");
    $(ddlBillingStateID).val("");
    $(ddlBillingCityID).val("");
    $(txtPostalZipCode).val("");
    $(txtBillingZipCode).val("");
    $("#chkVendorIsActive").prop("checked", false);
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllVendor();
    GridShow();
}