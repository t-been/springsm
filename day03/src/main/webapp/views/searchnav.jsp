<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- pagination start -->
<div class="col text-center ">
    <ul class="pagination justify-content-center">
        <c:choose>
            <c:when test="${cpage.getPrePage() != 0}">
                <li class="page-item">
                    <a  class="page-link"  href="<c:url value="/${target}/findimpl?pageNo=${cpage.getPrePage()}&keyword=${search.keyword}&search=${search.search}" />">Previous</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a  class="page-link"  href="#">Previous</a>
                </li>
            </c:otherwise>
        </c:choose>

        <c:forEach begin="${cpage.getNavigateFirstPage() }" end="${cpage.getNavigateLastPage() }" var="page">
            <c:choose>
                <c:when test="${cpage.getPageNum() == page}">
                    <li class="page-item active">
                        <a class="page-link"  href="<c:url value="/${target}/findimpl?pageNo=${page}&keyword=${search.keyword}&search=${search.search}" />">${page }</a>
                    </li>
                </c:when>
                <c:otherwise>
                    <li class="page-item">
                        <a class="page-link"  href="<c:url value="/${target}/findimpl?pageNo=${page}&keyword=${search.keyword}&search=${search.search}" />">${page }</a>
                    </li>
                </c:otherwise>
            </c:choose>

        </c:forEach>
        <c:choose>
            <c:when test="${cpage.getNextPage() != 0}">
                <li class="page-item">
                    <a class="page-link"  href="<c:url value="/${target}/findimpl?pageNo=${cpage.getNextPage()}&keyword=${search.keyword}&search=${search.search}" />">Next</a>
                </li>
            </c:when>
            <c:otherwise>
                <li class="page-item disabled">
                    <a class="page-link"  href="#">Next</a>
                </li>
            </c:otherwise>
        </c:choose>

    </ul>
</div>
<!-- pagination end -->

<!-- pagination end -->