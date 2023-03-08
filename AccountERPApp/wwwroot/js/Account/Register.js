
let registerFirstName = "#registerFirstName";
let registerLastName = "#registerLastName";
let txtCompanyName = "#txtCompanyName";
let registerEmail = "#registerEmail";
let registerPassword = "#registerPassword";
let registerRepeatPassword = "#registerRepeatPassword";
let UserRegisterCheck = CheckboxIsChecked("registerCheck");
let btnRegister = "#btnRegister";

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    if (BaseUrl == "null") {
        BaseUrl = "";
    }

    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    SiteConfigurationLoad(BaseUrl);

    $(btnRegister).click(function () {
        RegisterUser();
    });
});

function RegisterUser() {
    $(btnRegister).buttonLoader('start');

    let data = {
        FirstName: $(registerFirstName).val(),
        LastName: $(registerLastName).val(),
        CompanyName: $(txtCompanyName).val(),
        Email: $(registerEmail).val(),
        Password: $(registerRepeatPassword).val()
    }

    postRequest(BaseUrl + "/Account/RegisterUser", data, function (res) {
        if (res.Status == 200) {
            SuccessAlertWithConfirmAndOpenURL(res.ResponseMsg, baseWebUrl + "Account/Login");

            $(btnRegister).buttonLoader('stop');
        }
        else if (res.Status == 304) {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 305) {
            localStorage.setItem('RedirectionId', res.Data)
            window.location.href = baseWebUrl + "Account/ExpiredPasswordChanged";
        }
        else if (res.Status == 401) {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 403) {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.statusCode == 404) {
            ErrorAlert(res.reasonPhrase);
        }
        else if (res.Status == 320) {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 500) {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 600) {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else {
            $(btnRegister).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
    });
}
