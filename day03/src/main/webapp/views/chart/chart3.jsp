<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    .chart-container {
        display: flex;          /* Flexbox를 사용하여 차트가 가로로 배치되도록 설정 */
        flex-wrap: wrap;        /* 화면이 작으면 차트가 아래로 내려가도록 설정 */
        justify-content: space-between; /* 차트들 사이에 여유 공간을 균등하게 배치 */
        gap: 20px;              /* 차트 사이의 간격 */
        margin-top: 20px;
    }

    .chart-item {
        width: 45%;             /* 각 차트의 너비를 설정 */
        min-width: 300px;       /* 최소 너비 설정 */
        height: 300px;          /* 차트의 높이 설정 */
        border: 2px solid red;  /* 차트 외곽선을 구분하기 위한 테두리 */
    }
</style>

<script>
    let chart3 = {
        init: function () {
            this.renderChart1();  // Line Chart
            this.renderChart2();  // Bar Chart
            this.renderChart3();  // Pie Chart
            this.renderChart4();  // Scatter Chart
        },

        // 첫 번째 차트 (Line 차트)
        renderChart1: function () {
            Highcharts.chart('container', {
                chart: {
                    type: 'line'
                },
                title: {
                    text: 'Monthly Average Temperature'
                },
                subtitle: {
                    text: 'Source: WorldClimate.com'
                },
                xAxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                },
                yAxis: {
                    title: {
                        text: 'Temperature (°C)'
                    }
                },
                series: [{
                    name: 'Seoul',
                    data: [-0.7, 0.6, 4.5, 9.3, 14.5, 19.2, 23.1, 23.3, 18.3, 12.1, 5.2, 0.4]
                }, {
                    name: 'New York',
                    data: [-0.2, 0.8, 5.7, 10.3, 15.4, 20.3, 24.2, 24.1, 19.2, 13.5, 8.5, 2.9]
                }]
            });
        },

        // 두 번째 차트 (Bar 차트)
        renderChart2: function () {
            Highcharts.chart('container1', {
                chart: {
                    type: 'bar'
                },
                title: {
                    text: 'Population Growth by Region'
                },
                xAxis: {
                    categories: ['Africa', 'America', 'Asia', 'Europe']
                },
                yAxis: {
                    title: {
                        text: 'Population (millions)'
                    }
                },
                series: [{
                    name: 'Year 1990',
                    data: [631, 727, 3202, 721]
                }, {
                    name: 'Year 2000',
                    data: [814, 841, 3714, 726]
                }, {
                    name: 'Year 2018',
                    data: [1276, 1007, 4561, 746]
                }]
            });
        },

        // 세 번째 차트 (Pie 차트)
        renderChart3: function () {
            Highcharts.chart('container2', {
                chart: {
                    type: 'pie'
                },
                title: {
                    text: 'Browser market shares in 2021'
                },
                series: [{
                    name: 'Browsers',
                    colorByPoint: true,
                    data: [{
                        name: 'Chrome',
                        y: 64.67,
                        sliced: true,
                        selected: true
                    }, {
                        name: 'Edge',
                        y: 12.63
                    }, {
                        name: 'Firefox',
                        y: 10.78
                    }, {
                        name: 'Safari',
                        y: 9.67
                    }, {
                        name: 'Others',
                        y: 2.25
                    }]
                }]
            });
        },

        // 네 번째 차트 (Scatter 차트)
        renderChart4: function () {
            Highcharts.chart('container3', {
                chart: {
                    type: 'scatter',
                    zoomType: 'xy'
                },
                title: {
                    text: 'Height vs Weight of 507 individuals'
                },
                xAxis: {
                    title: {
                        text: 'Height (cm)'
                    }
                },
                yAxis: {
                    title: {
                        text: 'Weight (kg)'
                    }
                },
                series: [{
                    name: 'Male',
                    color: 'rgba(119, 152, 191, .5)',
                    data: [[174, 65], [175, 71], [180, 75], [178, 74], [182, 85]]
                }, {
                    name: 'Female',
                    color: 'rgba(223, 83, 83, .5)',
                    data: [[165, 50], [160, 52], [165, 60], [162, 55], [170, 64]]
                }]
            });
        }
    };

    $(function () {
        chart3.init();
    });
</script>

<div class="col-sm-10">
    <h2>Chart3 Page</h2>

    <div class="chart-container">
        <div id="container" class="chart-item"></div>
        <div id="container1" class="chart-item"></div>
        <div id="container2" class="chart-item"></div>
        <div id="container3" class="chart-item"></div>
    </div>
</div>