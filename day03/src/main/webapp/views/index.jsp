<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>Bootstrap 4 Website Example</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="<c:url value="/js/index.js"/> "></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4d6c420f59edfb20579ef2824075540b"></script>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <%--HighCharts Lib  start --%>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/export-data.js"></script>
    <script src="https://code.highcharts.com/modules/accessibility.js"></script>
    <%--HighCharts Lib  end --%>

    <%-- Web Socket Lib    --%>
    <script src="/webjars/sockjs-client/sockjs.min.js"></script>
    <script src="/webjars/stomp-websocket/stomp.min.js"></script>

    <style>
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
        .fakeimg {
            height: 200px;
            background: #aaa;
        }
        #scroll-btn {
            opacity: 0;
            width: 50px;
            height: 50px;
            color: #fff;
            background-color: #ef476f;
            position: fixed;
            bottom: 13%;
            right: 10%;
            border: 2px solid #fff;
            border-radius: 50%;
            font: 2px monospace;
            transition: opacity 2s, transform 2s;
        }
        #scroll-btn.show {
            opacity: 1;
            transition: opacity 5s, transform 5s;
        }
        #scroll-btn2 {
            opacity: 0;
            width: 50px;
            height: 50px;
            color: #fff;
            background-color: #ef476f;
            position: fixed;
            bottom: 5%;
            right: 10%;
            border: 2px solid #fff;
            border-radius: 50%;
            font: bold 10px monospace;
            transition: opacity 2s, transform 2s;
        }
        #scroll-btn2.show {
            opacity: 1;
            transition: opacity 5s, transform 5s;
        }
    </style>
    <script>
        let chatbtn = {
            init:function(){
                const scrollBtn = document.createElement("button");
                scrollBtn.innerHTML = "chatbot";
                scrollBtn.setAttribute("id", "scroll-btn");
                document.body.appendChild(scrollBtn);
                scrollBtn.classList.add("show");
                scrollBtn.addEventListener("click", function(){
                    location.href='<c:url value="/chatbot"/>';
                });
                const scrollBtn2 = document.createElement("button");
                scrollBtn2.innerHTML = "1:1";
                scrollBtn2.setAttribute("id", "scroll-btn2");
                document.body.appendChild(scrollBtn2);
                scrollBtn2.classList.add("show");
                scrollBtn2.addEventListener("click", function(){
                    location.href='<c:url value="/websocket"/>';
                });
            }
        };
        $(function(){
            chatbtn.init();
        });
    </script>
</head>
<body>

<div class="jumbotron text-center" style="margin-bottom:0">
    <h1><spring:message code="site.title"/></h1>
    <h4><spring:message code="site.tel" arguments="041-312-3234"/></h4>
    <img src="<c:url value="/img/sm.jpg"/> ">
    <img src="<c:url value="/imgs/car.jpg"/> ">
    <p>Resize this responsive page to see the effect!</p>
</div>
<ul class="nav justify-content-end">
    <c:choose>
        <c:when test="${sessionScope.loginid == null}">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/login"/> ">Login</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/register"/>">Register</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/about"/>">About us</a>
            </li>
        </c:when>
        <c:otherwise>
            <li class="nav-item">
                <a class="nav-link" href="#">${sessionScope.loginid.custId}</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/logoutimpl"/>">Logout</a>
            </li>
        </c:otherwise>
    </c:choose>


</ul>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <a class="navbar-brand" href="<c:url value="/" /> ">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/js" /> ">JS</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/ajax"/> ">AJAX</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/map"/> ">Map</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<c:url value="/chart"/> ">Chart</a>
            </li>
            <c:if test="${sessionScope.loginid != null}">
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/cust"/> ">Cust</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/item"/> ">Item</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/webcam"/> ">WebCam</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/websocket"/> ">websocket</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/chat"/> ">chat</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<c:url value="/webrtc"/> ">webrtc</a>
                </li>
            </c:if>
        </ul>
    </div>
</nav>

<div class="container" style="margin-top:30px">
    <div class="row">
        <c:choose>
            <c:when test="${left == null}">
                <jsp:include page="left.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${left}.jsp"/>
            </c:otherwise>
        </c:choose>
        <c:choose>
            <c:when test="${center == null}">
                <jsp:include page="center.jsp"/>
            </c:when>
            <c:otherwise>
                <jsp:include page="${center}.jsp"/>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="jumbotron text-center" style="margin-bottom:0">
    <p>Footer</p>
</div>

</body>
</html>