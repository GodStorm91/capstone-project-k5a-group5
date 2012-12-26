var createRequestTickets = function (requests) {
    var html = '';
    $.each(requests, function (index, request) {
        var ticket = $('<li>\
        <div class="ticket-container span12 ticket request-ticket">\
            <div class="request-ticket-info span11 left-column">\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/sharp.png" alt="Request Number" class="myToolTip"  rel="tooltip" title="Request Number" width="15px" /></dt>\
                        <dd class="requestId">\
                            </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                                <img src="/img/icons/user.png" alt="Customer" width="15px" class="myToolTip"  rel="tooltip" title="Customer"/>\
                        </dt>\
                        <dd class="customer">\
                            </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt>\
                            <img src="/img/icons/calendar2.png" alt="Requested Date" class="myToolTip"  rel="tooltip" title="Request Date" width="15px" /></dt>\
                        <dd class="requestedDate">\
                        </dd>\
                    </dl>\
                </div>\
                <div class="column">\
                    <dl class="dl-horizontal">\
                        <dt><span style="font-size: 15px; color: #969696" class="myToolTip" rel="tooltip" title="Collection Address">@</span> </dt>\
                        <dd class="collectionAddress">\
                            </dd>\
                    </dl>\
                </div>\
            </div>\
            <div class="span1 right-column">\
                <a href="javascript:void(0)" class="addToPlan btn action myToolTip" rel="tooltip" title="Add to plan">\
                    <img src="/img/icons/arrow_right2.png" alt="Add" width="18px" />\
                </a>\
                <a href="javascript:void(0)" title="Set Location" class="myToolTip setLocation btn action" rel="tooltip">\
                    <img alt="Set Location" width="18px" />\
                </a>\
                <a href="javascript:void(0)" class="myToolTip hide confirmSetLocation btn action" rel="tooltip"  title="Confirm Set Location">\
                    <img src="/img/icons2/checkmark2.png"width="18">\
                </a>\
                <a href="javascript:void(0)" class="myToolTip hide cancelSetLocation btn action" rel="tooltip"  title="Cancel Set Location">\
                    <span class="icomoon-icon-cancel"></span>\
                </a>\
            </div>\
        </div>\
    </li>');
        ticket.find('dd.customer').html(request.Customer);
        ticket.find('dd.requestId').html(request.RequestId);
        ticket.find('dd.requestedDate').html(request.RequestedDate);
        ticket.find('dd.collectionAddress').html(request.CollectionAddress);
        ticket.find('a.addToPlan').attr('onclick', 'addToPlan(' + request.RequestId + ')');
        
        if (request.Latitude == null) {
            ticket.find('a.setLocation img').attr('src', '/img/icons2/blue-dot.png');
            ticket.find('a.setLocation').attr('onclick', 'setLocation(' + request.RequestId + ',\'' + request.AddressFromWard + '\')');
        } else {
            ticket.find('a.setLocation img').attr('src', '/img/icons2/red-dot.png');
            ticket.find('a.setLocation').attr('onclick', 'setLocation(' + request.RequestId + ')');
        }

        ticket.find('a.confirmSetLocation').attr('onclick', 'confirmSetLocation(' + request.RequestId + ')');
        ticket.find('a.cancelSetLocation').attr('onclick', 'cancelSetLocation(' + request.RequestId + ')');

        ticket.find('a.setLocation').attr('id', 'setLocation-' + request.RequestId);
        ticket.find('a.confirmSetLocation').attr('id', 'confirmSetLocation-' + request.RequestId);
        ticket.find('a.confirmSetLocation').attr('onclick', 'confirmSetLocation(' + request.RequestId + ')');
        ticket.find('a.cancelSetLocation').attr('id', 'cancelSetLocation-' + request.RequestId);
        ticket.find('a.cancelSetLocation').attr('onclick', 'cancelSetLocation(' + request.RequestId + ')');

        if ($('#usingMap').val() == 'false') {
            ticket.find('a.setLocation').addClass('hide');
        }

        html += '<li  id="request-' + request.RequestId + '" data-request-id="' + request.RequestId + '">' + ticket.html() + '</li>';
    });
    return html;
};

var setupRequestTicket = function () {
    $(".request-ticket-info").click(function () {
        cancelOthers();
        $(this).closest("ul").children("li").removeClass("active");
        $(this).closest("ul").find(".request-ticket-info").css('cursor', 'pointer');
        $(this).closest("li").addClass("active");
        $(this).css('cursor', 'initial');
        markers = goMap.getMarkers('markers');
        for (index in markers) {
            markers[index].setAnimation(null);
        }

        $(this).closest("li").addClass("active");
        $(this).css('cursor', 'initial');

        var requestId = $(this).closest("li").data('requestId');
        if (!$(this).parent().hasClass('no-position')) {
            marker = goMap.getMarker(requestId);
            marker.setIcon('/img/icons2/yellow-dot.png');
            goMap.map.panTo(marker.position);
            google.maps.event.trigger(marker, 'click');
        }
    });
};