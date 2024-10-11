<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Item Get Page</h2>
  <h5>Title description, Sep 2, 2017</h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>imgname</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="i" items="${items}">
                <tr>
                    <td>${i.id}</td>
                    <td>${i.name}</td>
                    <td>${i.price}</td>
                    <td>${i.imgname}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

 </div>