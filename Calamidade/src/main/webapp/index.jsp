<%@include file="header.jsp"%>

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
            <input type="text" name="nome" placeholder="Nome completo" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="datetime-local" name="datetime">
            <input type="text" name="titulo" placeholder="Título" required>
            <input type="text" name="resumo" placeholder="Resumo" required>
            <input type="file" name="imagem" accept="image/*">
            <input type="text" name="latitude" id="latitude" pattern="^-?\d{1,3}(.\d+)?$" placeholder="Latitude" required>
            <input type="text" name="longitude" id="longitude" pattern="^-?\d{1,3}(.\d+)?$" placeholder="Longitude" required>
            <input type="hidden" name="status" value="false">
            <input type="hidden" name="aberto" value="true">
            <button type="submit" id="button-form">Enviar</button>
        </form>
    </div>
</div>

<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
<script src="index.js"></script>
<script
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&libraries=visualization&v=weekly"
    defer
></script>       

</body>
</html>
