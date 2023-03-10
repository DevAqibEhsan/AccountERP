let Form = "#ManageUserForm";
let btnSave = "#btnSave"
let hdnUserID = "#hdnUserID";
let txtFirstName = "#txtFirstName";
let txtLastName = "#txtLastName";
let ddlRoleID = "#ddlRoleID";
let ddlCompanyID = "#ddlCompanyID";
let ddlBranchID = "#ddlBranchID";
let txtEmail = "#txtEmail";
let txtAddress1 = "#txtAddress1";
let txtAddress2 = "#txtAddress2";
let txtPhone = "#txtPhone";
let ddlCountryID = "#ddlCountryID";
let ddlStateID = "#ddlStateID";
let ddlCityID = "#ddlCityID";
let txtZipCode = "#txtZipCode";
let ddlGender = "#ddlGender";
let State_arr = [];
let City_arr = [];

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllCountry_State_City_Data();
    GetUserProfile()

    $(btnSave).click(function () {
        SaveUserData();
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

function GetUserProfile() {

    postRequest(BaseUrl + "/SystemManagement/GetUserProfile", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnUserID).val(res.Data.UserID);
                $(txtFirstName).val(res.Data.FirstName);
                $(txtLastName).val(res.Data.LastName);
                $(txtEmail).val(res.Data.Email);
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
                $(txtDOB).val(res.Data.DOB);
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

function SaveUserData() {
    $(btnSave).prop("disabled", true);

    let UserID = Number($(hdnUserID).val());
    let UserIsActive = CheckboxIsChecked("chkUserIsActive");

    let obj = {
        UserID: UserID,
        FirstName: $(txtFirstName).val(),
        LastName: $(txtLastName).val(),
        Email: $(txtEmail).val(),
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
        postRequest(BaseUrl + "/SystemManagement/UpdateUserProfile", obj, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    SuccessAlert(res.ResponseMsg);
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

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnUserID).val(0);
    $(txtFirstName).val("");
    $(txtLastName).val("");
    $(txtEmail).val("");
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
