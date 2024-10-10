<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
  window.onload = function () {
    let h5 = document.querySelector('h5');
    h5.innerHTML = "Replace H5"
    let h6 = document.querySelector('#id01');
    h6.innerHTML = "Replace H6"

    let btn = document.querySelector('#btn_click');
    btn.onclick = function () {
      alert('btn1 Clicked');
      h6.innerHTML = "Button Clicked"
    }
    let btn2 = document.querySelector('#btn_click2');
    btn2.onclick = function () {
      let c = confirm('btn2 Clicked');
      if (c == true) {
        location.href = '/js/js2'
      }
    }
  };

</script>
<div class="col-sm-10">

  <h2>JS 1 PAGE</h2>
  <button id="btn_click">Click</button>
  <a href="#" id="btn_click2">Click 2</a>
  <h5>Title description, Sep 2, 2017</h5>
  <br>
  <h6 id="id01">Header 1</h6>
  <h6 id="id02">Header 2</h6>
  <h6 id="id03">Header 3</h6>
</div>

