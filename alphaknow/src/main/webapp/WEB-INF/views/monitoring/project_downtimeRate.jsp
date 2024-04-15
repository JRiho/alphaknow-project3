<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
    <link rel="stylesheet" href="../css/downtimeRate.css">
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/script.js"></script>
    <script src="../js/downtimeRate.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<style>

</style>

<body>


        <div id="content">
            

            <div id="equip_downtime">

                <div id="downtime_chart">
                    <canvas id="downtime_pie" width="220" height="220"></canvas>
                </div>

                <!-- <div id="operationStats">
                    <p>가동률: <span id="operatingRate"></span></p>
                    <p>비가동률: <span id="downtimeRate"></span></p>
                    <p>총 작동시간: <span id="totalOperationTime"></span></p>
                </div>

                <div id="downtime_reason">
                    <p>준비시간 99.0%</p>
                    <p>장비고장 0.1%</p>
                    <p>청소(계획/비계획) 0.5%</p>
                    <p>이상대기 0.4%</p>
                </div> -->
            </div>
        </div>

</body>

</html>