
$(document).ready(function () {
    $('#example').DataTable();
});

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
    Swal.fire({
        title: "Error",
        text: Message,
        icon: "error",
        dangerMode: true,
    });
}

function MaterialActiveClass_Add_In_Textbox(thisid) {
    if ($("#"+thisid.attributes[1].value).hasClass("Active")) {

    }
    else {
        $("#" + thisid.attributes[1].value).addClass("Active");
    }

}

function MaterialActiveClass_Remove_In_Textbox(thisid) {
    if ($("#" + thisid.attributes[1].value).val().length <= 0) {
        $("#" + thisid.attributes[1].value).removeClass("Active");
    }
    else {
        MaterialActiveClass_Add_In_Textbox(thisid);
    }
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