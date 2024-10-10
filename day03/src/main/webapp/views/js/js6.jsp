<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  // 문서 로드 후 js6.init() 호출
  $(document).ready(function() {
    js6.init();
  });
</script>

<div class="col-sm-10">
  <h2>Sign Up Form</h2>
  <form id="signup_form">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" class="form-control" id="id" placeholder="Enter ID" name="id" >
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pwd" >
    </div>
    <div class="form-group">
      <label for="confirmPwd">Confirm Password:</label>
      <input type="password" class="form-control" id="confirmPwd" placeholder="Confirm password" name="confirmPwd" >
    </div>
    <div class="form-group">
      <label for="name">Name:</label>
      <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name" >
    </div>
    <div class="form-group">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="form-group form-check">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <button type="button" class="btn btn-primary">Submit</button>
  </form>
</div>
