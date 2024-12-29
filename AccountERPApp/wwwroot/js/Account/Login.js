let baseApiUrl = "";
let baseWebUrl = "";

let Form = "#loginForm";
let btnLogin = "#btnLogin"
let txtUserName = "#txtUserName";
let txtPassword = "#txtPassword";

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

    LoginSectionShow();
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

    $('#LoginForm').keypress((e) => {
        if (e.which === 13) {
            Login();
        }
    });

    $(btnLogin).click(function () {
        Login();
    });

    $(btnRegister).click(function () {
        RegisterUser();
    });

    $("#registeruserlinkLogin").click(function () {
        LoginSectionShow();
    });

    $("#forgotpasswordlinkLogin").click(function () {
        LoginSectionShow();
    });

    $("#linkForgotPassword").click(function () {
        ForgotPasswordSectionShow();
    });

    $("#loginuserlinkRegister").click(function () {
        RegisterUserSectionShow();
    });

    $("#loginuserlinkRegister2").click(function () {
        RegisterUserSectionShow();
        $('html').animate({ scrollTop: 0 }, 'slow'); return true;
    });

    

});

function LoginSectionShow() {
    $(".LoginUser").show();
    $(".ForgotPassword").hide();
    $(".RegisterUser").hide();
}

function RegisterUserSectionShow() {
    $(".LoginUser").hide();
    $(".ForgotPassword").hide();
    $(".RegisterUser").show();
}

function ForgotPasswordSectionShow() {
    $(".LoginUser").hide();
    $(".ForgotPassword").show();
    $(".RegisterUser").hide();
}

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

//function ThemeSetting() {
//    var root = document.querySelector(":root");
//    var rootStyles = getComputedStyle(root);
//    //var rootStyleVar = rootStyles.getPropertyValue("--btn-action-bg-color");
//    root.style.setProperty("--btn-action-bg-color", "red");
//}

function ThemeSetting(Data) {
    var root = document.querySelector(":root");
    root.style.setProperty("--btn-action-bg-color", "#" + Data.btn_navlink_color);
    root.style.setProperty("--btn-navlink-bg-color", "#" + Data.btn_navlink_bg_color);
    root.style.setProperty("--btn-navlink-active-color", "#" + Data.btn_navlink_active_color);
    root.style.setProperty("--btn-navlink-active-bg-color", "#" + Data.btn_navlink_active_bg_color);
    root.style.setProperty("--btn-action-color", "#" + Data.btn_action_color);
    root.style.setProperty("--btn-action-bg-color", "#" + Data.btn_action_bg_color);
}



