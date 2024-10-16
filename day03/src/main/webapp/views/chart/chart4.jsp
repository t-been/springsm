<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  #container {
    width: 100%;
    height: 500px;
    border: 2px solid red;
  }
  #changeDataButton {
    margin-top: 20px;
  }
  #statusMessage {
    margin-top: 10px;
    font-weight: bold;
    color: green;
  }
</style>

<script>
  let chart4 = {
    init: function () {
      this.getdata();
      this.addButtonListener(); // 버튼 클릭 리스너 추가
    },

    getdata: function () {
      this.display();
    },

    display: function () {
      const onChartLoad = function () {
        const chart = this,
                series = chart.series[0];

        setInterval(function () {
          const x = (new Date()).getTime(), // 현재 시간
                  y = Math.random();  // 랜덤 값

          series.addPoint([x, y], true, true);
        }, 1000);
      };

      const data = (function () {
        const data = [];
        const time = new Date().getTime();

        for (let i = -19; i <= 0; i += 1) {
          data.push({
            x: time + i * 1000,
            y: Math.random()
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
          text: 'Live random data'
        },
        xAxis: {
          type: 'datetime',
          tickPixelInterval: 150,
          maxPadding: 0.1
        },
        yAxis: {
          title: {
            text: 'Value'
          }
        },
        series: [{
          name: 'Random data',
          data: data
        }]
      });
    },

    // 버튼 클릭 리스너 추가
    addButtonListener: function () {
      let isRequestPending = false; // 중복 요청 방지

      document.getElementById('changeDataButton').addEventListener('click', function () {
        if (isRequestPending) {
          return; // 요청이 진행 중이면 아무 동작도 하지 않음
        }

        // 클릭 시 랜덤 값 생성
        const x = (new Date()).getTime(); // 현재 시간
        const y = Math.random(); // 새로운 랜덤 값
        isRequestPending = true; // 요청 진행 중

        // 서버로 로그 전송 (버튼 클릭 이벤트)
        chart4.logToServer(x, y, 'Button Clicked', function (success) {
          isRequestPending = false; // 요청 완료
          if (success) {
            document.getElementById('statusMessage').textContent = '로그가 성공적으로 전송되었습니다.';
          } else {
            document.getElementById('statusMessage').textContent = '로그 전송에 실패했습니다.';
          }
        });
      });
    },

    // 서버로 로그 데이터 전송 (AJAX)
    logToServer: function (x, y, event, callback) {
      $.ajax({
        url: '/chart/log',  // 로그 데이터를 처리할 서버 엔드포인트
        method: 'POST',
        data: JSON.stringify({
          timestamp: x,
          value: y,
          event: event
        }),
        contentType: 'application/json',
        success: function () {
          console.log('Logged successfully');
          if (callback) callback(true); // 성공 콜백
        },
        error: function () {
          console.log('Logging failed');
          if (callback) callback(false); // 실패 콜백
        }
      });
    }
  };

  $(function () {
    chart4.init();
  });
</script>

<div class="col-sm-10">
  <h2>Chart4 Page</h2>
  <div id="container"></div>
  <button id="changeDataButton">Change Chart Data</button>
  <div id="statusMessage"></div>
</div>