var createRequestTickets = function (requests) {
    var html = '';
    $.each(requests, function (index, request) {
        var ticket = $('<li>\
                        <div class="request-ticket-info">\
                            <span class="icon-book"></span><span class="label label-info requestId"></span><span class="icon-user"></span>\
                            <span class="label label-info customer"></span><span class="icon-calendar"></span><span class="label label-info requestedDate">\
                            </span>\
                            <div>\
                                <span class="icon-globe"></span><small class="collectionAddress"></small>\
                            </div>\
                        </div>\
                        <div class="right-column">\
                            <span><a href="javascript:void(0)" class="addToPlan label label-success">Add</a></span>\
                            <input type="checkbox" name="plan" />\
                            <span><a href="javascript:void(0)" class="myToolTip hide confirmSetLocation btn action"\
                                rel="tooltip" title="Confirm Set Location">\
                                <img src="/img/icons2/checkmark2.png" width="18">\ </a></span><span><a href="javascript:void(0)"\
                                    class="removeToPlan hide removeFromPlan btn action" rel="tooltip" title="Cancel Set Location">\
                                    <span class="icomoon-icon-cancel"></span>\ </a></span>\
                        </div>\
                    </li>');

        ticket.find('span.customer').html(request.Customer);
        ticket.find('span.requestId').html(request.RequestId);
        ticket.find('span.requestedDate').html(request.RequestedDate);
        ticket.find('small.collectionAddress').html(request.CollectionAddress);
        ticket.find('a.addToPlan').attr('onclick', 'addToPlan(' + request.RequestId + ')');
        ticket.find('a.removeToPlan').attr('onclick', 'removeFromPlan(' + request.RequestId + ')');

        //        if (request.Latitude == null) {
        //            ticket.find('a.setLocation img').attr('src', '/img/icons2/blue-dot.png');
        //            ticket.find('a.setLocation').attr('onclick', 'setLocation(' + request.RequestId + ',\'' + request.AddressFromWard + '\')');
        //        } else {
        //            ticket.find('a.setLocation img').attr('src', '/img/icons2/red-dot.png');
        //            ticket.find('a.setLocation').attr('onclick', 'setLocation(' + request.RequestId + ')');
        //        }

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