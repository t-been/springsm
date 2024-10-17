<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #container{
        width:700px;
        height: 500px;
        border: 2px solid red;
    }
</style>
<script>
    let chart1 = {
        init:function(){
            this.getdata();
            setInterval(()=>{
                this.getdata();
            },5000);
        },
        getdata:function(){
            $.ajax({
                url:'/iot/chartData',
                success:(datas)=>{
                    this.display(datas);
                }
            });
        },
        display:function(datas){
            Highcharts.chart('container', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Real-time IoT Data'
                },
                xAxis: {
                    categories: [...Array(datas.length).keys()].map(i => `Data ${i + 1}`),  // 데이터 인덱스
                },
                yAxis: {
                    title: {
                        text: 'Power Usage (W)'
                    }
                },
                series: [{
                    name: 'Power',
                    data: datas  // 서버에서 가져온 데이터
                }]
            });
        }
    };
    $(function(){
        chart1.init();
    });
</script>

<div class="col-sm-10">
    <h2>Chart1 Page</h2>
    <div id="container"></div>
</div>