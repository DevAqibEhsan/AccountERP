let baseApiUrl = "";
let baseWebUrl = "";
let BaseUrl;

const mobileScreen = window.matchMedia("(max-width: 990px )");
$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    let menuData = JSON.parse(localStorage.getItem("Menu"));
    let userData = JSON.parse(localStorage.getItem("userData"));

    $(menuData).each(function (i, e) {
        $(e.DynamicModulePagesMenus).each(function (i1, e1) {
            e1["baseUrlForMVCAction"] = BaseUrl;
        });
    });

    fillData(menuData, "#temp_navMenuList", "#navMenuList", false);
    GetURLAndSetMenuSelected();


    $('#btnLogout').click(function () {
        localStorage.removeItem("userData");
        localStorage.removeItem("Menu");

        postRequest(baseWebUrl + "Account/Logout", null, function (res) {

            if (res.Status == 200) {
                window.location.href = baseWebUrl + "Account/Login";
            }
            if (res.Status == 401) {
                window.location.href = baseWebUrl + "Account/Login";

            }
            if (res.Status == 403) {
                window.location.href = baseWebUrl + "Account/Login";
            }
            if (res.Status == 404) {
                window.location.href = baseWebUrl + "Account/Login";
            }
            if (res.Status == 500) {
                window.location.href = baseWebUrl + "Account/Login";
            }

            if (res.Status == 420) {
                window.location.href = baseWebUrl + "Account/Login";
            }

            if (res.Status == 600) {
                window.location.href = baseWebUrl + "Account/Login";
            }
        });
    });


    $('[data-toggle="tooltip"]').tooltip();

    //Nav Bar Menu Start
    $(".dashboard-nav-dropdown-toggle").click(function () {
        $(this).closest(".dashboard-nav-dropdown")
            .toggleClass("show")
            .find(".dashboard-nav-dropdown")
            .removeClass("show");
        $(this).parent()
            .siblings()
            .removeClass("show");
    });
    $(".menu-toggle").click(function () {
        if (mobileScreen.matches) {
            $(".dashboard-nav").toggleClass("mobile-show");
        } else {
            $(".dashboard").toggleClass("dashboard-compact");
        }
    });

    var myCustomScrollbar = document.querySelector('.dashboard-nav');
    var ps = new PerfectScrollbar(myCustomScrollbar);

    var scrollbarY = myCustomScrollbar.querySelector('.ps__rail-y');

    myCustomScrollbar.onscroll = function () {
        scrollbarY.style.cssText = `top: ${this.scrollTop}px!important; height: 400px; right: ${-this.scrollLeft}px`;
    }
    //Nav Bar Menu End



});


function MomentDateTimeFormat(inputdate) {
    if (inputdate != null) {
        return moment(inputdate.replace(/\Z$/, '')).format('DD/MM/YYYY hh:mm:ss a')
    }
    else {
        return "-";
    }
    
}











    
