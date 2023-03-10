
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