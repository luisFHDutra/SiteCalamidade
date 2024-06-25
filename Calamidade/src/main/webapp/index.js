let map, heatmap;
let marker = null;

function fetchPoints() {
    return fetch('points.jsp')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json();
        })
        .then(data => data.map(point => new google.maps.LatLng(point.lat, point.lng)))
        .catch(error => console.error('Error fetching points:', error));
}

function initMap() {
    map = new google.maps.Map(document.getElementById("map"), {
        zoom: 13,
        center: { lat: -29.444867642037554, lng: -51.957193396013274 },
        mapTypeId: "satellite",
    });

    fetchPoints()
        .then(points => {
            heatmap = new google.maps.visualization.HeatmapLayer({
                data: points,
                map: map,
            });
        })
        .catch(error => console.error('Error fetching points:', error));

    map.addListener("click", function (event) {
        addMarker(event.latLng);
    });

    document.getElementById("toggle-heatmap").addEventListener("click", toggleHeatmap);
    document.getElementById("change-gradient").addEventListener("click", changeGradient);
    document.getElementById("change-opacity").addEventListener("click", changeOpacity);
    document.getElementById("change-radius").addEventListener("click", changeRadius);
}

function toggleHeatmap() {
    heatmap.setMap(heatmap.getMap() ? null : map);
}

function changeGradient() {
    const gradient = [
        "rgba(0, 255, 255, 0)",
        "rgba(0, 255, 255, 1)",
        "rgba(0, 191, 255, 1)",
        "rgba(0, 127, 255, 1)",
        "rgba(0, 63, 255, 1)",
        "rgba(0, 0, 255, 1)",
        "rgba(0, 0, 223, 1)",
        "rgba(0, 0, 191, 1)",
        "rgba(0, 0, 159, 1)",
        "rgba(0, 0, 127, 1)",
        "rgba(63, 0, 91, 1)",
        "rgba(127, 0, 63, 1)",
        "rgba(191, 0, 31, 1)",
        "rgba(255, 0, 0, 1)",
    ];

    heatmap.set("gradient", heatmap.get("gradient") ? null : gradient);
}

function changeRadius() {
    heatmap.set("radius", heatmap.get("radius") ? null : 20);
}

function changeOpacity() {
    heatmap.set("opacity", heatmap.get("opacity") ? null : 0.2);
}

function addMarker(location) {
    if (marker) {
        marker.setMap(null);
    }

    marker = new google.maps.Marker({
        position: location,
        map: map,
    });

    document.getElementById("latitude").value = location.lat();
    document.getElementById("longitude").value = location.lng();
}

window.initMap = initMap;
