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
    <title>Arcade</title>
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
    <h1>Hola panita</h1>
</body>
</html>