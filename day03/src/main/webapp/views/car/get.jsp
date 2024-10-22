<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-10">

    <h2>Car Get Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Model</th>
            <th>Price</th>
            <th>ImgName</th>
            <th>Regdate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${cars}">
            <tr>
                <td>${c.carId}</td>
                <td>${c.carModel}</td>
                <td>${c.carPrice}</td>
                <td>${c.imgName}</td>
                <td>${c.formattedCarRegDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>