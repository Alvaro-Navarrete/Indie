<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    </head>
    <body>

        <h2>Create account</h2>
        <p>Already have an account? <a href="/login">Login</a></p>
        <form:form method="post" action="/registration" modelAttribute="user">
            <p>
                <form:label path="name">Nombre:</form:label>
                <form:errors class="text-danger" path="name" />
                <form:input placeholder="" class="field" path="name" />
            </p>
            <p>
                <form:label class="espacios" path="email">Email:</form:label>
                <form:errors class="text-danger" path="email" />
                <form:input placeholder="" class="field" type="email" path="email" />
            </p>
            <p>
                <form:label class="espacios" path="password">Contraseña:</form:label>
                <form:errors class="text-danger" path="password" />
                <form:password placeholder="" class="field" path="password" />
            </p>
            <p>
                <form:label class="espacios" path="passwordConfirmation">Confirmar Contraseña:</form:label>
                <form:password placeholder="" class="field" path="passwordConfirmation" />
                <form:errors class="text-danger" path="passwordConfirmation" />
            </p>
            <input type="submit" value="Create account" />
        </form:form>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
    </body>
</html>