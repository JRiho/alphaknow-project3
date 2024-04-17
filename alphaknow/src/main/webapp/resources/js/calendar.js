window.onload = function() {
    $(document).ready(function () {
        // 날짜 선택 상자에 옵션을 채우는 함수
        function populateSelectBoxes() {
            for (var i = new Date().getFullYear(); i >= 1900; i--) {
                $('#start-year, #end-year').append($('<option>', { value: i, text: i }));
            }
            for (var i = 1; i <= 12; i++) {
                $('#start-month, #end-month').append($('<option>', { value: i, text: i }));
            }
            for (var i = 1; i <= 31; i++) {
                $('#start-day, #end-day').append($('<option>', { value: i, text: i }));
            }
        }

        populateSelectBoxes();

        // DatePicker 초기화 및 설정
        function initDatepickers() {
            $('#hidden-start-datepicker').datepicker({
                dateFormat: "yy-mm-dd",
                onSelect: function (dateText) {
                    updateSelectBoxes(dateText, 'start');
                }
            });

            $('#hidden-end-datepicker').datepicker({
                dateFormat: "yy-mm-dd",
                onSelect: function (dateText) {
                    updateSelectBoxes(dateText, 'end');
                }
            });
        }

       
        

        // 셀렉트 박스 업데이트 함수
        function updateSelectBoxes(dateText, prefix) {
            var dateArray = dateText.split('-');
            $('#' + prefix + '-year').val(dateArray[0]);
            $('#' + prefix + '-month').val(parseInt(dateArray[1], 10)); // 월은 0 제거
            $('#' + prefix + '-day').val(parseInt(dateArray[2], 10)); // 일은 0 제거
        }

        // 달력 아이콘 클릭 이벤트 처리
        $('#start-calendar').click(function () {
            $('#hidden-start-datepicker').datepicker('show');
        });

        $('#end-calendar').click(function () {
            $('#hidden-end-datepicker').datepicker('show');
        });

        // '신청' 버튼 클릭 이벤트 처리
        // $('#submit-button').click(function () {
        //     showVacationModal();
        // });

        // // 모달 텍스트 설정 및 표시
        // function showVacationModal() {
        //     var startDate = $('#start-year').val() + '-' + $('#start-month').val() + '-' + $('#start-day').val();
        //     var endDate = $('#end-year').val() + '-' + $('#end-month').val() + '-' + $('#end-day').val();
        //     var message = startDate + ' ~ ' + endDate + '까지 휴가를 신청하시겠습니까?';
        //     alert(message);
        // }

        initDatepickers();
    });

}
