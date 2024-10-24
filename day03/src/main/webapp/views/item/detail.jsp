<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let detail = {
    init: function () {
      $('#cart_btn').click(() => {
        this.send();
      });
    },
    send: function () {
      $('#detail_form').attr('method', 'post');
      $('#detail_form').attr('action', '/cart/add'); // 카트 추가 액션으로 설정
      $('#detail_form').submit();
    }
  };
  $(function () {
    detail.init();
  });
</script>

<div class="col-sm-10">
  <h2>Detail Page</h2>
  <div class="row">
    <div class="col-sm-5">
      <form id="detail_form">
        <div class="form-group">
          <input type="hidden" value="${item.itemId}" class="form-control" id="itemId" name="itemId">
          <input type="hidden" value="${sessionScope.loginid.custId}" class="form-control" id="custId" name="custId">
        </div>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" readonly value="${item.itemName}" class="form-control" id="name" name="itemName">
        </div>
        <div class="form-group">
          <label for="regdate">Date:</label>
          <input type="text" readonly value="${item.regDate}" class="form-control" id="regdate" name="regDate">
        </div>
        <div class="form-group">
          <label for="price">Price:</label>
          <input type="text" readonly value="${item.itemPrice}" class="form-control" id="price" name="itemPrice">
        </div>
        <button type="button" id="cart_btn" class="btn btn-primary">Add Cart</button>
      </form>
    </div>
  </div>
</div>
