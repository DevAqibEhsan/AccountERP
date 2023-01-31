let baseApiUrl = "";
let baseWebUrl = "";
let Form = "#loginForm";
let btnLogin = "#btnLogin"
let txtUserName = "#txtUserName";
let txtPassword = "#txtPassword";

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    if (BaseUrl == "null") {
        BaseUrl = "";
    }
        
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    $(btnLogin).click(function () {
        Login();
    });

});

function Login() {

    $(btnLogin).buttonLoader('start');

    let data = {
        Email: $(txtUserName).val(),
        Password: $(txtPassword).val()
    }

    postRequest(BaseUrl + "/Account/AuthenticateUser", data, function (res) {
        if (res.Status == 200) {
            $(btnLogin).buttonLoader('stop');

            localStorage.setItem("userData", JSON.stringify(res.Data.DataObj));
            localStorage.setItem("Menu", JSON.stringify(res.Data.Menu));

            window.location.href = baseWebUrl + "" + res.Data.IndexPageController + "/" + res.Data.IndexPageAction;
        }
        if (res.Status == 304) {
            $(btnLogin).buttonLoader('stop');
            localStorage.removeItem("userData");

            ErrorAlert(res.ResponseMsg);
        }
        if (res.Status == 305) {
            localStorage.setItem('RedirectionId', res.Data)
            window.location.href = baseWebUrl + "Account/ExpiredPasswordChanged";
        }
        if (res.Status == 401) {
            $(btnLogin).buttonLoader('stop');
            localStorage.removeItem("userData");

            ErrorAlert(res.ResponseMsg);
        }
        if (res.Status == 403) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        if (res.statusCode == 404) {
            ErrorAlert(res.reasonPhrase);
        }
        if (res.Status == 320) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        if (res.Status == 500) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        if (res.Status == 600) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
    });
}

