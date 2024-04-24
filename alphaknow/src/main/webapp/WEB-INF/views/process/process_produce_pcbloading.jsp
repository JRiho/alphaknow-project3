<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PCB로딩&언로딩 작업표준서</title>
    <link rel="stylesheet" href="../css/process_style.css">
</head>
<script>
    function goBack() {
        window.history.back(); // 브라우저의 이전 페이지로 이동
    }
</script>
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
            <img src="https://cdn.discordapp.com/attachments/1202457622167425074/1202457723464060988/DALLE_2024-02-01_12.36.30_-_1._PCB_Loading__An_image_showing_the_process_of_aligning_PCB_boards_and_loading_them_into_an_automatic_feeder._The_scene_includes_a_worker_placing_a_P.png?ex=65cd8705&is=65bb1205&hm=7ce4a29083c4279d12c2071151c6975db6dfbbbefc5993f77a91d4f974c3e43e&" 
            alt="사진임." style="width:45%;">
            <img src="https://cdn.discordapp.com/attachments/1202457622167425074/1202457719467147294/DALLE_2024-02-01_12.36.39_-_7._Unloading__An_image_showing_the_final_PCBs_being_moved_from_the_production_line_to_a_designated_storage_area._The_scene_includes_a_conveyor_belt_or.png?ex=65cd8704&is=65bb1204&hm=9b3370c488f362c96b664930b741c66c6c5e5bbb305bc7966398591013c0a813&" 
            alt="사진임." style="width:45%;"></td>
            <td class="tg_body" colspan="5" rowspan="14">
              <p class="text_bolder_in_process">작업 순서(PCB Loading) :</p>
              <p>1.PCB 기판을 로딩 장치에 정렬하여 놓습니다.</p>
              <p>2.자동 공급기가 PCB를 정확한 위치로 이동시킵니다.</p>
              <p>3.모든 PCB가 올바르게 위치하였는지 확인합니다.</p>
              <p>주의사항 : </p>
              <p>1.PCB 기판을 다룰 때는 정전기 방지 조치를 취해야 합니다.</p>
              <p>2.PCB가 손상되지 않도록 조심스럽게 취급해야 합니다.</p>
              <p class="text_bolder_in_process">작업 순서(PCB Unloading) :</p>
              <p>1.모든 검사와 납땜 과정이 완료된 PCB 기판을 운반 장치에 올립니다.  </p>
              <p>2.운반 장치가 PCB 기판을 지정된 적재 공간으로 자동 이동시킵니다.</p>
              <p>주의사항 : </p>
              <p>PCB 기판을 운반할 때 손상되지 않도록 주의해야 합니다.</p>
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
