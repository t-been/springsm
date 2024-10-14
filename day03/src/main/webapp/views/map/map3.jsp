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
    let map3 = {
        init:function (){
            this.makemap(37.551312, 126.988242, '남산', 'ns.jpg', 100);

            $('#sbtn').click(()=>{
                // 37.551312, 126.988242
                this.makemap(37.551312, 126.988242, '남산', 'ns.jpg', 100);
            });
            $('#bbtn').click(()=>{
                // 35.160078, 129.160036
                this.makemap(35.160078, 129.160036, '해운대', 'bs.jpg', 200);
            });
            $('#jbtn').click(()=>{
                // 33.504316, 126.519839
                this.makemap(33.504316, 126.519839, '제주도', 'js.jpg', 300);
            });
        },
        makemap:function(lat, lng, title, img, target){ {
            let mapContainer = document.getElementById('map'); // 지도를 표시할 div
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
                level: 5 // 지도의 확대 레벨
            };
            // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
            let map = new kakao.maps.Map(mapContainer, mapOption);
            // 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
            let mapTypeControl = new kakao.maps.MapTypeControl();
            map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
            let zoomControl = new kakao.maps.ZoomControl();
            map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

            let markerPosition  = new kakao.maps.LatLng(lat, lng);
            let marker = new kakao.maps.Marker({
                map:map,
                position: markerPosition
            });
            let iwContent = '<p>'+title+'</p>';
            iwContent += '<img style = "width:150px;" src = "<c:url value = "/img/'+img+'"/> ">';
            let iwPosition = new kakao.maps.LatLng(lat, lng); //인포윈도우 표시 위치입니다
            let infowindow = new kakao.maps.InfoWindow({
                position : iwPosition,
                content : iwContent
            });
            kakao.maps.event.addListener(marker, 'mouseover', overHandler(map, marker, infowindow));
            kakao.maps.event.addListener(marker, 'mouseout', outHandler(infowindow));
            kakao.maps.event.addListener(marker, 'click', clickHandler(target));

            function clickHandler(target) {
                return function (){
                    location.href = '<c:url value = "/map/go?target='+target+'"/> ';
                };
            };
            function overHandler(map, marker, infowindow) {
                return function (){
                    infowindow.open(map, marker);
                };
            };
            function outHandler(infowindow) {
                return function (){
                    infowindow.close();
                };
            };
        }
        },
        markers:function(target) {
            // lat, lng, title, img, code
            let datas = [];

        }
    };

    $(function(){
        map.init();

    });
</script>

<div class="col-sm-10">
    <h2>Map3 Page</h2>
    <button id = "sbtn">Seoul</button>
    <button id = "bbtn">Busan</button>
    <button id = "jbtn">Jeju</button>
    <div id = "map"></div>
</div>