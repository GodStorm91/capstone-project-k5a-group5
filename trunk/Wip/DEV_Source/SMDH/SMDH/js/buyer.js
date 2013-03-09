
$('#txtAddress').blur(function () {
    alert("In blur");
    getLatLong($('address').val());
});

$('#txtAddress').click(function () {
    alert("In blur");
    getLatLong($('address').val());
});