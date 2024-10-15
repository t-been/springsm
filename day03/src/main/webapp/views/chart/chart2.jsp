<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #container {
        width: 100%;
        height: 500px;
        border: 2px solid red;
    }
</style>

<script>
    let chart2 = {
        init: function () {
            this.bindEvents();
        },

        bindEvents: function () {
            // 버튼 클릭 시 데이터 가져오기
            $('#btn1').on('click', function () { chart2.getdata(2020); });
            $('#btn2').on('click', function () { chart2.getdata(2021); });
            $('#btn3').on('click', function () { chart2.getdata(2022); });
            $('#btn4').on('click', function () { chart2.getdata(2023); });
            $('#btn5').on('click', function () { chart2.getdata(2024); });
        },

        getdata: function (year) {
            const data = {
                2020: {
                    male: [2, 9, 13, 50, 170, 299, 438, 841, 1169, 1703, 2422, 3692],
                    female: [1, 5, 25, 50, 120, 150, 200, 426, 660, 863, 1048, 1627]
                },
                2021: {
                    male: [5543, 7345, 12298, 18638, 22229, 25540, 28133, 29463, 31139, 31175, 31255, 29561],
                    female: [2492, 3346, 4259, 5242, 6144, 7091, 8400, 9490, 10671, 11736, 13279, 14600]
                },
                2022: {
                    male: [27552, 26008, 25830, 26516, 27835, 28537, 27519, 25914, 25542, 24418, 24138, 24104],
                    female: [15878, 17286, 19235, 22165, 24281, 26169, 28258, 30665, 32146, 33486, 35130, 36825]
                },
                2023: {
                    male: [23208, 22886, 23305, 23459, 23368, 23317, 23575, 23205, 22217, 21392, 19008, 13708],
                    female: [38582, 40159, 38107, 36538, 35078, 32980, 29154, 26734, 24403, 21339, 18179, 15942]
                },
                2024: {
                    male: [11511, 10979, 10904, 11011, 10903, 10732, 10685, 10577, 10526, 10457, 10027, 8570],
                    female: [15442, 14368, 13188, 12188, 11152, 10114, 9076, 8038, 7000, 6643, 6286, 5929]
                }
            };

            chart2.display(year, data[year]);
        },

        display: function (year, datas) {
            Highcharts.chart('container', {
                chart: {
                    type: 'area'
                },
                title: {
                    text: year + ' 남자, 여자 매출 데이터'
                },
                xAxis: {
                    categories: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                    title: {
                        text: '월'
                    }
                },
                yAxis: {
                    title: {
                        text: '매출액'
                    }
                },
                tooltip: {
                    pointFormat: '{series.name}: <b>{point.y:,.0f}</b><br/>'
                },
                plotOptions: {
                    area: {
                        marker: {
                            enabled: false,
                            symbol: 'circle',
                            radius: 2,
                            states: {
                                hover: {
                                    enabled: true
                                }
                            }
                        }
                    }
                },
                series: [
                    {
                        name: '남자',
                        data: datas.male
                    },
                    {
                        name: '여자',
                        data: datas.female
                    }
                ]
            });
        }
    };

    $(function () {
        chart2.init();
        chart2.getdata(2024);
    });

</script>

<div class="col-sm-10">
  <h2>Chart2 Page</h2>
    <form id="yearForm" class="d-flex justify-content-between">
        <button type="button" id="btn1">2020년</button>
        <button type="button" id="btn2">2021년</button>
        <button type="button" id="btn3">2022년</button>
        <button type="button" id="btn4">2023년</button>
        <button type="button" id="btn5">2024년</button>
    </form>
    <div id = "container"></div>
</div>