let Form = "#ManageWareHouseForm";
let btnSave = "#btnSave"
let hdnWareHouseID = "#hdnWareHouseID";
let txtWareHouseName = "#txtWareHouseName";
let ddlCompanyID = "#ddlCompanyID";
let ddlBranchID = "#ddlBranchID";
let txtAddress1 = "#txtAddress1";
let txtAddress2 = "#txtAddress2";
let txtPhone = "#txtPhone";
let ddlCountryID = "#ddlCountryID";
let ddlStateID = "#ddlStateID";
let ddlCityID = "#ddlCityID";
let txtZipCode = "#txtZipCode";
let DataTable = "#dataTableWareHouse";
let Branch_arr = [];
let State_arr = [];
let City_arr = [];

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllWareHouse();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadWareHouse", function () {

        $(DataTable).DataTable().destroy();

        GetAllWareHouse();

    });

    $(btnSave).click(function () {
        SaveWareHouseData();
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

});

function GetAllBranchByCompanyID(CompanyID) {
    let objBranch = Branch_arr.filter(function (e2) {
        return e2.CompanyID == CompanyID;
    });

    fillData(objBranch, "#temp_ddlBranchID", ddlBranchID, false);
}

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

function GetWareHouseByID(id) {

    postRequest(BaseUrl + "/SystemManagement/GetWareHouseByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnWareHouseID).val(res.Data.WareHouseID);
                $(txtWareHouseName).val(res.Data.WareHouseName);
                $(ddlCompanyID).val(res.Data.CompanyID);
                $(ddlBranchID).val(res.Data.BranchID);
                $(txtAddress1).val(res.Data.Address1);
                $(txtAddress2).val(res.Data.Address2);
                $(txtPhone).val(res.Data.Phone);
                $(ddlCountryID).val(res.Data.CountryID);
                $(ddlStateID).val(res.Data.StateID);
                $(ddlCityID).val(res.Data.CityID);
                $(txtZipCode).val(res.Data.ZipCode);
                
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

function GetAllWareHouse() {

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
            "url": BaseUrl + "/SystemManagement/GetAllWareHouse",
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
                "targets": [16],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "WareHouseID",
                "name": "WareHouseID",
                "width": "50px",
                "render": function (data) { return '<a href="javascript:;" onclick="GetWareHouseByID(' + data + ')" data-id="' + data + '">' + data + '</a>' }
            },
            {
                "data": "WareHouseName",
                "name": "WareHouseName",
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
                    return "<i class='fas fa-edit' onclick='GetWareHouseByID(" + full.WareHouseID + ")' data-id='" + full.WareHouseID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveWareHouseData() {
    $(btnSave).prop("disabled", true);

    let WareHouseID = Number($(hdnWareHouseID).val());

    let obj = {
        WareHouseID: WareHouseID,
        WareHouseName: $(txtWareHouseName).val(),
        CompanyID: Number($(ddlCompanyID).val()),
        BranchID: Number($(ddlBranchID).val()),
        Address1: $(txtAddress1).val(),
        Address2: $(txtAddress2).val(),
        Phone: $(txtPhone).val(),
        CountryID: Number($(ddlCountryID).val()),
        StateID: Number($(ddlStateID).val()),
        CityID: Number($(ddlCityID).val()),
        ZipCode: $(txtZipCode).val()
    };

    if (WareHouseID > 0) {
        postRequest(BaseUrl + "/SystemManagement/UpdateWareHouse", obj, function (res) {
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
        postRequest(BaseUrl + "/SystemManagement/AddWareHouse", obj, function (res) {
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
    $(hdnWareHouseID).val(0);
    $(txtWareHouseName).val("");
    $(ddlCompanyID).val();
    $(ddlBranchID).val();
    $(txtAddress1).val("");
    $(txtAddress2).val("");
    $(txtPhone).val("");
    $(ddlCountryID).val();
    $(ddlStateID).val();
    $(ddlCityID).val();
    $(txtZipCode).val("");
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllWareHouse();
    GridShow();
}