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

    SiteConfigurationLoad(BaseUrl);

    var remember = $.cookie('rememberMe');
    if (remember == 'true') {
        $('#remember').prop('checked', true);

        var UserName = $.cookie('UserName');
        var password = $.cookie('password');

        $(txtUserName).attr("value", UserName);

        $(txtPassword).attr("value", password);

        MaterialActiveClass_Add_In_Textbox(txtUserName);
        MaterialActiveClass_Remove_In_Textbox(txtPassword);
    }

    $(btnLogin).click(function () {
        Login();
    });

});

function Login() {

    $(btnLogin).buttonLoader('start');

    var rememberMe = $('#remember').prop('checked');
    if (rememberMe) {
        var UserName = $(txtUserName).val();
        var Password = $(txtPassword).val();
        // Encrypt
        //var UserNameEncrypt = CryptoJS.AES.encrypt(Username, PsswordKey);
        //var PasswordEncrypt = CryptoJS.AES.encrypt(Password, PsswordKey);
        $.cookie('UserName', UserName, { expires: 365 });
        $.cookie('password', Password, { expires: 365 });
        $.cookie('rememberMe', true, { expires: 365 });
    }
    else {
        $.cookie('UserName', null);
        $.cookie('password', null);
        $.cookie('rememberMe', null);
    }

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
        else if (res.Status == 304) {
            $(btnLogin).buttonLoader('stop');
            localStorage.removeItem("userData");

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 305) {
            localStorage.setItem('RedirectionId', res.Data)
            window.location.href = baseWebUrl + "Account/ExpiredPasswordChanged";
        }
        else if (res.Status == 401) {
            $(btnLogin).buttonLoader('stop');
            localStorage.removeItem("userData");

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 403) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.statusCode == 404) {
            ErrorAlert(res.reasonPhrase);
        }
        else if (res.Status == 320) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 500) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 600) {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
        else {
            $(btnLogin).buttonLoader('stop');

            ErrorAlert(res.ResponseMsg);
        }
    });
}



