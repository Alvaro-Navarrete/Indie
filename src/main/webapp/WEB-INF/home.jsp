<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <!-- boostrap -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>Proyecto</title>
    </head>
    <body>
        <header class="p-3 text-bg-dark">
            <div class="container">
                <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
                    <!-- logo proyecto -->

                    <!-- logo proyecto -->

                    
                    <form class="w-50 me-3 col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
                        <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
                    </form>
                    <div class="text-end">
                        <p><a class="me-lg-3" href=""><i class="fa-solid fa-heart"></i></a></p>
                    </div>
                    <div class="text-end">
                        <p><a class="me-lg-3" href=""><i class="fa-solid fa-cart-shopping"></i></a></p>
                    </div>
                    <c:if test="${userId == null}">
                        <div class="text-end">
                            <p><a href="/login"><i class="fa-solid fa-user"></i> Log in</a> | <a href="/registration">Register</a></p>
                        </div>
                    </c:if>
                    <c:if test="${userId != null}">
                        <div class="nav-item">
                            <div class="nav-item dropdown usuario">
                                <a class="nav-link dropdown-toggle" id="perfil" href="#"
                                    data-bs-toggle="dropdown" aria-expanded="false">
                                    <img src="${user.imgRoute}" alt="mdo" width="43" height="43"
                                        class="rounded-circle">
                                    <c:out value="${user.name}" />
                                </a>
                                <!-- desplegable -->
                                <ul class="dropdown-menu sombra">
                                    <li><a class="dropdown-item" href="/account/profile">Perfil</a>
                                    </li>
                                    <li><a class="dropdown-item" href="/logout">Cerrar Sesión</a>
                                    </li>
                                </ul>
                                <!-- desplegable -->
                            </div>
                        </div>
                    </c:if>
                </div>
            </div>
        </header>
        <!-- menu -->
        <div>
            <ul class="list-unstyled">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                        Games
                    </a>
                    <table class="dropdown-menu">
                        <thead>
                            <tr>
                                <th>Genere</th>
                                <th>Niche Genres</th>
                                <th>Game Modes</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <ul class="list-unstyled">
                                        <li><a class="text-decoration-none" href="#">Singleplayer</a></li>
                                        <li><a class="text-decoration-none" href="#">Multiplayer</a></li>
                                        <li><a class="text-decoration-none" href="#">Action</a></li>
                                        <li><a class="text-decoration-none" href="#">First Person</a></li>
                                        <li><a class="text-decoration-none" href="#">Third Person</a></li>
                                        <li><a class="text-decoration-none" href="#">Simulation</a></li>
                                        <li><a class="text-decoration-none" href="#">Sport</a></li>
                                        <li><a class="text-decoration-none" href="#">Adventure</a></li>
                                        <li><a class="text-decoration-none" href="#">Strategy</a></li>
                                        <li><a class="text-decoration-none" href="#">Racing</a></li>
                                        <li><a class="text-decoration-none" href="#">FPS</a></li>
                                    </ul>
                                </td>
                                <td>
                                    <ul class="list-unstyled">
                                        <li><a class="text-decoration-none" href="#">Indie</a></li>
                                        <li><a class="text-decoration-none" href="#">RPG</a></li>
                                        <li><a class="text-decoration-none" href="#">Horror</a></li>
                                        <li><a class="text-decoration-none" href="#">Hack Slash</a></li>
                                        <li><a class="text-decoration-none" href="#">Puzzle</a></li>
                                        <li><a class="text-decoration-none" href="#">MMO</a></li>
                                        <li><a class="text-decoration-none" href="#">Arcade</a></li>
                                        <li><a class="text-decoration-none" href="#">Figthing</a></li>
                                        <li><a class="text-decoration-none" href="#">Platform</a></li>
                                        <li><a class="text-decoration-none" href="#">Virtual Reality</a></li>
                                        <li><a class="text-decoration-none" href="#">Point-Click</a></li>
                                    </ul>
                                </td>
                                <td>
                                    <ul class="list-unstyled">
                                        <li><a class="text-decoration-none" href="#">Singleplayer</a></li>
                                        <li><a class="text-decoration-none" href="#">Multiplayer</a></li>
                                        <li><a class="text-decoration-none" href="#">Multiplayer en linea</a></li>
                                        <li><a class="text-decoration-none" href="#">Co-Op</a></li>
                                        <li><a class="text-decoration-none" href="#">Competitivos en linea</a></li>
                                        <li><a class="text-decoration-none" href="#">Local en Grupo</a></li>
                                    </ul>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </li>
            </ul>
        </div>
        <!-- menu -->

    </body>
</html>