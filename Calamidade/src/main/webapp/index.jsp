<%@include file="header.jsp"%>

<div id="container">
    <div id="floating-panel">
        <button id="toggle-heatmap">Mapa de calor</button>
        <button id="change-gradient">Mudar gradiente</button>
        <button id="change-radius">Mudar raio</button>
        <button id="change-opacity">Mudar opacidade</button>

        <label for="tipoOcorrencia">Tipo de Ocorrência:</label>
        <select id="tipoOcorrencia">
            <option value="todos">Todos</option>
            <option value="1">Inundações</option>
            <option value="2">Deslizamentos</option>
            <option value="3">Secas</option>
            <option value="4">Tempestades</option>
            <option value="5">Queimadas</option>
            <option value="6">Erupção Vulcânica</option>
        </select>

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
            
            <label for="tipo">Tipo de Ocorrência:</label>
            <select name="tipo" id="tipo" required>
                <option value="1">Inundações</option>
                <option value="2">Deslizamentos</option>
                <option value="3">Secas</option>
                <option value="4">Tempestades</option>
                <option value="5">Queimadas</option>
                <option value="6">Erupção Vulcânica</option>
            </select>
            
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
