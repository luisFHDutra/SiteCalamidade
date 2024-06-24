let map, heatmap;
let marker = null;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13,
    center: { lat: -29.444867642037554, lng: -51.957193396013274 },
    mapTypeId: "satellite",
  });
  heatmap = new google.maps.visualization.HeatmapLayer({
    data: getPoints(),
    map: map,
  });

  // Adiciona o evento de clique no mapa para adicionar um marcador.
  map.addListener("click", function(event) {
    addMarker(event.latLng);
    console.log('Latitude: ' + event.latLng.lat() + ', Longitude: ' + event.latLng.lng());
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
  // Remove o marcador anterior se existir.
  if (marker) {
    marker.setMap(null);
  }

  // Crie um novo marcador e defina sua posição.
  marker = new google.maps.Marker({
    position: location,
    map: map,
  });

  // Atualize o campo 'local' do formulário com as coordenadas do marcador.
  document.getElementById("local").value = `Latitude: ${location.lat()}, Longitude: ${location.lng()}`;
}

// Heatmap data: 500 Points
function getPoints() {
  return [
    new google.maps.LatLng(-29.44614762262356, -51.959135315340056),
    new google.maps.LatLng(-29.445717849920303, -51.960143825929656),
    new google.maps.LatLng(-29.445923393614137, -51.959693214815154),
    new google.maps.LatLng(-29.445119902262324, -51.95977904550363),
  ];
}

window.initMap = initMap;