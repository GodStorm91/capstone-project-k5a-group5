var setupOrderTicket = function () {
    $(".order-ticket-info").click(function () {
        $(this).closest("ul").children("li").removeClass("active");
        $(this).closest("ul").find(".order-ticket-info").css('cursor', 'pointer');
        $(this).closest("li").addClass("active");
        $(this).css('cursor', 'initial');
        index = $(this).closest("li").index();
        $(this).closest(".tabbable").children(".tab-content").children(".tab-pane").removeClass("active")
        $($(this).closest(".tabbable").children(".tab-content").children(".tab-pane")[index]).addClass("active");
    });
};

var createOrderTicket = function (order) {
    var ticket = $('<li id="order-' + order.OrderId + '">\
    <div class="ticket-container span12 ticket order-ticket">\
        <div class="order-ticket-info">\
            <div class="row-fluid">\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <span class="myToolTip" rel="tooltip" title="Order Number"style="font-size: 15px; color: #969696">#</span>\
                        </dt>\
                        <dd class="order-number">\
                            </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/user.png" class="myTooltip" title="Receiver Name" width="15px" /></dt><dd class="receiver-name"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/phone.png" class="myToolTip" title="Receiver Phone" width="15px" /></dt><dd class="receiver-phone"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/info.png" class="myToolTip" title="Properties" width="15px" /></dt><dd class="properties"><span\
                                class="label label-success"></span> <span class="label label-info"></span>\
                            </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/bill.png" class="myToolTip" title="Amount to collect" width="15px" /></dt><dd\
                                class="amount-to-be-collected"></dd></dl>\
                </div>\
                <div class="column dueDate">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons2/calendar.png" class="myToolTip" title="Due Date" width="15px" /></dt><dd class="dueDate"></dd></dl>\
                </div>\
                <div class="column fee">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/coin.png" class="myToolTip" title="Fee" width="15px" /></dt><dd class="fee"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/notepencil32.png" class="myToolTip" title="Note" width="15px" /></dt><dd class="note"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt><span class="myToolTip" style="font-size: 15px; color: #969696">@</span> </dt>\
                        <dd class="full-address">\
                        </dd>\
                    </dl>\
                </div>\
            </div>\
        </div>\
        <div class="ticket-btn-group">\
            <a href="#" onclick="" role="button" class="deleteOrder myToolTip btn action" data-toggle="modal" rel="tooltip" title="Cancel Order">\
                <img src="/img/icons2/cross.png" alt="Cancel Order" width="15"></a><a\
                    href="#" onclick="" role="button" class="editOrder myToolTip btn action" data-toggle="modal" rel="tooltip"><img src="/img/icons2/pencil.png"\
                        alt="Edit Order" width="15" title="Edit Order"></a>\
            <a href="#" onclick="" role="button"\
                            class="createItem myToolTip btn action" data-toggle="modal" title="Add New Item"><img src="/img/icons2/add.png" alt="Add New Item"\
                                width="15" /></a></div>\
    </div>\
</li>\
');
    return setOrderTicketInfo(ticket,order);
};

var setOrderTicketInfo = function (ticket, order) {
    ticket.find('.order-number').html(order.OrderId);
    ticket.find('.receiver-name').html(order.ReceiverName);
    ticket.find('.receiver-phone').html(order.ReceiverPhone);
    ticket.find('.properties').html('<span class="label label-success">' + order.DeliveryOption + '</span>                                            <span class="label label-info">' + order.OrderPaymentType + '</span>');
    ticket.find('.amount-to-be-collected').html(order.AmountToBeCollected + ' VNĐ');
    if (order.DueDate.Date == '') {
        ticket.find('dd.dueDate').html('<span class="label label-important">Not set yet</span>&nbsp;');
    } else {
        ticket.find('dd.dueDate').html('<span class="label label-important">' + order.DueDate.Date + ' ' + order.DueDate.Time + '</span>&nbsp;');
    }
    if (order.Fee == null) {
        ticket.find('dd.fee').html('<span class="label label-important">Not set yet</span>');
    } else {
        ticket.find('dd.fee').html(order.Fee);
    }
    if (order.Note == null) {
        ticket.find('.note').html('None');
    } else {
        ticket.find('.note').html(order.Note);
    }
    ticket.find('.full-address').html(order.ReceiverAddress);
    ticket.find('.ticket-btn-group .deleteOrder').attr('onclick', 'cancelOrder(' + order.OrderId + ')');
    ticket.find('.ticket-btn-group .editOrder').attr('onclick', 'editOrder(' + order.OrderId + ')');
    ticket.find('.ticket-btn-group .createItem').attr('onclick', 'createItemFor(' + order.OrderId + ')');
    return ticket;
};

var createItemFor = function (orderId) {
    $.post('/Items/Create/', { orderId: orderId }, function (data) {
        $('#mainModal').html(data);
        $('#mainModal').modal();
        refreshValidation();
        setupItemCreateForm();
        $('.editor-field').keypress(function (e) {
            if (e.which == 13) {
                $(this).parents('form').submit();
                e.preventDefault();
                return false;
            }
        });

    });
};

