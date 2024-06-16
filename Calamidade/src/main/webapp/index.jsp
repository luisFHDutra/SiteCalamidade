<%@include file="header.jsp"%>
    <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
    <script type="module" src="index.js"></script>

    <div id="container">
        <div id="floating-panel">
            <button id="toggle-heatmap">Toggle Heatmap</button>
            <button id="change-gradient">Change gradient</button>
            <button id="change-radius">Change radius</button>
            <button id="change-opacity">Change opacity</button>
        </div>
        <div id="map"></div>

        <div id="forms-ocorrencia">
            <form id="insertForm" action="processaocorrencia" method="post">
                <input type="text" name="nome" placeholder="Nome completo">
                <input type="email" name="email" placeholder="Email">
                <input type="datetime-local" name="datetime">
                <input type="text" name="titulo" placeholder="Título">
                <input type="text" name="resumo" placeholder="Resumo">
                <input type="radio" name="status" value="Aprovado">
                <input type="text" name="local" placeholder="Local">
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
