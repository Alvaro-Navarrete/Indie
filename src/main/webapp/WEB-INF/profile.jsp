<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Profile</title>
        <link rel="stylesheet" href="/css/profile.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>
        <div class="window" id="modal">
            <form method="post" action="/account/profile/photo" modelAttribute="user" enctype="multipart/form-data">
                <input type="file" name="photoProfile" id="inputGroupFile02"/>
                <button for="inputGroupFile02">add image</button>
            </form>
            <a href="javascript:close()">Cerrar</a>
        </div>
        <button type="button" class="img" id="open-modal" onclick="openWindow()"><img class="img" src="${user.imgRoute}" alt="${users.imgRoute}"></button>
        



        
        <!-- <script>
            const openModal = document.querySelector("#open-modal");
            const modal = document.querySelector("#modal");
            const closeModal = document.querySelector("#close-modal")

            openModal.addEventListener("click",() =>{
                modal.showModal();
            })
            closeModal.addEventListener("click",() =>{
                modal.close();
            })
        </script> -->

        <script>
            function openWindow(){
                document.getElementById("modal").style.display="block";
            }
            function close(){
                document.getElementById("modal").style.display="none";
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>