var cancelOrder = function (orderId) {
    bootbox.confirm("Are you sure to cancel/delete this order?", function (result) {
        if (result) {
            $.post('/Orders/Cancel/' + orderId, function (result) {
                if (result.success) {
                    $.blockUI();
                    window.location.reload();
                } else {
                    bootbox.alert('Unable to cancel/delete this order');
                }
            });
        }
    });
};

//var cancelOrder = function (orderId) {
//    bootbox.confirm("Are you sure to delete this order?", function (result) {
//        if (result) {
//            confirmCancelOrder(orderId);
//        }
//    });
//};

//var confirmCancelOrder = function (orderId) {
//    $.post('/Orders/Cancel/'+orderId, function (result) {
//        if (result.success) {
//            $('#order-' + orderId).remove();
//            $('#tab-order-' + orderId).remove();
//            setupOrderTicket();
//        }
//    });
//}

var editOrder = function (orderId) {
    $.post('/Orders/Edit/', { id: orderId }, function (data) {
        $('#mainModal').html(data);
        refreshValidation();
        $('.editor-field').keypress(function (e) {
            if (e.which == 13) {
                $(this).parents('form').submit();
                e.preventDefault();
                return false;
            }
        });
        $('#mainModal').modal();
    });
};

//var cancelItem = function (itemId) {
//    bootbox.confirm("Are you sure to delete this item?", function (result) {
//        if (result) {
//            confirmCancelItem(itemId);
//        }
//    });
//};

//var confirmCancelItem = function (itemId) {
//    $.post('/Items/Cancel/'+itemId, function (result) {
//        if (result.success) {
//            if ($('#item-' + itemId).parent().children().length == 1) {
//                $('#item-' + itemId).parent().append('<li class="no-item">There is no item in this order.</li>');
//            }
//            $('#item-' + itemId).remove();
//            //setupItemTicket();
//        }
//    });
//};

var cancelItem = function (itemId) {
    bootbox.confirm("Are you sure to cancel/delete this item?", function (result) {
        if (result) {
            $.post('/Items/Cancel/' + itemId, function (result) {
                if (result.success) {
                    $.blockUI();
                    window.location.reload();
                } else {
                    bootbox.alert('Unable to cancel/delete this item');
                }
            });
        }
    });
};

var editItem = function (itemId) {
    $.post('/Items/Edit/', { id: itemId }, function (data) {
        $('#mainModal').html(data);
        refreshValidation();
        $('.editor-field').keypress(function (e) {
            if (e.which == 13) {
                $(this).parents('form').submit();
                e.preventDefault();
                return false;
            }
        });
        $('#mainModal').modal();
        setupItemEditForm();
    });
};

var createItemTicket = function (item) {
    var ticket = $('<li id="item-' + item.ItemId + '"><div class="ticket-container span12 ticket item-ticket"><div class="row-fluid"><div class="column left-column"><dl class="dl-horizontal"><dt><img src="/img/icons/box.png" alt="Product" title="Product" width="15"/></dt><dd class="item-name"></dd><dt><img src="/img/icons/font_size.png" alt="Size" title="Size" width="15"/></dt><dd class="size"></dd></dl></div><div class="column center-column"><dl class="dl-horizontal"><dt><img src="/img/icons/chart_bar.png" alt="Quantity" title="Quantity" width="15"/></dt><dd class="quantity"></dd><dt><img src="/img/icons/gram_weight.png" alt="Weight" title="Weight" width="15"/></dt><dd class="weight"></dd></dl></div><div class="column right-column"><dl class="dl-horizontal"><dt><img src="/img/icons/info.png" title="Properties" width="15px"/></dt><dd class="properties"></dd><dt><img src="/img/icons/notepencil32.png" title="Note" width="15px"/><dd class="note"></dd></dl><div class="ticket-btn-group"><a href="#" role="button" rel="tooltip" class="deleteItem myToolTip btn action" data-toggle="modal" title="Delete"><img src="/img/icons2/cross.png" alt="Delete" width="15"></a><a href="#" role="button" rel="tooltip" class="editItem myToolTip btn action" title="Edit" data-toggle="modal"><img src="/img/icons2/pencil.png" alt="Edit" width="15"></a></div></div></div></div></li>');

    //    ticket.find('.item-name').html(item.Name);
    //    ticket.find('.size').html(item.Size);
    //    ticket.find('.quantity').html(item.Quantity);
    //    ticket.find('.weight').html(item.Weight);
    //    if (!item.IsFragile && !item.HasHighValue) { ticket.find('.properties').html('None'); };
    //    if (item.IsFragile) { ticket.find('.properties').append('<span class="label label-success">Fragile</span>') };
    //    if (item.HasHighValue) { ticket.find('.properties').append('<span class="label label-info">High Value</span>') }
    //    ticket.find('.note').html(item.Note);
    //    ticket.find('.ticket-btn-group .deleteItem').attr('onclick', 'cancelItem(' + item.ItemId + ')');
    //    ticket.find('.ticket-btn-group .editItem').attr('onclick', 'editItem(' + item.ItemId + ')');
    //    return ticket;
    return setItemTicketInfo(ticket, item);
};

