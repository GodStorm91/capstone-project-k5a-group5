
var oTable;
var edit, view;

setupDataTable = function (model) {
    return $('#main-table').dataTable({
        "bRetrieve": true,
        "sDom": "<'row'<'span6 tblBtnGroup'><'span6'f>r>t<'row'<'span6'l><'span6'p>>",
        "aaSorting": [],
        "fnDrawCallback": function (oSettings) {
            $(".toggleActivate").click(function () {
                var currentNode = $(this);
                var myData = { id: $(this).closest('tr').find("td:first").html().trim() },
                        json = JSON.stringify(myData);
                $.ajax({
                    url: model + '/ToggleActivate',
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: json,
                    success: function (result) {
                        if (result.isActive) {
                            currentNode.children('img').attr('src', '/img/icons2/checkmark2.png');
                        } else {
                            currentNode.children('img').attr('src', '/img/icons2/delete.png');
                        }
                    }
                });
            });
            edit = function (modelId) {
                $('#createModal').html('');
                $.ajax({
                    url: '/' + model + '/Edit/' + modelId,
                    type: 'POST',
                    dataType: 'html',
                    success: function (data) {
                        $('#editModal').html(data);
                        $("form").removeData("validator");
                        $("form").removeData("unobtrusiveValidation");
                        $.validator.unobtrusive.parse("form");
                        $('.editor-field').keypress(function (e) {
                            if (e.which == 13) {
                                $(this).parents('form').submit();
                                e.preventDefault();
                                return false;
                            }
                        });
                        $('#editModal').modal();
                    }
                });
            };


            Delete = function (modelId) {
                var currentNode = $(this);
                var myData = { id: $(this).closest('tr').find("td:first").html().trim() },
                        json = JSON.stringify(myData);
                $.ajax({
                    url: model + '/Delete/' + modelId,
                    type: 'POST',
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    data: json,
                    success: function (result) {
                        if (result.isActive) {
                            currentNode.children('img').attr('src', '/img/icons2/checkmark2.png');
                        } else {
                            currentNode.children('img').attr('src', '/img/icons2/delete.png');
                        }
                    }
                });
            };


            view = function (modelId) {
                $.ajax({
                    url: '/' + model + '/View/' + modelId,
                    type: 'POST',
                    dataType: 'html',
                    success: function (data) {
                        $('#viewModal').html(data);
                        $("form").removeData("validator");
                        $("form").removeData("unobtrusiveValidation");
                        $.validator.unobtrusive.parse("form");
                        $('.editor-field').keypress(function (e) {
                            if (e.which == 13) {
                                $(this).parents('form').submit();
                                e.preventDefault();
                                return false;
                            }
                        });
                        $('#viewModal').modal();
                    }
                });
            };
        }
    });
};

setupCrud = function (model) {
    $.extend($.fn.dataTableExt.oStdClasses, {
        "sWrapper": "dataTables_wrapper form-inline"
    });

    oTable = setupDataTable(model);

    $("div.tblBtnGroup").html('<a href="#" role="button" data-toggle="modal" class="btn DTTT_button_text btn-success" id="btnNew"><span>Add new</span></a>');


    setupButtonNew(model);

    $("form").removeData("validator");
    $("form").removeData("unobtrusiveValidation");
    $.validator.unobtrusive.parse("form");

    return oTable;
}


var setupButtonNew = function (model) {
    $("#btnNew").click(function () {
        $('#editModal').html('');
        $.ajax({
            url: '/' + model + '/Create',
            type: 'POST',
            dataType: 'html',
            success: function (data) {
                $('#createModal').html(data);
                $("form").removeData("validator");
                $("form").removeData("unobtrusiveValidation");
                $.validator.unobtrusive.parse("form");
                $('.editor-field').keypress(function (e) {
                    if (e.which == 13) {
                        $(this).parents('form').submit();
                        e.preventDefault();
                        return false;
                    }
                });
                $('#createModal').modal();
            }
        });
    });
};