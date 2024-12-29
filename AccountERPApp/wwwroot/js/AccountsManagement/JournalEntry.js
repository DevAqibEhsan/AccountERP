let Form = "#JournalEntryForm";
let btnSave = "#btnSave"
let btnAddJournalEntryDetailAddMoreRow = "#btnAddJournalEntryDetailAddMoreRow";
let hdnJournalEntryID = "#hdnJournalEntryID";
let hdnJournalEntryDetailCount = "#hdnJournalEntryDetailCount";
let txtMemo = "#txtMemo";
let txtAttachment = "#txtAttachment";
let DataTable = "#dataTableJournalEntry";

let AccountArray = [];

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllJournalEntry();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadJournalEntry", function () {

        $(DataTable).DataTable().destroy();

        GetAllJournalEntry();

    });

    $(btnSave).click(function () {
        SaveJournalEntryData();
    });

    $(btnAddJournalEntryDetailAddMoreRow).click(function () {
        var RowCount = parseInt($(hdnJournalEntryDetailCount).val()) + 1;

        var MakeRow = CreatingRow(RowCount);

        $(".clsRowJournalEntryDetail:last").after(MakeRow);

        $(hdnJournalEntryDetailCount).val(RowCount);
        
    });

    $(".txtDebitField").change(function () {
        alert("The text has been changed.");
    });

    $(".txtCreditField").change(function () {
        alert("The text has been changed.");
    });

});

function GetJournalEntryByID(id) {

    postRequest(BaseUrl + "/AccountsManagement/GetJournalEntryByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(hdnJournalEntryID).val(res.Data.JournalEntryID);
                $(txtMemo).val(res.Data.Memo);
                if (res.Data.CompanyLogo != null && res.Data.CompanyLogo != "") {
                    $(hdnUploadedURL).val(".././JournalEntryMedia/" + res.Data.Attachment);
                    $("#dvLogo").show();
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

function GetAllJournalEntry() {

    GetAccountForDropdown();

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
            "url": BaseUrl + "/AccountsManagement/GetAllJournalEntry",
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
                "targets": [11],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "JournalEntryID",
                "name": "JournalEntryID",
                "width": "110px",
                "render": function (data, type, full, meta) { return '<a href="javascript:;" onclick="GetJournalEntryByID(' + full.JournalEntryID + ')" data-id="' + full.JournalEntryID + '">' + full.JournalEntryCode + '</a>' }
            },
            {
                "data": "CompanyName",
                "name": "CompanyName",
                "width": "115px"
            },
            {
                "data": "Debit",
                "name": "Debit",
                "width": "200px"
            },
            {
                "data": "Credit",
                "name": "Credit",
                "width": "200px"
            },
            {
                "data": "Memo",
                "name": "Memo",
                "width": "200px"
            },
            {
                "data": "Attachment",
                "name": "Attachment",
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
                    return "<i class='fas fa-edit' onclick='GetJournalEntryByID(" + full.JournalEntryID + ")' data-id='" + full.JournalEntryID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveJournalEntryData() {
    $(btnSave).prop("disabled", true);

    let JournalEntryID = Number($(hdnJournalEntryID).val());
    let JournalEntryDetailCount = Number($(hdnJournalEntryDetailCount).val());

    let JournalEntryDetail = [];
    var formData = new FormData();

    for (var i = 1; i <= JournalEntryDetailCount; i++ ) {
        let obj = {
            AccountID: Number($("#ddlSubAccountID_"+i).val()),
            Description: $("#txtDescription_"+i).val(),
            Debit: $("#txtDebit_"+i).val(),
            Credit: $("#txtCredit_"+i).val()
        };
        JournalEntryDetail.push(obj);
    }

    formData.append("JournalEntryID", JournalEntryID);
    formData.append("Memo", txtMemo);
    formData.append("file", $(txtAttachment)[0].files[0]);
    formData.append("JournalEntryDetail", JSON.stringify(JournalEntryDetail));

    if (JournalEntryID > 0) {
        postRequestFormData(baseApiUrl + "api/ManageJournalEntry/UpdateJournalEntry", formData, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    SuccessAlertWithConfirmAndCancelButtonActionFuncExecute(res.ResponseMsg);
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
        postRequestFormData(baseApiUrl + "api/ManageJournalEntry/AddJournalEntry", formData, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    SuccessAlertWithConfirmAndCancelButtonActionFuncExecute(res.ResponseMsg);
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

function GetAccountForDropdown() {
    postRequest(BaseUrl + "/AccountsManagement/GetChartAccountForSubAccountDropdown", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                AccountArray = res.Data;

                fillData(res.Data, "#temp_ddlSubAccountID_1", "#ddlSubAccountID_1", false);
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

function CreatingRow(RowCount) {

    var html = "<tr class=\"clsRowJournalEntryDetail\" id=\"JournalEntryRowCount_" + RowCount+"\">";
    html += "<td>" + RowCount+"</td>";
    html += "<td><select id=\"ddlSubAccountID_" + RowCount + "\" class=\"form-control\">";
    html += "<option value=\"0\">Plesae Select</option>";
    $(AccountArray).each(function (i, e) {
        html += "<option value=" + e.AccountID + ">" + e.AccountCode + "  " + e.AccountByCompanyBranchName+"</option>";
    });
    html += "</select ></td> ";
    html += "<td><input type=\"text\" class=\"form-control\" id=\"txtDescription_" + RowCount+"\" placeholder=\"Description\"></td>";
    html += "<td><input type=\"text\" class=\"form-control txtDebitField\" id=\"txtDebit_" + RowCount+"\" placeholder=\"Debit Amount\"></td>";
    html += "<td><input type=\"text\" class=\"form-control txtCreditField\" id=\"txtCredit_" + RowCount+"\" placeholder=\"Credit Amount\"></td>";
    html += "<td></td>";
    html += "<td></td>";
    html += "<td></td>";
    html += "<td></td>";
    html += "<td></td>";
    html += "<td></td>";
    html += "<td></td>";
    html += "</tr>";

    return html;
}

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(hdnJournalEntryID).val(0);
    $(hdnJournalEntryDetailCount).val(1);
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllJournalEntry();
    GridShow();
}