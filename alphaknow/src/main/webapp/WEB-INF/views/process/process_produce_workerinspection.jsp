<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>작업자검사</title>
    <link rel="stylesheet" href="../css/process_style.css">
    <script>
        function goBack() {
            window.history.back(); // 브라우저의 이전 페이지로 이동
        }
    </script>
</head>
<body>
    <div class="button-container">
        <button onclick="goBack()" class="change_button">뒤로 가기</button>
        </div>
    <table class="tg">
        <colgroup>
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
            <col style="width:8.3%" />
        </colgroup>
        <tr>
            <th class="tg_title" colspan="3" rowspan="2">작업표준서</th>
            <th class="tg_header" rowspan="2">품명</th>
            <th class="tg_body" colspan="2" rowspan="2"></th>
            <th class="tg_header" rowspan="2">문서번호</th>
            <th class="tg_body" colspan="2" rowspan="2"></th>
            <th class="tg_header">작성</th>
            <th class="tg_header">검토</th>
            <th class="tg_header">승인</th>
        </tr>
        <tr>
            <th class="tg_body" rowspan="3"></th>
            <th class="tg_body" rowspan="3"></th>
            <th class="tg_body" rowspan="3"></th>
        </tr>
        <tr>
            <th class="tg_header" rowspan="2">공정명</th>
            <th class="tg_body" colspan="2" rowspan="2"></th>
            <th class="tg_header" rowspan="2">품번</th>
            <th class="tg_body" colspan="2" rowspan="2"></th>
            <th class="tg_header">개정번호</th>
            <th class="tg_body" colspan="2"></th>
        </tr>
        <tr>
            <th class="tg_header">개정일자</th>
            <th class="tg_body" colspan="2"></th>
        </tr>
        <tr>
            <td class="tg_header" colspan="7">작업내용</td>
            <td class="tg_header" colspan="5">작업순서 및 주의사항</td>
        </tr>
        <tr>
            <td class="tg_img" colspan="7" rowspan="14">
            <img src="https://cdn.discordapp.com/attachments/1202457622167425074/1202457718774956063/DALLE_2024-02-01_12.36.40_-_8._Manual_Inspection__An_image_depicting_a_worker_visually_inspecting_a_PCB_for_soldering_quality_component_alignment_and_placement._The_scene_shows.png?ex=65cd8704&is=65bb1204&hm=cc3afa287fde7d2737c714e4766cccce30f35a0c1a9eba67f38dbc19ff67fc56&" 
            alt="사진임." style="width:80%;"></td>
            <td class="tg_body" colspan="5" rowspan="14">
                <p class="text_bolder_in_process">작업 순서 :</p>
                <p>1.작업자가 PCB를 시각적으로 검사하여 솔더링 상태, 부품의 정렬 및 배치 등을 확인합니다.</p>
                <p>2.필요한 경우 멀티미터나 기타 측정 도구를 사용하여 회로의 연속성, 부품의 올바른 설치, 전기적 특성 등을 검사합니다.</p>
                <p>3.모든 검사 항목이 기준에 부합하는지 체크리스트를 통해 확인합니다./p>
                <p>4.검사 중 발견된 문제점에 대해서는 즉시 수정 조치를 취하고, 필요 시 재검사를 수행합니다.</p>
                <p>5.최종 검사 결과를 기록하고, 모든 검사 항목이 통과되었음을 확인한 PCB는 제품 포장 과정으로 이동시킵니다.</p>
                <p>주의사항 : </p>
                <p>1.시각적 검사 시 누락되는 부분이 없도록 철저히 수행해야 합니다.</p>
                <p>2.전기적 특성 검사 시 안전 규정을 준수해야 합니다.</p>
            </td>
        </tr>
        <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
        <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
        <tr></tr><tr></tr><tr></tr>
        <tr>
            <td class="tg_header" colspan="9">품질분석 개선대책 준수사항</td>
            <td class="tg_header" colspan="3">불량발생시 조치 절차</td>
        </tr>
        <tr>
            <td class="tg_body">No</td>
            <td class="tg_body">발생일</td>
            <td class="tg_body">품질문제</td>
            <td class="tg_body" colspan="2">개선관리항목</td>
            <td class="tg_body">관리기준</td>
            <td class="tg_body">관리자</td>
            <td class="tg_body">기관리주기</td>
            <td class="tg_body">기록관리</td>
            <td class="tg_body" colspan="3" rowspan="3"></td>
        </tr>
        <tr>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body" colspan="2"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
        </tr>
        <tr>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body" colspan="2"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
            <td class="tg_body"></td>
        </tr>
    </table>
</body>
</html>
