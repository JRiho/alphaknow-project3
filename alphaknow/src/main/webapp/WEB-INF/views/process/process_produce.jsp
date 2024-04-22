<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Process Monitoring</title>
    <link rel="stylesheet" href="/alphaknow/resources/css/process_produce.css">
</head>
<body>
    <div class="day">
        <ul id="eq_list">
            <!-- 항목이 여기에 동적으로 추가됩니다. -->
        </ul>
    </div>
    <script>
        let listproduce = [];
        let produce = [
            ["/alphaknow/resources/img/pcbloader.png", "PCB Loading", "processproduce/process_produce_pcbloading"],
            ["/alphaknow/resources/img/solder.png", "Solder Printing", "processproduce/process_produce_solderprinting"],
            ["/alphaknow/resources/img/spi.png", "SPI(납 도포도 검사기)", "processproduce/process_produce_spi"],
            ["/alphaknow/resources/img/chipmounter.png", "Chip Mounter(칩마운터)", "processproduce/process_produce_chipmounter"],
            ["/alphaknow/resources/img/reflow.png", "Reflow Soldering", "processproduce/process_produce_reflowsoldering"],
            ["/alphaknow/resources/img/aoi.png", "AOI", "processproduce/process_produce_aoi"],
            ["/alphaknow/resources/img/pcbunloader.png", "PCB Unloding", "processproduce/process_produce_pcbloading"],
            ["/alphaknow/resources/img/people.png", "작업자 검사", "processproduce/process_produce_workerinspection"]
        ];
        listproduce.push(...produce);

        let list = document.querySelector("#eq_list");

        listproduce.forEach(function (item) {
            let li = document.createElement('li');
            let a = document.createElement('a');
            a.href = item[2];
            a.innerHTML = `<img src="\${item[0]}"><br><span>\${item[1]}</span>`;
            li.appendChild(a);
            list.appendChild(li);
        });
    </script>
</body>
</html>
