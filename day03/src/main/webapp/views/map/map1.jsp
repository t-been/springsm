<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #map {
        width: 100%;
        height: 500px;
        border: 2px solid darkred;
    }
</style>

<script>
    let map1 = {
        map:null,
        init:function (){
            this.makemap();
            $('#sbtn').click(()=>{
                this.goseoul();
            });
            $('#bbtn').click(()=>{
                this.gobusan();
            });
            $('#jbtn').click(()=>{
                this.gojeju();
            });
        },
        makemap:function (){
            let mapContainer = document.getElementById('map'); // 지도를 표시할 div
            let mapOption = {
                center: new kakao.maps.LatLng(36.799117, 127.074977), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            this.map = new kakao.maps.Map(mapContainer, mapOption);

            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            let mapTypeControl = new kakao.maps.MapTypeControl();
            this.map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            let zoomControl = new kakao.maps.ZoomControl();
            this.map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            // 마커가 표시될 위치입니다
            let markerPosition  = new kakao.maps.LatLng(36.799117, 127.074977);
            let marker = new kakao.maps.Marker({ position: markerPosition });
            marker.setMap(this.map);

            //인포윈도우 표시 위치입니다
            let iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>';
            let iwPosition = new kakao.maps.LatLng(36.799117, 127.074977); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            infowindow.open(this.map, marker);
        },

        goseoul:function (){
            let moveLatLon = new kakao.maps.LatLng(37.551312, 126.988242);
            this.map.panTo(moveLatLon);

            let markerPosition  = new kakao.maps.LatLng(37.551312, 126.988242);
            let marker = new kakao.maps.Marker({ position: markerPosition });
            marker.setMap(this.map);
        },
        gobusan:function (){
            let moveLatLon = new kakao.maps.LatLng(35.160078, 129.160036);
            this.map.panTo(moveLatLon);

            let markerPosition  = new kakao.maps.LatLng(35.160078, 129.160036);
            let marker = new kakao.maps.Marker({ position: markerPosition });
            marker.setMap(this.map);
        },
        gojeju:function (){
            let moveLatLon = new kakao.maps.LatLng(33.504316, 126.519839);
            this.map.panTo(moveLatLon);

            let markerPosition  = new kakao.maps.LatLng(33.504316, 126.519839);
            let marker = new kakao.maps.Marker({ position: markerPosition });
            marker.setMap(this.map);
        }
    };
    $(function (){
        map1.init();
    });
</script>

<div class="col-sm-10">

  <h2>Map1 Page</h2>
    <button id = "sbtn">Seoul</button>
    <button id = "bbtn">Busan</button>
    <button id = "jbtn">Jeju</button>
    <div id = "map"></div>
 </div>