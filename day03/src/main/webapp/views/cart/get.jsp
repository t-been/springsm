<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="col-sm-10">
    <h2>Cart Get Page</h2>
    <h5>Title description, <fmt:formatDate value="${now}" pattern="MMM d, yyyy" /></h5>
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th>Img</th>
            <th>Id</th>
            <th>Name</th>
            <th>Price</th>
            <th>Regdate</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="c" items="${carts}">
            <tr>
                <td>
                    <c:choose>
                        <c:when test="${not empty c.imgName}">
                            <img src="<c:url value='/imgs'/>/${c.imgName}" alt="${c.itemName}" style="width: 100px; height: auto;">
                        </c:when>
                        <c:otherwise>
                            <span>No Image Available</span>
                        </c:otherwise>
                    </c:choose>
                </td>
                <td>${c.cartItemId}</td>
                <td>${c.itemName}</td>
                <td><fmt:formatNumber type="number" pattern="###,###원" value="${c.itemPrice}" /></td>
                <td><fmt:formatDate value="${c.cartRegDate}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
