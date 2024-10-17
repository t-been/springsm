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
                url:'/charts/chart1',
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
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: ' +
                        '<a href="https://en.wikipedia.org/wiki/List_of_cities_by_average_temperature" ' +
                        'target="_blank">Wikipedia.com</a>'
                },
                xAxis: {
                    categories: datas
                },
                yAxis: {
                    title: {
                        text: 'Temperature (°C)'
                    }
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: datas.result
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