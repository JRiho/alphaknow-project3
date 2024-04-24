// 출고요청목록 체크박스 이벤트
$(function () {
    // 전체선택 체크박스가 클릭되었을 때
    $("#selectAllRequestList").click(function () {
        // 전체선택 체크박스의 상태에 따라 하위 체크박스들의 상태 변경
        $(".selectRequestList").prop('checked', $(this).prop('checked'));
    });

    // 하위 체크박스 중 하나라도 변경되었을 때
    $(".selectRequestList").click(function () {
        // 전체선택 체크박스의 상태 변경
        if (!$(this).prop('checked')) {
            // 하위 체크박스 중 하나라도 해제되었을 경우 전체선택 체크박스 해제
            $("#selectAllRequestList").prop('checked', false);
        } else {
            // 모든 하위 체크박스가 선택되었을 경우 전체선택 체크박스 선택
            if ($(".selectRequestList:checked").length === $(".selectRequestList").length) {
                $("#selectAllRequestList").prop('checked', true);
            }
        }
    });
});