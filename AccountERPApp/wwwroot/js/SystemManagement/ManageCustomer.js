let Form = "#ManageCustomerForm";
let btnSave = "#btnSave"
let hdnCustomerID = "#hdnCustomerID";
let txtCustomerName = "#txtCustomerName";
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
let DataTable = "#dataTableCustomer";
let Branch_arr = [];
let State_arr = [];
let City_arr = [];

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllCustomer();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadCustomer", function () {

        $(DataTable).DataTable().destroy();

        GetAllCustomer();

    });

    $(btnSave).click(function () {
        SaveCustomerData();
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

function GetAllBranchByCompanyID(CompanyID) {
    let objBranch = Branch_arr.filter(function (e2) {
        return e2.CompanyID == CompanyID;
    });

    fillData(objBranch, "#temp_ddlBranchID", ddlBranchID, false);
}

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

function GetCustomerByID(id) {

    postRequest(BaseUrl + "/SystemManagement/GetCustomerByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnCustomerID).val(res.Data.CustomerID);
                $(txtCustomerName).val(res.Data.CustomerName);
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
                    $("#chkCustomerIsActive").prop("checked", true);
                }
                else {
                    $("#chkCustomerIsActive").prop("checked", false);
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

function GetAllCustomer() {

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
            "url": BaseUrl + "/SystemManagement/GetAllCustomer",
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
                "targets": [24],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "CustomerID",
                "name": "CustomerID",
                "width": "50px",
                "render": function (data) { return '<a href="javascript:;" onclick="GetCustomerByID(' + data + ')" data-id="' + data + '">' + data + '</a>' }
            },
            {
                "data": "CustomerName",
                "name": "CustomerName",
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
                    return "<i class='fas fa-edit' onclick='GetCustomerByID(" + full.CustomerID + ")' data-id='" + full.CustomerID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveCustomerData() {
    $(btnSave).prop("disabled", true);

    let CustomerID = Number($(hdnCustomerID).val());
    let CustomerIsActive = CheckboxIsChecked("chkCustomerIsActive");

    let obj = {
        CustomerID: CustomerID,
        CustomerName: $(txtCustomerName).val(),
        CompanyID: Nubmer($(ddlCompanyID).val()),
        BranchID: Nubmer($(ddlBranchID).val()),
        PostalAddress1: $(txtPostalAddress1).val(),
        PostalAddress2: $(txtPostalAddress2).val(),
        PostalPhone: $(txtPostalPhone).val(),
        PostalCountryID: Nubmer($(ddlPostalCountryID).val()),
        PostalStateID: Nubmer($(ddlPostalStateID).val()),
        PostalCityID: Nubmer($(ddlPostalCityID).val()),
        BillingAddress1: $(txtBillingAddress1).val(),
        BillingAddress2: $(txtBillingAddress2).val(),
        BillingPhone: $(txtBillingPhone).val(),
        BillingCountryID: Nubmer($(ddlBillingCountryID).val()),
        BillingStateID: Nubmer($(ddlBillingStateID).val()),
        BillingCityID: Nubmer($(ddlBillingCityID).val()),
        PostalZipCode: $(txtPostalZipCode).val(),
        BillingZipCode: $(txtBillingZipCode).val(),
        IsActive: CustomerIsActive
    };

    if (CustomerID > 0) {
        postRequest(BaseUrl + "/SystemManagement/UpdateCustomer", obj, function (res) {
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
        postRequest(BaseUrl + "/SystemManagement/AddCustomer", obj, function (res) {
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

function GetAllCompany_Branch_Data() {
    postRequest(BaseUrl + "/SystemManagement/GetAllCompany_Branch_Data", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                fillData(res.Data.Company, "#temp_ddlCompanyID", ddlCompanyID, false);
                Branch_arr = res.Data.Branch;
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
    $(hdnCustomerID).val(0);
    $(txtCustomerName).val();
    $(ddlCompanyID).val();
    $(ddlBranchID).val();
    $(txtPostalAddress1).val();
    $(txtPostalAddress2).val();
    $(txtPostalPhone).val();
    $(ddlPostalCountryID).val();
    $(ddlPostalStateID).val();
    $(ddlPostalCityID).val();
    $(txtBillingAddress1).val();
    $(txtBillingAddress2).val();
    $(txtBillingPhone).val();
    $(ddlBillingCountryID).val();
    $(ddlBillingStateID).val();
    $(ddlBillingCityID).val();
    $(txtPostalZipCode).val();
    $(txtBillingZipCode).val();
    $("#chkCustomerIsActive").prop("checked", false);
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllCustomer();
    GridShow();
}