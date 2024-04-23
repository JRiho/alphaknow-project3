<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="https://code.highcharts.com/highcharts.js"></script>
<!-- Highcharts 라이브러리 -->

</head>
<style>
#container {
	width: 400px;
	height: 330px;
}
</style>

<body>
	<div id="container"></div>

	<script>
	const chart = Highcharts.chart('container', {
	    chart: {
	        animation: false, // 애니메이션 비활성화
	        events: {
	            load: function () {
	                const series = this.series[0];
	                let second = 1;
	                const interval = setInterval(function () {
	                    if (second <= 180) {
	                        // 180초까지 250도로 올라감
	                        var temp = (250 - 50) / 180 * second + 50;
	                    } else if (second <= 240) {
	                        // 180초부터 240초까지 서서히 감소하여 100도에 도달
	                        var temp = - (150 / 60) * (second - 180) + 250;
	                    } else {
	                        clearInterval(interval);
	                    }

	                    series.addPoint([second, temp], true, false);
	                    second++;
	                }, 5000); // 5초마다 업데이트
	            }
	        }
	    },
	    title: {
	        text: '리플로우 온도 그래프'
	    },
	    xAxis: {
	        type: 'linear',
	        title: {
	            text: '시간 (초)'
	        },
	        tickInterval: 5000 // 5초 간격으로 표시
	    },
	    yAxis: {
	        title: {
	            text: '온도 (°C)'
	        },
	        min: 0,
	        max: 250,
	        tickInterval: 50,
	        labels: {
	            format: '{value:.0f}' // 소수점 없이 표시
	        }
	    },
	    plotOptions: {
	        series: {
	            dataLabels: {
	                enabled: true,
	                format: '{point.y:.0f}' // 데이터 레이블에도 소수점 없이 표시
	            }
	        }
	    },
	    tooltip: {
	        formatter: function () {
	            return '<b>' + this.series.name + '</b><br/>' +
	                '시간: ' + Highcharts.numberFormat(this.x, 0) * 5 + ' 초<br/>' +
	                '온도: ' + Highcharts.numberFormat(this.y, 2) + ' °C'; // 툴팁에도 소수점 없이 표시
	        }
	    },
	    series: [{
	        name: '온도',
	        data: [] // 초기 데이터는 비워둠
	    }]
	});
	</script>
</body>

</html>