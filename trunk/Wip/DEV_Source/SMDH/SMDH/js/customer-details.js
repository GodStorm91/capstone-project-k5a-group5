var refreshAddressTable = function () {
    $.ajax({
        type: 'POST',
        url: '/Customers/GetAddressTable',
        data: { customerId: customerId },
        success: function (table) {
            $('#address-table-div').html(table);
            refreshDatatables('CustomerAddresses');
        },
        async: false
    });
};

var refreshContactTable = function () {
    $.ajax({
        type: 'POST',
        url: '/Customers/GetContactTable',
        data: { customerId: customerId },
        success: function (table) {
            $('#contact-table-div').html(table);
            refreshDatatables('Contacts');
        },
        async: false
    });
};

var editCustomerAddress = function (customerAddressId) {
    $('#createModal').html('');
    $.ajax({
        url: '/CustomerAddresses/Edit/' + customerAddressId,
        type: 'post',
        success: function (data) {
            $('#editModal').html(data);
            $("form #CustomerId").val(customerId);
            refreshValidation();
            $('.editor-field').keypress(function (e) {
                if (e.which == 13) {
                    $(this).parents('form').submit();
                    e.preventdefault();
                    return false;
                }
            });
            $('#editModal').modal();
        },
        error: function (error) {

        }
    });
};

var deleteCustomerAddress = function (customerAddressId) {
    bootbox.confirm("Delete this address?", function (confirmed) {
        if (confirmed) {
            $.ajax({
                url: '/CustomerAddresses/Remove/' + customerAddressId,
                type: 'post',
                success: function (result) {
                    if (result.success) {
                        refreshAddressTable();
                    } else {
                        bootbox.alert('Failed to delete address!');
                    }
                }
            });
        }
    });
    //    bootbox.dialog("Delete this address?", [{
    //        "label": "Cancel",
    //        "class": "btn"
    //    }, {
    //        "label": "Confirm",
    //        "class": "btn-danger",
    //        "callback": function () {
    //            $.ajax({
    //                url: '/CustomerAddresses/Delete/' + customerAddressId,
    //                type: 'post',
    //                success: function (result) {
    //                    if (result.success) {
    //                        refreshAddressTable();
    //                    }
    //                }
    //            });
    //        }
    //    }]);
};

var deleteContact = function (contactId) {
    bootbox.confirm("Delete this contact?", function (confirmed) {
        if (confirmed) {
            $.ajax({
                url: '/Contacts/Delete/' + contactId,
                type: 'post',
                success: function (result) {
                    if (result.success) {
                        refreshContactTable();
                    } else {
                        bootbox.alert('Failed to delete contact!');
                    }
                }
            });
        }
    });
    //    bootbox.dialog("Delete this contact?", [{
    //        "label": "Cancel",
    //        "class": "btn"
    //    }, {
    //        "label": "Confirm",
    //        "class": "btn-danger",
    //        "callback": function () {
    //            $.ajax({
    //                url: '/Contacts/Delete/' + contactId,
    //                type: 'post',
    //                success: function (result) {
    //                    if (result.success) {
    //                        refreshContactTable();
    //                    }
    //                }
    //            });
    //        }
    //    }]);
};

var editContact = function (contactId) {
    $('#createModal').html('');
    $.ajax({
        url: '/Contacts/Edit/' + contactId,
        type: 'post',
        success: function (data) {
            $('#editModal').html(data);
            $("form #CustomerId").val(customerId);
            refreshValidation();
            $('.editor-field').keypress(function (e) {
                if (e.which == 13) {
                    $(this).parents('form').submit();
                    e.preventdefault();
                    return false;
                }
            });
            $('#editModal').modal();
        },
        error: function (error) {

        }
    });
};

var refreshDatatables = function (model) {
    var table;
    if (model == 'Contacts') table = '#contact-table';
    else table = '#address-table';

    $(table).dataTable({
        "bRetrieve": true,
        "sDom": "t<'row'<'span6 tblBtnGroup'><'span6'>r>"
    });

    $(table).parent().find("div.tblBtnGroup").html('<a href="#" role="button" data-toggle="modal" class="btn DTTT_button_text btn-success" id="btnNew' + model + '"><span>Add</span></a>');

    $("#btnNew" + model).click(function () {

        $('#editModal').html('');
        $.ajax({
            url: '/' + model + '/Create',
            type: 'POST',
            dataType: 'html',
            success: function (data) {
                $('#createModal').html(data);
                $("form #CustomerId").val(customerId);
                refreshValidation();
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

$("#customer-edit-form").submit(function () {
    var success = false;
    if ($(this).valid()) {
        $.ajax({
            type: 'POST',
            url: $(this).attr("action"),
            data: $(this).serialize(),
            success: function (result) {
                if (result.success) {
                    $('#editCustomerInfoModal').modal('hide');
                    $('#CompanyName').html(result.customer.CompanyName);
                    $('#DisplayName').html(result.customer.DisplayName);
                    $('#PhoneNumber').html(result.customer.PhoneNumber);
                    $('#CurrentContractCode').html(result.customer.CurrentContractCode);
                    $('#Note').html(result.customer.Note);
                } else {
                    bootbox.alert('Failed to edit customer!');
                }
            },
            async: false
        });
    }
    return false;
});

var toggleActivate = function (model, modelId) {
    $.ajax({
        url: '/' + model + '/ToggleActivate/' + modelId,
        type: 'post',
        success: function (result) {
            var imgId;
            if (model == 'Contacts') imgId = 'contact-' + modelId + '-status';
            else imgId = 'address-' + modelId + '-status';
            if (result.isActive) {
                $('#' + imgId).attr('src', '/img/icons2/checkmark2.png');
            } else {
                $('#' + imgId).attr('src', '/img/icons2/delete.png');
            }
        }
    });
};