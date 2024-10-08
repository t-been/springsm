<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-10">

  <h2>Login Page</h2>
  <div class = "row">
    <div class = "col-sm-5">
      <form action="/action_page.php">
        <div class="form-group">
          <label for="id">ID address:</label>
          <input type="text" class="form-control" placeholder="Enter ID" id="id">
        </div>
        <div class="form-group">
          <label for="pwd">Password:</label>
          <input type="password" class="form-control" placeholder="Enter password" id="pwd">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
      </form>
    </div>
  </div>
</div>