var setItemTicketInfo = function (ticket, item) {
    ticket.find('.item-name').html(item.Name);
    ticket.find('.size').html(item.Size);
    ticket.find('.quantity').html(item.Quantity);
    ticket.find('.weight').html(item.Weight);
    if (!item.IsFragile && !item.HasHighValue) { ticket.find('.properties').html('None'); } else {ticket.find('.properties').html('') };
    if (item.IsFragile) { ticket.find('.properties').append('<span class="label label-success">Fragile</span>&nbsp;') };
    if (item.HasHighValue) { ticket.find('.properties').append('<span class="label label-info">High Value</span>') }
    if (item.Note != null) {ticket.find('.note').html(item.Note)} else {ticket.find('.note').html('None')};
    ticket.find('.ticket-btn-group .deleteItem').attr('onclick', 'cancelItem(' + item.ItemId + ')');
    ticket.find('.ticket-btn-group .editItem').attr('onclick', 'editItem(' + item.ItemId + ')');
    return ticket;
}

var setupOrderCreateForm = function () {
    $('#order-create-form').submit(function () {
        if ($(this).valid()) {
            $.ajax({
                type: 'POST',
                url: $(this).attr("action"),
                data: $(this).serialize(),
                success: function (result) {
                    if (result.success == true) {
                        $('#order-list').append(createOrderTicket(result.order));
                        $('#tab-items').append('<div class="tab-pane" id="tab-order-' + result.order.OrderId + '"><ul><li class="no-item">There is no item in this order.</li></ul></div>');
                        setupOrderTicket();
                        $('#mainModal').modal('hide');
                    } else {
                        bootbox.alert('Failed to create order!');
                    }
                },
                async: false
            });
        }
        return false;
    });
};

var setupOrderEditForm = function () {
    $('#order-edit-form').submit(function () {
        if ($(this).valid()) {
            $.ajax({
                type: 'POST',
                url: $(this).attr("action"),
                data: $(this).serialize(),
                success: function (result) {
                    if (result.success == true) {
                        var orderId = $('#order-edit-form #OrderId').val();
                        var ticket = $('#order-' + orderId);
                        var order = result.order
                        setOrderTicketInfo(ticket, result.order)
                        ticket.find('.order-ticket').removeClass('rejected');
                        ticket.find('.rejected-header').remove();
                        setupOrderTicket();
                        $('#mainModal').modal('hide');
                    } else {
                        bootbox.alert('Failed to edit order!');
                    }
                },
                async: false
            });
        }
        return false;
    });
};


var setupItemCreateForm = function () {
    $('#item-create-form').submit(function () {
        if ($(this).valid()) {
            $.ajax({
                type: 'POST',
                url: $(this).attr("action"),
                data: $(this).serialize(),
                success: function (result) {
                    if (result.success == true) {
                        $('#tab-order-' + result.item.OrderId + ' > ul').append(createItemTicket(result.item));
                        $('#tab-order-' + result.item.OrderId + ' > ul li.no-item').remove();
                        $('#mainModal').modal('hide');
                    } else {
                        bootbox.alert('Failed to create item!');
                    }
                },
                async: false
            });
        }
        return false;
    });
};

var setupItemEditForm = function () {
    $('#item-edit-form').submit(function () {
        if ($(this).valid()) {
            $.ajax({
                type: 'POST',
                url: $(this).attr("action"),
                data: $(this).serialize(),
                success: function (result) {
                    if (result.success == true) {
                        var itemId = $('#item-edit-form #ItemId').val();
                        var ticket = $('#item-' + itemId);
                        var item = result.item
                        //                        ticket.find('.item-name').html(item.Name);
                        //                        ticket.find('.size').html(item.Size);
                        //                        ticket.find('.quantity').html(item.Quantity);
                        //                        ticket.find('.weight').html(item.Weight);
                        //                        if (!item.IsFragile && !item.HasHighValue) { ticket.find('.properties').html('None'); };
                        //                        if (item.IsFragile) { ticket.find('.properties').append('<span class="label label-success">Fragile</span>') };
                        //                        if (item.HasHighValue) { ticket.find('.properties').append('<span class="label label-info">High Value</span>') }
                        //                        ticket.find('.note').html(item.Note);
                        //                        ticket.find('.ticket-btn-group .deleteItem').attr('onclick', 'cancelItem(' + item.ItemId + ')');
                        //                        ticket.find('.ticket-btn-group .editItem').attr('onclick', 'editItem(' + item.ItemId + ')');
                        setItemTicketInfo(ticket, item);
                        $('#mainModal').modal('hide');
                    } else {
                        bootbox.alert('Failed to edit item!');
                    }
                },
                async: false
            });
        }
        return false;
    });
};