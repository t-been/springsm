<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Car Page Page</h2>
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
            <c:forEach var="c" items="${cpage.getList()}">
                <tr>
                    <td><a href="/car/detail?id=${c.carId}">${c.carId}</a></td>
                    <td>${c.carModel}</td>
                    <td>${c.carPrice}</td>
                    <td>${c.imgName}</td>
                    <td>${c.formattedCarRegDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <jsp:include page="../nav.jsp"/>
</div>