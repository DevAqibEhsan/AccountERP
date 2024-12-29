
//$(document).ready(function () {
//    $('#example').DataTable();
//});

function FormShow() {
    $("#grid").hide();
    $("#form").show();
}

function GridShow() {
    $("#form").hide();
    $("#grid").show();
}

function RemoveSortingClass(ColumnId) {
    if ($('#' + ColumnId).hasClass('sorting')) {
        $('#' + ColumnId).removeClass("sorting");
    }
}

function postRequest(url, requestData, handledata) {
    $.ajax({
        type: 'POST',
        contentType: 'application/json;charset=utf-8',
        dataType: "json",
        url: url,
        headers: {
            "Authorization": GetAuthorizationHeader()
        },
        data: JSON.stringify(requestData),
        success: function (data, textStatus, xhr) {
            handledata(data);
        },
        error: function (xhr, textStatus, errorThrown) {
            ErrorAlert("Something Went Wrong!");
        }
    });
}

function postRequestFormData(url, requestData, handledata) {
    $.ajax({
        type: 'POST',
        processData: false,
        contentType: false,
        enctype: 'multipart/form-data',
        url: url,
        headers: {
            "Authorization": $("#tkn").val()
        },
        data: requestData,
        success: function (data, textStatus, xhr) {
            handledata(data);
        },
        error: function (xhr, textStatus, errorThrown) {
            ErrorAlert("Something Went Wrong!");
        }
    });
}

function postRequest_NotAsync(url, requestData, handledata) {
    $.ajax({
        type: 'POST',
        contentType: 'application/json;charset=utf-8',
        dataType: "json",
        url: url,
        async:false,
        headers: {
            "Authorization": GetAuthorizationHeader()
        },
        data: JSON.stringify(requestData),
        success: function (data, textStatus, xhr) {
            handledata(data);
        },
        error: function (xhr, textStatus, errorThrown) {
            ErrorAlert("Something Went Wrong!");
        }
    });
}

function GetAuthorizationHeader() {
    let token = localStorage.getItem('authorization');
    if (isNullOrUndefined(token)) {
        token = "";
    }
    return token = "Bearer " + token;
}

function isNullOrUndefined(value) {
    if (value == null || value == undefined || value == "undefined")
        return true;
    else
        return false;
}

function ErrorAlert(Message) {
    if (Message != "" && Message != null) {
        Swal.fire({
            title: "Error",
            text: Message,
            icon: "error"
        });
    }
}

function SuccessAlert(Message) {
    if (Message != "" && Message != null) {
        Swal.fire({
            title: 'Saved',
            icon: 'success',
            html: Message
        });
    }
}

function SuccessAlertWithConfirmAndOpenURL(Message,URL) {
    if (Message != "" && Message != null) {
        Swal.fire({
            title: 'Saved',
            icon: 'success',
            html: Message
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = URL;
            }
        });
    }
}

function SuccessAlertWithConfirmAndCancelButtonActionFuncExecute(Message) {
    if (Message != "" && Message != null) {
        Swal.fire({
            title: 'Saved',
            icon: 'success',
            html: Message
        }).then((result) => {
            if (result.isConfirmed) {
                CancelButtonAction();
            }
        });
    }
}

function ErrorAlertWithConfirmAndOpenURL(Message, URL) {
    if (Message != "" && Message != null) {
        Swal.fire({
            title: 'Error',
            icon: 'error',
            html: res.ResponseMsg
        }).then((result) => {
            if (result.isConfirmed) {

                window.location.href = URL;
            }
        });
    }
}

function ShowWhiteSpaceWithAssignedPermissionError(Message) {
    $(".btnsection").html("");
    $(".card-body").text(Message);
}

function MaterialActiveClass_Add_In_Textbox(thisid) {

    if (thisid.attributes == undefined) {
        if ($(thisid).hasClass("Active")) {
        }
        else {
            $(thisid).addClass("Active");
        }
    }
    else {
        if ($("#" + thisid.attributes[1].value).hasClass("Active")) {
        }
        else {
            $("#" + thisid.attributes[1].value).addClass("Active");
        }
    }
}

