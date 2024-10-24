<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">
    <h2>Item Search Page</h2>
    <form action="/item/findimpl" method="get">
        <div class="form-group">
            <div class="row">
                <div class="col-sm-2">
                    <h5>Search</h5>
                </div>
                <div class="col-sm-3">
                    <select class="form-control" name="keyword">
                        <option value="price" <c:if test="${search.keyword == 'price'}"> selected </c:if>>Price</option>
                        <option value="name" <c:if test="${search.keyword == 'name'}"> selected </c:if>>Name</option>
                        <option value="reg" <c:if test="${search.keyword == 'reg'}"> selected </c:if>>Date</option>
                    </select>
                </div>
                <div class="col-sm-4">
                    <c:choose>
                        <c:when test="${search.keyword == 'reg'}">
                            <!-- 날짜 검색용 입력 필드 -->
                            <input type="date" class="form-control" name="startDate"
                            <c:if test="${search.startDate != null}"> value="${search.startDate}" </c:if>
                                   placeholder="Start Date">
                            <input type="date" class="form-control mt-2" name="endDate"
                            <c:if test="${search.endDate != null}"> value="${search.endDate}" </c:if>
                                   placeholder="End Date">
                        </c:when>
                        <c:otherwise>
                            <!-- 일반 텍스트 검색 -->
                            <input type="text" class="form-control" name="search"
                            <c:if test="${search.search != null}"> value="${search.search}" </c:if>
                                   placeholder="Enter search term">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="col-sm-3">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </div>
        </div>
    </form>
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
        <c:forEach var="c" items="${cpage.getList()}">
            <tr>
                <td><a href="/item/detail?id=${c.itemId}">${c.itemId}</a></td>
                <td>${c.itemName}</td>
                <td>${c.itemPrice}</td>
                <td><img src="<c:url value='/imgs'/>/${c.imgName}" alt="${c.itemName}" style="width: 100px; height: auto;"></td>
                <td>${c.formattedCarRegDate}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <c:if test="${cpage.getSize() != null}">
        <jsp:include page="../searchnav.jsp"/>
    </c:if>
</div>
