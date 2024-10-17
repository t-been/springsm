<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #container {
    width: 100%;
    height: 500px;
    border: 2px solid red;
  }
</style>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>

<script>
  let chart4 = {
    init: function () {
      this.getdata();
    },

    getdata: function () {
      this.display();
    },

    display: function () {
      const onChartLoad = function () {
        const chart = this,
                series = chart.series[0];

        // 매 1초마다 서버에서 데이터를 가져와서 차트에 반영
        setInterval(function () {
          $.ajax({
            url: '/iot/chartData', // IoT 데이터를 가져오는 엔드포인트
            success: function (data) {
              const x = (new Date()).getTime(), // 현재 시간
                      y = data[data.length - 1]; // 최신 IoT 데이터

              // 새로운 데이터 포인트를 추가
              series.addPoint([x, y], true, true);
            },
            error: function () {
              console.error("Failed to fetch IoT data");
            }
          });
        }, 2000); // 2초 간격으로 서버에서 데이터를 가져옴
      };

      // 초기 차트 데이터 설정
      const data = (function () {
        const data = [];
        const time = new Date().getTime();

        for (let i = -19; i <= 0; i += 1) {
          data.push({
            x: time + i * 1000,
            y: Math.random() // 초기에는 랜덤 데이터로 채움, 이후 서버에서 데이터를 갱신
          });
        }
        return data;
      }());

      Highcharts.chart('container', {
        chart: {
          type: 'spline',
          events: {
            load: onChartLoad
          }
        },

        time: {
          useUTC: false
        },

        title: {
          text: 'Real-time IoT Data'
        },

        xAxis: {
          type: 'datetime',
          tickPixelInterval: 150,
          maxPadding: 0.1
        },

        yAxis: {
          title: {
            text: 'Value'
          },
          plotLines: [
            {
              value: 0,
              width: 1,
              color: '#808080'
            }
          ]
        },

        tooltip: {
          headerFormat: '<b>{series.name}</b><br/>',
          pointFormat: '{point.x:%Y-%m-%d %H:%M:%S}<br/>{point.y:.2f}'
        },

        legend: {
          enabled: false
        },

        exporting: {
          enabled: false
        },

        series: [
          {
            name: 'IoT Data',
            lineWidth: 2,
            color: Highcharts.getOptions().colors[2],
            data
          }
        ]
      });
    }
  };

  $(function(){
    chart4.init();
  });
</script>

<div class="col-sm-10">
  <h2>Chart4: Real-time IoT Data</h2>
  <div id="container"></div>
</div>
