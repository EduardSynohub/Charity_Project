<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Document</title>
</head>
<body>
<%@include file="header.jsp"%>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form action="/register" method="post" modelAttribute="user">
        <div>
        <div class="form-group">
            <form:input path="username" type="email" name="email" placeholder="Email" />
            <form:errors path="username"/>
        </div>
        <div class="form-group">
            <form:input path="password" type="password" name="password" placeholder="Hasło" />
            <form:errors path="password"/>
        </div>
        <div class="form-group">
            <form:input path="password2" type="password" name="password2" placeholder="Powtórz hasło" />
            <form:errors path="password2"/>
        </div>
        </div>
        <div>
            <div class="form-group">
                <form:input path="firstname" name="userName" placeholder="Imię"/>
                <form:errors path="firstname"/>
            </div>
            <div class="form-group">
                <form:input path="surname" name="userSurname" placeholder="Nazwisko"/>
                <form:errors path="surname"/>
            </div>
        </div>

        <div class="form-group form-group--buttons">
            <a href="/login" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<%@include file="footer.jsp"%>
</body>
</html>
