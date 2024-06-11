<%@include file="header.jsp"%>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script type="module" src="index.js"></script>

    <div id="floating-panel">
        <button id="toggle-heatmap">Toggle Heatmap</button>
        <button id="change-gradient">Change gradient</button>
        <button id="change-radius">Change radius</button>
        <button id="change-opacity">Change opacity</button>
    </div>
    <div id="map"></div>

    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&libraries=visualization&v=weekly"
        defer
    ></script>      

    </body>
</html>