function MaterialActiveClass_Remove_In_Textbox(thisid) {

    if (thisid.attributes == undefined) {
        if ($(thisid).val().length <= 0) {
            $(thisid).removeClass("Active");
        }
        else {
            MaterialActiveClass_Add_In_Textbox(thisid);
        }
    }
    else {
        if ($("#" + thisid.attributes[1].value).val().length <= 0) {
            $("#" + thisid.attributes[1].value).removeClass("Active");
        }
        else {
            MaterialActiveClass_Add_In_Textbox(thisid);
        }
    }
}

function fillData(res, tempContainerId, fillContainerId, IsRefresh) {
    if (res) {
        $(fillContainerId).html('');
        let template = $(tempContainerId).html()
        var templateScript = Handlebars.compile(template);
        $(fillContainerId).html(templateScript(res));

        if (IsRefresh)
            $(fillContainerId).selectpicker('refresh');

    }
}

function CheckboxIsChecked(ElementID) {
    
    var IsCheckedVal = 0;

    if ($("#" + ElementID).is(':checked')) {
        IsCheckedVal = 1;
    }

    return IsCheckedVal;
}

function SiteConfigurationLoad(url) {
    postRequest(url + "/Account/SiteConfigurationLoad", null, function (res) {
        if (res.Status == 200) {

            $(".imgSiteLogo").attr("src", "./../SiteConfigMedia/" + res.Data.SiteLogo);

            $("#footerContainer").html(res.Data.PoweredByText);

            if (res.Data.SiteThemeSetting != null) {
                ThemeSetting(res.Data.SiteThemeSetting);
            }
        }
        else if (res.Status == 304) {
            ErrorAlert(res.ResponseMsg);

            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 305) {
            ErrorAlert(res.ResponseMsg);
        }
        else if (res.Status == 401) {
            ErrorAlert(res.ResponseMsg);
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
            ShowWhiteSpaceWithAssignedPermissionError(data.ResponseMsg);
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

function GetAllBranchByCompanyID(CompanyID) {
    let objBranch = Branch_arr.filter(function (e2) {
        return e2.CompanyID == CompanyID;
    });

    fillData(objBranch, "#temp_ddlBranchID", ddlBranchID, false);
}

function ViewSiteLogo() {
    Swal.fire({
        imageUrl: $(hdnUploadedURL).val(),
        imageWidth: 400,
        imageHeight: 200,
        imageAlt: 'Site Logo',
    })
}

function AdminGridSectionColorPickerLoad() {
    $('#table-header-bg-color').colorpicker();
    $('#table-header-text-color').colorpicker();
    $('#pagination-button-bg-color').colorpicker();
    $('#pagination-button-text-color').colorpicker();
    $('#pagination-button-bg-color-hover').colorpicker();
    $('#pagination-button-text-color-hover').colorpicker();
    $('#pagination-button-next-bg-color-hover').colorpicker();
    $('#no-of-entries-text-color').colorpicker();
    $('#page-heading-color').colorpicker();
    $('#btn-success-color').colorpicker();
    $('#btn-success-border-color').colorpicker();
    $('#btn-success-bg-color').colorpicker();
    $('#btn-success-color-hover').colorpicker();
    $('#btn-success-border-color-hover').colorpicker();
    $('#btn-success-bg-color-hover').colorpicker();
    $('#btn-success-disable-color').colorpicker();
    $('#btn-success-disable-bg-color').colorpicker();
    $('#btn-success-disable-border-color').colorpicker();
    $('#btn-primary-color').colorpicker();
    $('#btn-primary-border-color').colorpicker();
    $('#btn-primary-bg-color').colorpicker();
    $('#btn-primary-color-hover').colorpicker();
    $('#btn-primary-border-color-hover').colorpicker();
    $('#btn-primary-bg-color-hover').colorpicker();
    $('#btn-primary-disable-color').colorpicker();
    $('#btn-primary-disable-bg-color').colorpicker();
    $('#btn-primary-disable-border-color').colorpicker();
    $('#btn-secondary-color').colorpicker();
    $('#btn-secondary-border-color').colorpicker();
    $('#btn-secondary-bg-color').colorpicker();
    $('#btn-secondary-color-hover').colorpicker();
    $('#btn-secondary-border-color-hover').colorpicker();
    $('#btn-secondary-bg-color-hover').colorpicker();
    $('#btn-secondary-disable-color').colorpicker();
    $('#btn-secondary-disable-bg-color').colorpicker();
    $('#btn-secondary-disable-border-color').colorpicker();
}

function AdminGridColorTextboxChange(id) {

    var ElementID = id.id;

    AdmiGridFormThemeChange(ElementID, "#" + $("#" + ElementID).val());
}

function AdmiGridFormThemeChange(cssvariablename, property) {

    document.getElementById('admingriddemoframe').contentWindow.document.documentElement.style.setProperty('--' + cssvariablename, property);
}

function AdminGridFilColorTextboxWithValue(Data) {
    $(table_header_bg_color).val(Data.table_header_bg_color);
    $(table_header_text_color).val(Data.table_header_text_color);
    $(pagination_button_bg_color).val(Data.pagination_button_bg_color);
    $(pagination_button_text_color).val(Data.pagination_button_text_color);
    $(pagination_button_bg_color_hover).val(Data.pagination_button_bg_color_hover);
    $(pagination_button_text_color_hover).val(Data.pagination_button_text_color_hover);
    $(pagination_button_next_bg_color_hover).val(Data.pagination_button_next_bg_color_hover);
    $(no_of_entries_text_color).val(Data.no_of_entries_text_color);
    $(page_heading_color).val(Data.page_heading_color);
    $(btn_success_color).val(Data.btn_success_color);
    $(btn_success_border_color).val(Data.btn_success_border_color);
    $(btn_success_bg_color).val(Data.btn_success_bg_color);
    $(btn_success_color_hover).val(Data.btn_success_color_hover);
    $(btn_success_border_color_hover).val(Data.btn_success_border_color_hover);
    $(btn_success_bg_color_hover).val(Data.btn_success_bg_color_hover);
    $(btn_success_disable_color).val(Data.btn_success_disable_color);
    $(btn_success_disable_bg_color).val(Data.btn_success_disable_bg_color);
    $(btn_success_disable_border_color).val(Data.btn_success_disable_border_color);
    $(btn_primary_color).val(Data.btn_primary_color);
    $(btn_primary_border_color).val(Data.btn_primary_border_color);
    $(btn_primary_bg_color).val(Data.btn_primary_bg_color);
    $(btn_primary_color_hover).val(Data.btn_primary_color_hover);
    $(btn_primary_border_color_hover).val(Data.btn_primary_border_color_hover);
    $(btn_primary_bg_color_hover).val(Data.btn_primary_bg_color_hover);
    $(btn_primary_disable_color).val(Data.btn_primary_disable_color);
    $(btn_primary_disable_bg_color).val(Data.btn_primary_disable_bg_color);
    $(btn_primary_disable_border_color).val(Data.btn_primary_disable_border_color);
    $(btn_secondary_color).val(Data.btn_secondary_color);
    $(btn_secondary_border_color).val(Data.btn_secondary_border_color);
    $(btn_secondary_bg_color).val(Data.btn_secondary_bg_color);
    $(btn_secondary_color_hover).val(Data.btn_secondary_color_hover);
    $(btn_secondary_border_color_hover).val(Data.btn_secondary_border_color_hover);
    $(btn_secondary_bg_color_hover).val(Data.btn_secondary_bg_color_hover);
    $(btn_secondary_disable_color).val(Data.btn_secondary_disable_color);
    $(btn_secondary_disable_bg_color).val(Data.btn_secondary_disable_bg_color);
    $(btn_secondary_disable_border_color).val(Data.btn_secondary_disable_border_color);

    AdmiGridFormThemeChange(ReplaceFunc("table_header_bg_color", "_", "-"), "#" + Data.table_header_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("table_header_text_color", "_", "-"), "#" + Data.table_header_text_color);
    AdmiGridFormThemeChange(ReplaceFunc("pagination_button_bg_color", "_", "-"), "#" + Data.pagination_button_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("pagination_button_text_color", "_", "-"), "#" + Data.pagination_button_text_color);
    AdmiGridFormThemeChange(ReplaceFunc("pagination_button_bg_color_hover", "_", "-"), "#" + Data.pagination_button_bg_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("pagination_button_text_color_hover", "_", "-"), "#" + Data.pagination_button_text_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("pagination_button_next_bg_color_hover", "_", "-"), "#" + Data.pagination_button_next_bg_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("no_of_entries_text_color", "_", "-"), "#" + Data.no_of_entries_text_color);
    AdmiGridFormThemeChange(ReplaceFunc("page_heading_color", "_", "-"), "#" + Data.page_heading_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_color", "_", "-"), "#" + Data.btn_success_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_border_color", "_", "-"), "#" + Data.btn_success_border_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_bg_color", "_", "-"), "#" + Data.btn_success_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_color_hover", "_", "-"), "#" + Data.btn_success_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_border_color_hover", "_", "-"), "#" + Data.btn_success_border_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_bg_color_hover", "_", "-"), "#" + Data.btn_success_bg_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_disable_color", "_", "-"), "#" + Data.btn_success_disable_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_disable_bg_color", "_", "-"), "#" + Data.btn_success_disable_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_success_disable_border_color", "_", "-"), "#" + Data.btn_success_disable_border_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_color", "_", "-"), "#" + Data.btn_primary_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_border_color", "_", "-"), "#" + Data.btn_primary_border_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_bg_color", "_", "-"), "#" + Data.btn_primary_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_color_hover", "_", "-"), "#" + Data.btn_primary_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_border_color_hover", "_", "-"), "#" + Data.btn_primary_border_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_bg_color_hover", "_", "-"), "#" + Data.btn_primary_bg_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_disable_color", "_", "-"), "#" + Data.btn_primary_disable_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_disable_bg_color", "_", "-"), "#" + Data.btn_primary_disable_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_primary_disable_border_color", "_", "-"), "#" + Data.btn_primary_disable_border_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_color", "_", "-"), "#" + Data.btn_secondary_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_border_color", "_", "-"), "#" + Data.btn_secondary_border_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_bg_color", "_", "-"), "#" + Data.btn_secondary_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_color_hover", "_", "-"), "#" + Data.btn_secondary_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_border_color_hover", "_", "-"), "#" + Data.btn_secondary_border_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_bg_color_hover", "_", "-"), "#" + Data.btn_secondary_bg_color_hover);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_disable_color", "_", "-"), "#" + Data.btn_secondary_disable_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_disable_bg_color", "_", "-"), "#" + Data.btn_secondary_disable_bg_color);
    AdmiGridFormThemeChange(ReplaceFunc("btn_secondary_disable_border_color", "_", "-"), "#" + Data.btn_secondary_disable_border_color);
}

function ReplaceFunc(string, pattern, replacement) {
    var MyString = string.replaceAll(pattern, replacement);

    return MyString
}

//$().buttonLoader("start") / $().buttonLoader("stop") function Start
(function ($) {
    $.fn.buttonLoader = function (action) {
        var self = $(this);
        //start loading animation
        if (action == 'start') {
            if ($(self).attr("disabled") == "disabled") {
                e.preventDefault();
            }
            //disable buttons when loading state
            $('.has-spinner').attr("disabled", "disabled");
            $(self).attr('data-btn-text', $(self).text());
            //binding spinner element to button and changing button text
            $(self).html('<span class="spinner"><i class="fa fa-spinner fa-spin"></i></span>Loading');
            $(self).addClass('active');
        }
        //stop loading animation
        if (action == 'stop') {
            $(self).html($(self).attr('data-btn-text'));
            $(self).removeClass('active');
            //enable buttons after finish loading
            $('.has-spinner').removeAttr("disabled");
        }
    }
})(jQuery);
//$().buttonLoader("start") / $().buttonLoader("stop") function End