<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script>
  let register = {
    init:function(){
      $('#register_form > button').click(()=>{
        this.check();
      });
      $('#id').keyup(()=>{
        $('#id_span').text('ID는 4자리 이상입니다.');
        let id = $('#id').val();
        if(id.length >= 4){
          $.ajax({
            url:'<c:url value="checkid"/>',
            data:{'rid':id},
            success:function (data){
              //alert(data.result);
              if(data.result == 1){
                $('#id_span').text('사용 불가능한 ID입니다.');
              } else {
                $('#id_span').text('사용 가능한 ID입니다.');
              }
            }
          });
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

      $('#register_form').attr('action','/registerimpl');
      $('#register_form').submit();
    }
  };
  $(function() {
    register.init();
  });
</script>

<div class="col-sm-10">

  <h2>Register Page</h2>
  <div class = "row">
    <div class = "col-sm-5">
      <form id = "register_form">

        <div class="form-group">
          <label for="id">ID:<span id = "id_span"></span></label>
          <input type="text" class="form-control" placeholder="Enter ID" id="id" name = 'id'>
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" placeholder="Enter Password" id="pwd" name = 'pwd'>
        </div>
        <div class="form-group">
          <label for="name">Name:</label>
          <input type="text" class="form-control" placeholder="Enter Name" id="name" name = 'name'>
        </div>

        <button type="button" class="btn btn-primary">Submit</button>

      </form>
    </div>
  </div>

</div>