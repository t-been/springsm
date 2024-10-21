<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let detail = {
    init:function(){
      $('#update_btn').click(()=>{
        this.check();
      });
      $('#delete_btn').click(()=>{
        let id = $('#id').val();
        let c = confirm("삭제 하시겠습니까?");
        if(c == true) {
            location.href = '<c:url value="/cust/deleteimpl" />'+'?id='+id;
        }
      });
    },

    check:function(){
      let id = $('#id').val();
      let pwd = $('#pwd').val();
      let name = $('#name').val();
      if(id == '' || id == null){
        alert('Id is Mandatory');
        $('#id').focus();
        return;
      }
      if(pwd == '' || pwd == null){
        alert('Pwd is Mandatory');
        $('#pwd').focus();
        return;
      }
      if(name == '' || name == null){
        alert('Name is Mandatory');
        $('#name').focus();
        return;
      }
      this.send();
    },

    send:function(){
      // method, action
      $('#register_form').attr('method','post');

      $('#register_form').attr('action','/cust/updateimpl');
      $('#register_form').submit();
    }
  };
  $(function() {
    detail.init();
  });
</script>

<div class="col-sm-10">

  <h2>Detail Page</h2>
  <div class = "row">
    <div class = "col-sm-5">
      <form id = "register_form">

        <div class="form-group">
          <label for="id">ID:<span id = "id_span"></span></label>
          <input type="text" readonly value="${cust.custId}" class="form-control" placeholder="Enter ID" id="id" name = 'custId'>
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" value="${cust.custPwd}" class="form-control" placeholder="Enter Password" id="pwd" name = 'custPwd'>
        </div>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" value="${cust.custName}" class="form-control" placeholder="Enter Name" id="name" name = 'custName'>
        </div>

        <button type="button" id="update_btn" class="btn btn-primary">Update</button>
        <button type="button" id="delete_btn" class="btn btn-primary">Delete</button>

      </form>
    </div>
  </div>

</div>