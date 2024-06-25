<%@include file="header.jsp"%>


<%
    double lat = -29.444867642037554;
%>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script>
    let map, heatmap;
    let marker = null;
    
    function initMap() {
        map = new google.maps.Map(document.getElementById("map"), {
            zoom: 13,
            center: {lat: -29.444867642037554, lng: -51.957193396013274},
            mapTypeId: "satellite",
        });
        heatmap = new google.maps.visualization.HeatmapLayer({
            data: getPoints(),
            map: map,
        });

        // Adiciona o evento de clique no mapa para adicionar um marcador.
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
        // Remove o marcador anterior se existir.
        if (marker) {
            marker.setMap(null);
        }

        // Crie um novo marcador e defina sua posição.
        marker = new google.maps.Marker({
            position: location,
            map: map,
        });
        console.log('Latitude: ' + location.lat() + ', Longitude: ' + location.lat() + ' Setado: ' + <%= lat %>);

        document.getElementById("latitude").value = location.lat();
        document.getElementById("longitude").value = location.lng();
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
</script>

<div id="container">
    <div id="floating-panel">
        <button id="toggle-heatmap">Toggle Heatmap</button>
        <button id="change-gradient">Change gradient</button>
        <button id="change-radius">Change radius</button>
        <button id="change-opacity">Change opacity</button>
    </div>
    <div id="map"></div>

    <div id="forms-ocorrencia">
        <form id="insertForm" action="processaocorrencia" method="post" enctype="multipart/form-data">
            <input type="text" name="nome" placeholder="Nome completo">
            <input type="email" name="email" placeholder="Email">
            <input type="datetime-local" name="datetime">
            <input type="text" name="titulo" placeholder="Título">
            <input type="text" name="resumo" placeholder="Resumo">
            <input type="file" name="imagem" accept="image/*">
            <input type="number" name="latitude" id="latitude" placeholder="Latitude">
            <input type="number" name="longitude" id="longitude" placeholder="Longitude">
            <button type="submit" id="button-form">Enviar</button>
        </form>
    </div>
</div>

<script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&libraries=visualization&v=weekly"
    defer
></script>      

</body>
</html>
