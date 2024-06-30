<%@include file="header.jsp"%>

<div id="container">
    <div id="floating-panel">

        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNavDropdown">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" id="toggle-heatmap" href="#">Mapa de calor</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="change-gradient" href="#">Mudar gradiente</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="change-radius" href="#">Mudar raio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="change-opacity" href="#">Mudar opacidade</a>
                        </li>
                        <select class="nav-link dropdown-toggle" id="tipoOcorrencia">
                            <option class="dropdown-item" value="todos">Todos</option>
                            <option class="dropdown-item" value="1">Inundações</option>
                            <option class="dropdown-item" value="2">Deslizamentos</option>
                            <option class="dropdown-item" value="3">Secas</option>
                            <option class="dropdown-item" value="4">Tempestades</option>
                            <option class="dropdown-item" value="5">Queimadas</option>
                            <option class="dropdown-item" value="6">Erupção Vulcânica</option>
                        </select>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
    <div id="map"></div>

    <div id="forms-ocorrencia">
        <form id="insertForm" action="processaocorrencia" method="post" enctype="multipart/form-data" class="row g-3">

            <div class="col-12">
                <label for="inputNome" class="form-label">Nome Completo</label>
                <input type="text" name="nome" required class="form-control">
            </div>
            <div class="col-12">
                <label for="inputEmail4" class="form-label">Email</label>
                <input name="email" type="email" class="form-control" id="inputEmail4" required>
            </div>
            <div class="col-12">
                <label for="inputTitulo" class="form-label">Título</label>
                <input type="text" name="titulo" required class="form-control">
            </div>
            <div class="col-12">
                <label for="inputResumo" class="form-label">Resumo</label>
                <input type="text" name="nome" required class="form-control">
            </div>
            <div class="col-12">
                <label for="inputLatitude" class="form-label">Latitude</label>
                <input type="text" name="latitude" id="latitude" pattern="^-?\d{1,3}(.\d+)?$" required class="form-control">
            </div>
            <div class="col-12">
                <label for="inputLongitude" class="form-label">Longitude</label>
                <input type="text" name="longitude" id="longitude" pattern="^-?\d{1,3}(.\d+)?$" required class="form-control">
            </div>
            
            <label for="inputDatetime">Data e hora</label>
            <div class="pan2 col-md-2 form-control" id="span-datepicker">
                <input type="datetime-local" name="datetime" id="datepicker" required>
            </div>

            <div class="col-12">
                <label for="tipo" class="form-label">Tipo de ocorrência</label>
                <select name="tipo" id="tipo" class="form-select" required>
                    <option value="1">Inundações</option>
                    <option value="2">Deslizamentos</option>
                    <option value="3">Secas</option>
                    <option value="4">Tempestades</option>
                    <option value="5">Queimadas</option>
                    <option value="6">Erupção Vulcânica</option>
                </select>
            </div>
            <div class="input-group mb-3">
                <input type="file" name="imagem" class="form-control" id="inputGroupFile02" accept="image/*">
            </div>
            <input type="hidden" name="status" value="false">
            <input type="hidden" name="aberto" value="true">
            <div class="col-12">
                <button type="submit" class="btn btn-primary" onclick="alert('Ocorrência cadastrada com sucesso');">Enviar</button>
            </div>
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
