<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
   #map1, #map2 {
    width: 100%;
    height: 400px;
    border: 1px solid indianred;
  }
</style>
<script>
  let about = {
    init:function (){
      this.map1();
      this.map2();
    },
    map1:function (){
      let mapContainer = document.getElementById('map1'); // 지도를 표시할 div
      let mapOption = {
        center: new kakao.maps.LatLng(36.799117, 127.074977), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
      };
      // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
      let map = new kakao.maps.Map(mapContainer, mapOption);

      // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
      let mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      let zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      // 마커가 표시될 위치입니다
      let markerPosition  = new kakao.maps.LatLng(36.799117, 127.074977);
      let marker = new kakao.maps.Marker({ position: markerPosition });
      marker.setMap(map);
    },

    map2:function (){
      let mapContainer = document.getElementById('map2'); // 두 번째 지도를 표시할 div
      let mapOption = {
        center: new kakao.maps.LatLng(36.770893, 127.164286),
        level: 5 // 두 번째 지도의 확대 레벨
      };
      let map = new kakao.maps.Map(mapContainer, mapOption);

      let mapTypeControl = new kakao.maps.MapTypeControl();
      map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
      let zoomControl = new kakao.maps.ZoomControl();
      map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

      let markerPosition  = new kakao.maps.LatLng(36.770893, 127.164286);
      let marker = new kakao.maps.Marker({ position: markerPosition });
      marker.setMap(map);
    }
  };

  $(function () {
    about.init();
  });
</script>

<div class="col-sm-10">

  <h2>About Page</h2>
  <div class="row">
    <div class="col-sm-6">
      <div id="map1"></div>
    </div>
    <div class="col-sm-6">
      <div id="map2"></div>
    </div>
  </div>
</div>
