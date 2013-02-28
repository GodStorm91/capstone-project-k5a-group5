var createOrderTickets = function (orders) {
    var html = '';
    $.each(orders, function (index, order) {
        var ticket = $('<li>\
    <div class="ticket-container span12 ticket order-ticket">\
        <div class="order-ticket-info span11 left-column" style="padding-right:0;">\
            <div class="row-fluid">\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <a href="#">\
                                <span class="myToolTip" rel="tooltip" title="Order Number"style="font-size: 15px;color: #969696">#</span>\
                            </a>\
                        </dt><dd class="orderNumber"><span\
                                class="label label-success"></span> <span class="label label-info"></span>\
                            </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <a href="#" class="myTooltip"  rel="tooltip" title="Properties">\
                                <img src="/img/icons/info.png" title="Properties" width="15px" />\
                            </a>\
                        </dt><dd class="properties">\
                            </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <a href="#" class="myTooltip"  rel="tooltip" title="Amount to collect">\
                                <img src="/img/icons/bill.png" title="Amount to collect" width="15px" />\
                            </a>\
                        </dt><dd\
                                class="amount-to-be-collected"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <a href="#" class="myTooltip"  rel="tooltip" title="Amount to collect">\
                                <img src="/img/icons2/calendar.png" title="Due Date" width="15px" />\
                            </a>\
                        </dt><dd class="dueDate"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <a href="#" class="myTooltip"  rel="tooltip" title="Fee">\
                                <img src="/img/icons/coin.png" title="Fee" width="15px" />\
                            </a>\
                        </dt><dd class="fee"></dd></dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <a href="#" class="myTooltip"  rel="tooltip" title="Note">\
                                <img src="/img/icons/notepencil32.png" title="Note" width="15px" />\
                            </a>\
                        </dt><dd class="note"></dd></dl>\
                </div>\
				<div class="column">\
					<dl class="dl-horizontal">\
						<dt>\
                            <a href="#" class="myTooltip"  rel="tooltip" title="Receiver Address">\
                                <span style="font-size: 15px; color: #969696">@</span>\
                            </a>\
                         </dt>\
						<dd class="full-address">\
						</dd>\
					</dl>\
				</div>\
            </div>\
        </div>\
        <div class="span1 right-column">\
                <a href="javascript:void(0)" title="Add to plan" class="myToolTip addToPlan btn action" rel="tooltip" title="Add To Plan">\
                    <img src="/img/icons/arrow_right2.png" alt="Add" width="18px" />\
                </a>\
                <a href="javascript:void(0)" title="Set Location" class="myToolTip setLocation btn action" rel="tooltip">\
                            <img alt="Set Location" width="18px" />\
                        </a><a href="javascript:void(0)" class="myToolTip hide confirmSetLocation btn action" rel="tooltip"  title="Confirm Set Location">\
                            <img src="/img/icons2/checkmark2.png"width="18">\
                        </a><a href="javascript:void(0)" class="myToolTip hide cancelSetLocation btn action" rel="tooltip"  title="Cancel Set Location">\
                            <span class="icomoon-icon-cancel"></span>\
                        </a>\
            </div>\
    </div>\
</li>\
');
        ticket.find('.orderNumber').html(order.OrderId);
        ticket.find('.properties').html('<span class="label label-success">' + order.DeliveryOption + '</span>                                            <span class="label label-info">' + order.OrderPaymentType + '</span>');
        ticket.find('.amount-to-be-collected').html(order.AmountToBeCollected);
        if (order.DueDate.Date == "") {
            ticket.find('.dueDate').html('<span class="label label-important">Not set yet</span>&nbsp;');
        } else {
            ticket.find('.dueDate').html('<span class="label label-important">' + order.DueDate.Date +'</span>&nbsp;');
        }
        if (order.Fee == null) {
            ticket.find('.fee').html('<span class="label label-important">Not set yet</span>');
        } else {
            ticket.find('.fee').html(order.Fee);
        }
        if (order.Note == null) {
            ticket.find('.note').html('None');
        } else {
            ticket.find('.note').html(order.Note);
        }

        ticket.find('.full-address').html(order.ReceiverAddress);
        ticket.find('.right-column a.addToPlan').attr('onclick', 'addToPlan(' + order.OrderId + ')');
        if (order.Latitude == null) {
            ticket.find('.right-column a.setLocation img').attr('src', '/img/icons2/blue-dot.png');
            ticket.find('.right-column a.setLocation').attr('onclick', 'setLocation(' + order.OrderId + ',\'' + order.AddressFromWard + '\')');
        } else {
            ticket.find('.right-column a.setLocation img').attr('src', '/img/icons2/red-dot.png');
            ticket.find('.right-column a.setLocation').attr('onclick', 'setLocation(' + order.OrderId + ')');
        }
        ticket.find('.right-column a.setLocation').attr('id', 'setLocation-' + order.OrderId);

        ticket.find('.right-column a.confirmSetLocation').attr('id', 'confirmSetLocation-' + order.OrderId);
        ticket.find('.right-column a.confirmSetLocation').attr('onclick', 'confirmSetLocation(' + order.OrderId + ')');
        ticket.find('.right-column a.cancelSetLocation').attr('id', 'cancelSetLocation-' + order.OrderId);
        ticket.find('.right-column a.cancelSetLocation').attr('onclick', 'cancelSetLocation(' + order.OrderId + ')');

        if ($('#usingMap').val() == 'false') {
            ticket.find('.right-column a.setLocation').addClass('hide');
        }

        html += '<li id="order-' + order.OrderId + '" data-order-id="' + order.OrderId + '">' + ticket.html() + '</li>';
    });
    return html;
};

var setupOrderTicket = function () {
    $(".order-ticket-info").click(function () {
        cancelOthers();
        $(this).closest("ul").children("li").removeClass("active");
        $(this).closest("ul").find(".order-ticket-info").css('cursor', 'pointer');
        $(this).closest("li").addClass("active");
        $(this).css('cursor', 'initial');
        markers = goMap.getMarkers('markers');
        for (index in markers) {
            markers[index].setAnimation(null);
        }

        $(this).closest("li").addClass("active");
        $(this).css('cursor', 'initial');
        
        orderId = $(this).closest("li").data('orderId');
        if (!$(this).parent().hasClass('no-position')) {
            marker = goMap.getMarker(orderId);
            //marker.setAnimation(google.maps.Animation.BOUNCE);
            marker.setIcon('/img/icons2/yellow-dot.png');
            goMap.map.panTo(marker.position);
            google.maps.event.trigger(marker, 'click'); 
        }
    });
};