<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Site Calamidade</title>
        <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1" />
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700&display=swap" rel="stylesheet" />
        <link rel="icon" type="image/x-icon" href="assets/images/pino-de-localizacao.png">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </head>
    <body>
        <header>
            <div class="header">
                <div class="logo">
                    <div class="logoimg">
                        <img src="./assets/images/pino-de-localizacao.png" />
                    </div>
                </div>
                <div class="menu">
                    <nav>
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                                <% if(request.getRequestURI().endsWith("index.jsp") || request.getRequestURI().endsWith("/")) { %>
                                <%
                                    }
                                    if(session.getAttribute("LOGADO")==null){
                                %>
                            <li class="dropdown"> 
                                <a class="dropbtn">Login</a>
                                <div id="menuLogin" class="dropdown-content">
                                    <form action="validalogin.jsp">
                                        <br/>Usuário: <input class="margin-bottom" type="text" name="usuario" placeholder="usuário">
                                        <br/>Senha: <input class="margin-bottom" type="password" name="senha" placeholder="senha">
                                        <br/><input id="button-login" type="submit" value="Login">
                                    </form>
                                </div>
                            </li>
                            <%
                                } else {
                            %>
                            <li><a href="logout.jsp">Sair</a></li>
                                <% if(request.getRequestURI().endsWith("usuarios.jsp")) { %>
                            <li><a href="ocorrencias.jsp">Ocorrências</a></li>
                                <%} else if(request.getRequestURI().endsWith("ocorrencias.jsp")) { %>
                            <li><a href="usuarios.jsp">Usuários</a></li>
                                <% } else{ %>
                            <li><a href="ocorrencias.jsp">Ocorrências</a></li>
                            <li><a href="usuarios.jsp">Usuários</a></li>
                                <% }} %>
                        </ul>
                    </nav>
                </div>
            </div>

            <%
                if(session.getAttribute("LOGADO")==null){
            %>
            <script>
                let isMenuLoginVisible = false;

                document.querySelector(".dropbtn").addEventListener("click", function (event) {
                    event.preventDefault();

                    isMenuLoginVisible = !isMenuLoginVisible;
                    document.getElementById("menuLogin").style.display = isMenuLoginVisible ? "block" : "none";
                });
            </script>
            <%
                }
            %>
        </header>
