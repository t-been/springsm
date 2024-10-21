<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

    <h2>Cust Get Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Model</th>
            <th>Name</th>
            <th>Price</th>
            <th>Regdate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${custs}">
            <tr>
                <td><a href="/car/detail?id=${c.carId}">${c.carId}</a></td>
                <td>${c.carModel}</td>
                <td>${c.carName}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>