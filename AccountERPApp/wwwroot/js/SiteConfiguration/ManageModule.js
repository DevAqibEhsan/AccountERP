let Form = "#ManageModuleForm";
let btnSave = "#btnSave"
let txtModuleName = "#txtModuleName";
let txtModuleIcon = "#txtModuleIcon";
let txtModuleNameasID = "#txtModuleNameasID";
let txtModuleOrderNo = "#txtModuleOrderNo";
let chkModuleIsActive = "#chkModuleIsActive";

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllModule();

    $(btnSave).click(function () {
        SaveModuleData();
    });

});

function GetAllModule() {
    postRequest_NotAsync(BaseUrl + "/SiteConfiguration/GetAllModule", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                var ModuleData = "";
                $(res.Data).each(function (i, e) {
                    ModuleData += "<tr>";
                    ModuleData += "<td>" + e.ModuleID+"</td>";
                    ModuleData += "<td>" + e.ModuleName +"</td>";
                    ModuleData += "<td class='text-center'><li class='fas " + e.Icon +"'></li></td>";
                    ModuleData += "<td>" + e.NameAsModuleID +"</td>";
                    ModuleData += "<td>" + e.OrderN +"</td>";
                    ModuleData += "<td>" + (e.IsActive == 1 ? "True":"False") +"</td>";
                    ModuleData += "<td>" + e.CreatedByUserName +"</td>";
                    ModuleData += "<td>" + MomentDateTimeFormat(e.CreatedOn) +"</td>";
                    ModuleData += "<td>" + (e.CreatedByIP != "" ? e.CreatedByIP : "-") +"</td>";
                    ModuleData += "<td>" + e.ModifiedByUserName +"</td>";
                    ModuleData += "<td>" + MomentDateTimeFormat(e.ModifiedOn) +"</td>";
                    ModuleData += "<td>" + (e.ModifiedByIP != "" ? e.ModifiedByIP : "-") +"</td>";
                    ModuleData += "<td class='text-center'><i class='fas fa-edit'></i></td>";
                    ModuleData += "</tr>";
                });

                $("#dataRow").html(ModuleData);

                $('#dataTableModule').DataTable();
            }
        }
        if (res.Status == 401) {
            localStorage.removeItem("userData");
            localStorage.removeItem("Menu");

            window.location.href = baseWebUrl + "Account/Login";
        }
        if (res.Status == 403) {
            ErrorAlert(res.ResponseMsg);
        }
        if (res.statusCode == 404) {
            ErrorAlert(res.reasonPhrase);
        }
        if (res.Status == 320) {
            ErrorAlert(res.ResponseMsg);
        }
        if (res.Status == 500) {
            ErrorAlert(res.ResponseMsg);
        }
        if (res.Status == 600) {
            ErrorAlert(res.ResponseMsg);
        }
        else {
            ErrorAlert(res.ResponseMsg);
        }
    });
}


function SaveModuleData() {

}