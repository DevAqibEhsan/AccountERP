
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