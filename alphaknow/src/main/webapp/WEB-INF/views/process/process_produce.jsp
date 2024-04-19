<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <link rel="stylesheet" href="/alphaknow/resources/css/process_produce.css">


        <div class="day">
            <ul id="eq_list">
                <!-- 항목이 여기에 동적으로 추가됩니다. -->
            </ul>
        </div>
    <script>
        let listproduce = [];
        let produce = [
            //  html 추가하기
            ["/alphaknow/resources/img/pcbloader.png",
                "PCB Loading", "process_produce_pcbloading.html"]
            , ["/alphaknow/resources/img/solder.png",
                "Solder Printing", "process_produce_solderprinting.html"]
            , ["/alphaknow/resources/img/spi.png",
                "SPI(납 도포도 검사기)", "process_produce_spi.html"]
            , ["/alphaknow/resources/img/chipmounter.png",
                "Chip Mounter(칩마운터)", "process_produce_chipmounter.html"]
            , ["/alphaknow/resources/img/reflow.png",
                "Reflow Soldering", "process_produce_reflowsoldering.html"]
            , ["/alphaknow/resources/img/aoi.png",
                "AOI", "process_produce_aoi.html"]
            , ["/alphaknow/resources/img/pcbunloader.png",
                "PCB Unloding", "process_produce_pcbloading.html"]
            , ["/alphaknow/resources/img/people.png",
                "작업자 검사", "process_produce_workerinspection.html"]
        ];
        listproduce.push(...produce); 

        let list = document.querySelector("#eq_list");

        listproduce.forEach(function (item) {
        	console.log("check");
            let li = document.createElement('li');
            let a = document.createElement('a');
            a.href = item[2]; // 이동할 페이지의 URL
            a.innerHTML = `<img src="\${item[0]}"><br><span>\${item[1]}</span>`;
            li.appendChild(a);
            list.appendChild(li);
        });
    </script>

