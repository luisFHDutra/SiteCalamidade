<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Site Calamidade</title>
        <meta name="viewport" content="width=device-width,minimum-scale=1,initial-scale=1" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,600,700&display=swap" rel="stylesheet" />
        <link rel="stylesheet" type="text/css" href="./assets/css/style.css" />
        <link rel="icon" type="image/x-icon" href="assets/images/pino-de-localizacao.png">
        
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
                            <li><a href="logout.jsp">Deslogar</a></li>
                                <% if(!request.getRequestURI().endsWith("usuarios.jsp")) { %>
                            <li><a href="ocorrencias.jsp">Ocorrências</a></li>
                            <li><a href="usuarios.jsp">Usuários</a></li>
                                <%
                                        }
                                    }
                                %>
                        </ul>
                    </nav>
                </div>
            </div>

            <script>
                let isMenuLoginVisible = false;

                document.querySelector(".dropbtn").addEventListener("click", function (event) {
                    event.preventDefault();

                    isMenuLoginVisible = !isMenuLoginVisible;
                    document.getElementById("menuLogin").style.display = isMenuLoginVisible ? "block" : "none";
                });
            </script>
        </header>
        