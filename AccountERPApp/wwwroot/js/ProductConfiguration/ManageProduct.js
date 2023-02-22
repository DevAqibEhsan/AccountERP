let Form = "#ManageProductForm";
let btnSave = "#btnSave"
let ddlCompanyID = "#ddlCompanyID";
let txtProductName = "#txtProductName";
let txtProductDescription = "#txtProductDescription";
let ddlProductAttributeID = "#ddlProductAttributeID";
let ddlProductBrandID = "#ddlProductBrandID";
let ddlProductCategoryID = "#ddlProductCategoryID";
let ddlProductTypeID = "#ddlProductTypeID";
let txtProductImage = "#txtProductImage";
let ddlManageStock = "#ddlManageStock";
let txtMaxStock = "#txtMaxStock";
let txtMinStock = "#txtMinStock";
let txtReOrderLevel = "#txtReOrderLevel";
let txtCostPrice = "#txtCostPrice";
let txtUserDefinedCostPrice = "#txtUserDefinedCostPrice";
let txtPurchasePrice = "#txtPurchasePrice";
let txtRetailPrice = "#txtRetailPrice";
let txtProfitMarginPercentage = "#txtProfitMarginPercentage";
let txtProfitMarginAmount = "#txtProfitMarginAmount";
let hdnProductID = "#hdnProductID";
let DataTable = "#dataTableProduct";

var oTable;

$(document).ready(function () {

    BaseUrl = $("#baseUrlForMVCAction").val();
    baseApiUrl = $("#baseApiUrl").val();
    baseWebUrl = $("#baseWebUrl").val();

    GetAllProduct();
    var connection = new signalR.HubConnectionBuilder().withUrl(baseApiUrl + "signalrServer",
        {
            skipNegotiation: true,
            transport: signalR.HttpTransportType.WebSockets
        }).build();
    connection.start();
    connection.on("LoadProduct", function () {

        $(DataTable).DataTable().destroy();

        GetAllProduct();

    });

    $(btnSave).click(function () {
        SaveProductData();
    });

});

function GetProductByID(id) {

    postRequest(BaseUrl + "/ProductConfiguration/GetProductByID/" + id, null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {

                $(ddlCompanyID).val();
                $(txtProductName).val(res.Data.ProductName);
                $(txtProductDescription).val();
                $(ddlProductAttributeID).val();
                $(ddlProductCategoryID).val();
                $(ddlProductTypeID).val();
                $(ddlManageStock).val();
                $(txtMaxStock).val();
                $(txtMinStock).val();
                $(txtReOrderLevel).val();
                $(txtCostPrice).val();
                $(txtUserDefinedCostPrice).val();
                $(txtPurchasePrice).val();
                $(txtRetailPrice).val();
                $(txtProfitMarginPercentage).val();
                $(txtProfitMarginAmount).val();
                $(hdnProductID).val(res.Data.ProductID);

                $('#imgProductImage').attr('src', ".././ProductMedia/CompanyID_" + res.Data.CompanyID + "/" + res.Data.Logo);

                if (res.Data.IsActive == 1) {
                    $("#chkProductIsActive").prop("checked", true);
                }
                else {
                    $("#chkProductIsActive").prop("checked", false);
                }

                $("#dvLogo").show();

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

function GetAllProduct() {

    GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown();

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
            "url": BaseUrl + "/ProductConfiguration/GetAllProduct",
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
                "targets": [25],
                "visible": true,
                "searchable": false,
                "sortable": true
            }
        ],

        "columns": [
            {
                "data": "ProductID",
                "name": "ProductID",
                "width": "50px",
                "render": function (data) { return '<a href="javascript:;" onclick="GetProductByID(' + data + ')" data-id="' + data + '">' + data + '</a>' }
            },
            {
                "data": "CompanyName",
                "name": "CompanyName",
                "width": "200px"
            },
            {
                "data": "ProductName",
                "name": "ProductName",
                "width": "200px"
            },

            {
                "data": "Description",
                "name": "Description",
                "width": "200px"
            },

            {
                "data": "ProductAttributeName",
                "name": "ProductAttributeName",
                "width": "200px"
            },

            {
                "data": "ProductBrandName",
                "name": "ProductBrandName",
                "width": "200px"
            },

            {
                "data": "ProductCategoryName",
                "name": "ProductCategoryName",
                "width": "200px"
            },

            {
                "data": "ProductTypeName",
                "name": "ProductTypeName",
                "width": "200px"
            },

            {
                "data": "ManageStock",
                "name": "ManageStock",
                "width": "200px",
                "render": function (data) {
                    return (data == 1 ? "Yes" : "No")
                }
            },

            {
                "data": "MaxStock",
                "name": "MaxStock",
                "width": "200px"
            },

            {
                "data": "MinStock",
                "name": "MinStock",
                "width": "200px"
            },

            {
                "data": "ProductImage",
                "name": "ProductImage",
                "width": "200px",
                "render": function (data) {
                    return (data != "" ? "Yes" : "No")
                }
            },

            {
                "data": "ReOrderLevel",
                "name": "ReOrderLevel",
                "width": "200px"
            },

            {
                "data": "CostPrice",
                "name": "CostPrice",
                "width": "200px"
            },

            {
                "data": "UserDefinedCostPrice",
                "name": "UserDefinedCostPrice",
                "width": "200px"
            },

            {
                "data": "PurchasePrice",
                "name": "PurchasePrice",
                "width": "200px"
            },

            {
                "data": "RetailPrice",
                "name": "RetailPrice",
                "width": "200px"
            },

            {
                "data": "ProfitMarginPercentage",
                "name": "ProfitMarginPercentage",
                "width": "200px"
            },

            {
                "data": "ProfitMarginAmount",
                "name": "ProfitMarginAmount",
                "width": "200px"
            },

            {
                "data": "IsActive",
                "name": "IsActive",
                "width": "80px",
                "render": function (data) {
                    return (data == 1 ? "True" : "False")
                }
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
                    return "<i class='fas fa-edit' onclick='GetProductByID(" + full.ProductID + ")' data-id='" + full.ProductID + "'></i>";
                }
            }
        ]

        //}).on("draw.dt", function () {
        //    HideKeys();

    });
}

