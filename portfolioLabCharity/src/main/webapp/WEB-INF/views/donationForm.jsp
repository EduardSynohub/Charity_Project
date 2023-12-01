<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="pl">
<head>
    <title>Donation</title>
</head>
<body>
<header class="header--form-page">
        <%@include file="header-user.jsp"%>
</header>

<section class="form--steps">
    <div class="form--steps-instructions">
        <div class="form--steps-container">
            <h3>Ważne!</h3>
            <p data-step="1" class="active">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="2">
                Uzupełnij szczegóły dotyczące Twoich rzeczy. Dzięki temu będziemy
                wiedzieć komu najlepiej je przekazać.
            </p>
            <p data-step="3">
                Wybierz jedną, do
                której trafi Twoja przesyłka.
            </p>
            <p data-step="4">Podaj adres oraz termin odbioru rzeczy.</p>
        </div>
    </div>


    <div class="form--steps-container">
        <div class="form--steps-counter">Krok <span>1</span>/4</div>

        <form:form action="/addDonation" method="post" modelAttribute="donation">
            <!-- STEP 1: class .active is switching steps -->
            <div data-step="1" class="active">
                <h3>Zaznacz co chcesz oddać:</h3>
                    <label class="myStyle2">
                        <c:forEach items="${categories_list}" var="category">

<%--                <div class="form-group form-group--checkbox">--%>
<%--                    <form:label path="categories">--%>
                            <form:checkbox path="categories" value="${category}" label="${category.name}" cssClass="myStyle2"/>
                            <br>
<%--                            <input--%>
<%--                                    type="checkbox"--%>
<%--                                    name="categories"--%>
<%--                                    value="${category.id}"--%>
<%--                            />--%>
<%--                        <span class="checkbox"></span>--%>
<%--                        <span class="description"--%>
<%--                        >${category.name}</span--%>
<%--                        >--%>
<%--                    </form:label>--%>

<%--                </div>--%>
                        </c:forEach>
                    </label>
                <br>
                <form:errors path="categories" cssClass="myStyle"/>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 2 -->
            <div data-step="2">
                <h3>Podaj liczbę 60l worków, w które spakowałeś/aś rzeczy:</h3>

                <div class="form-group form-group--inline">
                    <label>
                        Liczba 60l worków:
                        <form:input path="quantity" type="number" name="bags" step="1" id="bags"/>
                    </label>
                    <form:errors path="quantity" cssClass="myStyle"/>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>



            <!-- STEP 4 -->
            <div data-step="3">
                <h3>Wybierz organizacje, której chcesz pomóc:</h3>

<%--                <c:forEach items="${institutions_list}" var="institution">--%>
                <div class="form-group form-group--checkbox">
                    <label>
                        Fundacja: <form:select class="title description" path="institution.id" items="${institutions_list}" itemValue="id" itemLabel="name" id="institution"/>
<%--                        <input type="radio" name="organization" value="old" />--%>
<%--                        <span class="checkbox radio"></span>--%>
<%--                        <span class="description">--%>
<%--                  <div class="title">Fundacja “${institution.name}"</div>--%>
<%--                  <div class="subtitle">--%>
<%--                    Cel i misja: ${institution.description}--%>
<%--                  </div>--%>
                </span>
                    </label>
                </div>
<%--                </c:forEach>--%>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step">Dalej</button>
                </div>
            </div>

            <!-- STEP 5 -->
            <div data-step="4">
                <h3>Podaj adres oraz termin odbioru rzecz przez kuriera:</h3>

                <div class="form-section form-section--columns">
                    <div class="form-section--column">
                        <h4>Adres odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label>
                                Ulica <form:input path="street" type="text" name="address" value="warszawska 3/45" id="street"/>
                            </label>
                            <form:errors path="street" cssClass="myStyle"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Miasto <form:input path="city" type="text" name="city" value="Warszawa" id="city"/>
                            </label>
                            <form:errors path="city" cssClass="myStyle"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Kod pocztowy <form:input path="zipCode" type="text" name="postcode" value="12-345" id="postcode"/>
                            </label>
                            <form:errors path="zipCode" cssClass="myStyle"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Numer telefonu <input type="phone" name="phone" value="123123123" id="phone"/>
                            </label>
                        </div>
                    </div>

                    <div class="form-section--column">
                        <h4>Termin odbioru</h4>
                        <div class="form-group form-group--inline">
                            <label>
                                Data <form:input path="pickUpDate" type="date" name="data" id="data"/>
                            </label>
                            <form:errors path="pickUpDate" cssClass="myStyle"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Godzina <form:input path="pickUpTime" type="time" name="time" value="12:00" id="time"/>
                            </label>
                            <form:errors path="pickUpTime" cssClass="myStyle"/>
                        </div>

                        <div class="form-group form-group--inline">
                            <label>
                                Uwagi dla kuriera
                                <form:textarea path="pickUpComment" name="more_info" rows="5" id="more_info"/>
                            </label>
                            <form:errors path="pickUpComment" cssClass="myStyle"/>
                        </div>
                    </div>
                </div>
                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="button" class="btn next-step" id="summaryButton">Dalej</button>
                </div>
            </div>

            <!-- STEP 6 -->
            <div data-step="5" id="summaryStep">
                <h3>Podsumowanie Twojej darowizny</h3>

                <div class="summary">
                    <div class="form-section">
                        <h4>Oddajesz:</h4>
                        <ul>
                            <li>
                                <span class="icon icon-bag"></span>
                                <span class="summary--text"
                                      id="summaryQuantity"
                                > worki ubrań w dobrym stanie dla dzieci</span
                                >
                            </li>

                            <li>
                                <span class="icon icon-hand"></span>
                                <span class="summary--text"
                                      id="summaryInstitution"
                                >Dla fundacji w Warszawie</span
                                >
                            </li>
                        </ul>
                    </div>

                    <div class="form-section form-section--columns">
                        <div class="form-section--column">
                            <h4>Adres odbioru:</h4>
                            <ul>
                                <li id="summaryStreet">Ulica: </li>
                                <li id="summaryCity">Miasto:</li>
                                <li id="summaryZipCode">Kod pocztowy:</li>
                                <li id="summaryPhone">Numer telefonu:</li>
                            </ul>
                        </div>

                        <div class="form-section--column">
                            <h4>Termin odbioru:</h4>
                            <ul>
                                <li id="summaryPickUpDate">Data: </li>
                                <li id="summaryPickUpTime">Czas: </li>
                                <li id="summaryPickUpComment">Uwagi: </li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="form-group form-group--buttons">
                    <button type="button" class="btn prev-step">Wstecz</button>
                    <button type="submit" class="btn">Potwierdzam</button>
                </div>
            </div>
        </form:form>
    </div>
</section>

<%@include file="footer.jsp"%>

<script src="<c:url value="resources/js/app.js"/>"></script>
</body>
</html>
