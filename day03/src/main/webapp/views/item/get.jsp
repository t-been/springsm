<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-10">

  <h2>Item Get Page</h2>
  <h5>Title description, Sep 2, 2017</h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Img</th>
            <th>Regdate</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach var="c" items="${items}">
                <tr>
                    <td><a href="/item/detail?id=${c.itemId}">${c.itemId}</a></td>
                    <td>${c.itemName}</td>
                    <td><fmt:formatNumber type="number" pattern="###,###원" value="${c.itemPrice}" /></td>
                    <td><img  src="<c:url value="/imgs"/>/${c.imgName}" alt="${c.itemName}" style="width: 100px; height: auto;"></td>

                    <td>${c.formattedCarRegDate}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

 </div> 