function SaveProductData() {
    $(btnSave).prop("disabled", true);

    let ProductID = Number($(hdnProductID).val());

    var formData = new FormData();

    formData.append("ProductID", ProductID);
    formData.append("ProductName", $(txtProductName).val());
    formData.append("Description", $(txtProductDescription).val());
    formData.append("ProductAttributeID", Number($(ddlProductAttributeID).val()));
    formData.append("ProductBrandID", Number($(ddlProductBrandID).val()));
    formData.append("ProductTypeID", Number($(ddlProductTypeID).val()));
    formData.append("ProductCategoryID", Number($(ddlProductCategoryID).val()));
    formData.append("file", $(txtProductImage)[0].files[0]);
    formData.append("MinStock", Number($(txtMinStock).val()));
    formData.append("MaxStock", Number($(txtMaxStock).val()));
    formData.append("ReOrderLevel", Number($(txtReOrderLevel).val()));
    formData.append("ManageStock", Number($(ddlManageStock).val()));
    formData.append("CostPrice", $(txtCostPrice).val());
    formData.append("UserDefinedCostPrice", $(txtUserDefinedCostPrice).val());
    formData.append("PurchasePrice", $(txtPurchasePrice).val());
    formData.append("RetailPrice", $(txtRetailPrice).val());
    formData.append("ProfitMarginPercentage", Number($(txtProfitMarginPercentage).val()));
    formData.append("ProfitMarginAmount", $(txtProfitMarginAmount).val());
    formData.append("CompanyID", $(ddlCompanyID).val());
    formData.append("IsActive", CheckboxIsChecked("chkProductIsActive"));
    


    if (ProductID > 0) {
        postRequestFormData(baseApiUrl + "api/ManageProduct/UpdateProduct", formData, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    Swal.fire({
                        title: 'Saved',
                        icon: 'success',
                        html: res.ResponseMsg
                    }).then((result) => {
                        if (result.isConfirmed) {
                            CancelButtonAction();
                        }
                    });
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
        postRequestFormData(baseApiUrl + "api/ManageProduct/AddProduct", formData, function (res) {
            if (res.Status == 200) {
                if (res.Data != null) {
                    Swal.fire({
                        title: 'Saved',
                        icon: 'success',
                        html: res.ResponseMsg
                    }).then((result) => {
                        if (result.isConfirmed) {
                            CancelButtonAction();
                        }
                    });
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

function GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown() {
    postRequest(BaseUrl + "/ProductConfiguration/GetAllProduct_Attribute_Brand_Category_Type_DataForDropDown", null, function (res) {
        if (res.Status == 200) {
            if (res.Data != null) {
                fillData(res.Data.ProductAttribute, "#temp_ddlProductAttributeID", ddlProductAttributeID, false);
                fillData(res.Data.ProductBrand, "#temp_ddlProductBrandID", ddlProductBrandID, false);
                fillData(res.Data.ProductCategory, "#temp_ddlProductCategoryID", ddlProductCategoryID, false);
                fillData(res.Data.ProductType, "#temp_ddlProductTypeID", ddlProductTypeID, false);
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

function ClearAllField() {
    $(btnSave).prop("disabled", false);
    $(ddlCompanyID).val("");
    $(txtProductName).val("");
    $(txtProductDescription).val("");
    $(ddlProductAttributeID).val("");
    $(ddlProductCategoryID).val("");
    $(ddlProductTypeID).val("");
    $(ddlManageStock).val("");
    $(txtMaxStock).val("");
    $(txtMinStock).val("");
    $(txtReOrderLevel).val("");
    $(txtCostPrice).val("");
    $(txtUserDefinedCostPrice).val("");
    $(txtPurchasePrice).val("");
    $(txtRetailPrice).val("");
    $(txtProfitMarginPercentage).val("");
    $(txtProfitMarginAmount).val("");
    $(hdnProductID).val("0");
    $("#chkProductIsActive").prop("checked", false);
}

function CancelButtonAction() {
    ClearAllField();
    $(DataTable).DataTable().destroy();
    GetAllProduct();
    GridShow();
}