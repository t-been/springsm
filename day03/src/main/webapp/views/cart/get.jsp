<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    #item_img {
        width: 80px;
    }
</style>

<script>
    let cart_get = {
        init: function () {
            $('.delete_btn').click(function () {
                let custId = $(this).data('custid');
                let itemId = $(this).data('itemid');
                cart_get.delete(custId, itemId);
            });
            $('.increment_btn').click(function () {
                let custId = $(this).data('custid');
                let itemId = $(this).data('itemid');
                let plma = 1;
                cart_get.setCount(custId, itemId, plma);
            });
            $('.decrement_btn').click(function () {
                let custId = $(this).data('custid');
                let itemId = $(this).data('itemid');
                let plma = -1;
                cart_get.setCount(custId, itemId, plma);
            });
        },
        delete: function (custId, itemId, plma) {
            let c = confirm('삭제하시겠습니까?');
            if (c == true) {
                location.href = '/cart/delete?custId=' + custId + '&itemId=' + itemId;
            }
        },
        setCount: function (custId, itemId, plma) {
            $.ajax({
                url: '/cart/count',
                type: 'POST',
                data: {custId: custId, itemId: itemId, plma: plma},
                success: function () {
                    location.reload();
                },
                error: function () {
                    alert('Error setting count');
                }
            })
        },
    };
    $(function () {
        cart_get.init();
    });
</script>


<div class="col-sm-10">
    <h2>Cart Get Page</h2>
    <h5>Title description, Sep 2, 2017</h5>
    <table class="table" id="cdata">
        <thead class="thead-dark">
        <tr>
            <th>Img</th>
            <th>name</th>
            <th>price</th>
            <th>count</th>
            <th>regdate</th>
            <th>delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cart" items="${carts}">
            <tr>
                <td>
                    <a href="/item/detail?id=${cart.cartItemId}">
                        <img id="item_img" src="<c:url value="/imgs"/>/${cart.imgName}">
                    </a>
                </td>
                <td>${cart.itemName}</td>
                <td><fmt:formatNumber type="number" pattern="###,###원" value="${cart.itemPrice}"/></td>
                    <%--        <td>${cart.cartCount}</td>--%>

                <td>
                    <button class="decrement_btn" data-custid="${cart.cartUserId}" data-itemid="${cart.cartItemId}">-
                    </button>
                        ${cart.cartCount}

                    <button class="increment_btn" data-custid="${cart.cartUserId}" data-itemid="${cart.cartItemId}">+
                    </button>
                </td>
                <td>
                    <fmt:parseDate value="${cart.cartRegDate}"
                                   pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
                    <fmt:formatDate pattern="yyyy년 MM월 dd일 HH시 mm분" value="${ parsedDateTime }"/>
                </td>
                <td>
                    <button class="delete_btn" data-custid="${cart.cartUserId}" data-itemid="${cart.cartItemId}">delete
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>