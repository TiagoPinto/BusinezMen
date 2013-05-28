var map;
var geocoder;

function InitializeMap() {

    var latlng = new google.maps.LatLng(41.561390, -8.397591);
    var myOptions =
    {
        zoom: 15,
        center: latlng,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        //disableDefaultUI: true
    };
    map = new google.maps.Map(document.getElementById("map"), myOptions);
}


function findLocation(morada, longitude, latitude) {
    geocoder = new google.maps.Geocoder();
    InitializeMap();
    var txtAddress = document.getElementById(morada);
    var address = txtAddress.value;
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
                map: map,
                position: results[0].geometry.location
            });
            GetCoordinates(morada, longitude, latitude);
        }
        else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

function getCoordinates(morada, longitude, latitude) {
    geocoder = new google.maps.Geocoder();

    var txtAddress = document.getElementById(morada);
    var address = txtAddress.value;
    geocoder.geocode({ 'address': address }, function (results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            var latitude = results[0].geometry.location.lat();
            var longitude = results[0].geometry.location.lng();
            var hiddenLon = longitude;
            var hiddenLat = latitude;
            document.getElementById(hiddenLat).value = latitude;
            document.getElementById(hiddenLon).value = longitude;
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });

}
function showAddress(morada) {
    geocoder = new google.maps.Geocoder();
    initialize()
    var txtAddress = document.getElementById(morada);
    var address = txtAddress.value;

    geocoder.getLatLng(
            address,
            function (point) {
                if (!point) {
                    alert(address + " not found");
                }
                else {
                    map.setCenter(point, 15);
                    var marker = new GMarker(point);
                    map.addOverlay(marker);
                    marker.openInfoWindow(address);
                }
            }
        );
}
