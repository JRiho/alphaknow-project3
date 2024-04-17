<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>부품정보관리</title>
    <link rel="stylesheet" href="../css/process_part.css">
   
</head>

<body>
    <%@ include file="../mainheader.jsp"%>
        <div class="day">
            <ul id="part_list">
                <!-- 항목이 여기에 동적으로 추가됩니다. -->
            </ul>
        </div>
        <script>
            let listproduce = [];
            let produce = [
                //  html 추가하기
                ["../img/cpu_pcb.png",
                    "CPU_PCB", "#"]
                , ["../img/sub_pmic.png",
                    "sub_pmic", "#"]
                , ["../img/volume_ic.png",
                    "volume_ic", "#"]
                , ["../img/modem.png",
                    "modem", "#"]
                , ["../img/audio_codec.png",
                    "audio_codec", "#"]
                , ["../img/battery_connerctor.png",
                    "battery_connerctor", "#"]
            ];
            listproduce.push(...produce);

            let list = document.querySelector("#part_list");

            listproduce.forEach(function (item) {
                let li = document.createElement('li');
                let a = document.createElement('a');
                a.href = item[2]; // 이동할 페이지의 URL
                a.innerHTML = `<img src="\${item[0]}"><br><span>\${item[1]}</span>`;
                li.appendChild(a);
                list.appendChild(li);
            });
        </script>
    </div>

</body>

</html>