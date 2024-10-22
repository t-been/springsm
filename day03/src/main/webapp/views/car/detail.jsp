<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  let detail ={
    init:function(){
      $('#update_btn').click(()=>{
        this.check();
      });
      $('#delete_btn').click(()=>{
        let id = $('#id').val();
        let c = confirm("삭제하시겠습니까 ?");
        if(c == true) {
          location.href='<c:url value="/car/deleteimpl"/>'+'?id='+id;
        } else {
          return;
        }
      });
    },
    check:function() {
      let id = $('#id').val();
      let price = $('#price').val();
      let imgName = $('#img').val();
      if(id == '' || id == null){
        alert('Id is Mandatory');
        $('#id').focus();
        return;
      }
      if(price == '' || price == null){
        alert('Price is Mandatory');
        $('#price').focus();
        return;
      }
      if(imgName == '' || imgName == null){
        alert('ImgName is Mandatory');
        $('#img').focus();
        return;
      }
      this.send();
    },
    send:function(){
      // method, action
      $('#detail_form').attr('method','put');
      $('#detail_form').attr('action','/car/updateimpl');
      $('#detail_form').submit();
    }
  };
  $(function(){
    detail.init();
  });
</script>
<div class="col-sm-10">
  <h2>Detail Page</h2>
  <div class="row">
    <div class="col-sm-5">
      <form id="detail_form">
        <div class="form-group">
          <label for="id">Id:</label>
          <input type="text" readonly value="${c.carId}" class="form-control" placeholder="Enter Id" id="id" name="carId">
        </div>
        <div class="form-group">
          <label for="model">Model:</label>
          <input type="text" readonly value="${c.carModel}" class="form-control" placeholder="Enter Model" id="model" name="carModel">
        </div>
        <div class="form-group">
          <label for="price">Price:</label>
          <input type="text" value="${c.carPrice}" class="form-control" placeholder="Enter Price" id="price" name="carPrice">
        </div>
        <div class="form-group">
          <label for="price">ImgName:</label>
          <input type="text" value="${c.imgName}" class="form-control" placeholder="Enter Imgname" id="img" name="imgName">
        </div>
        <div class="form-group">
          <label for="regdate">RegDate:</label>
          <input type="text" readonly value="${c.carRegDate}" class="form-control" placeholder="Enter RegDate" id="regdate" name="regDate">
        </div>
        <button type="button" id="update_btn" class="btn btn-primary">Update</button>
        <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>
      </form>
    </div>
  </div>
</div>