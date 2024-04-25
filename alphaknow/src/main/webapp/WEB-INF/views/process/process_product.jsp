<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/alphaknow/resources/css/process_product.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<body>
	<div id="process_code">
		<div class="top_section">
			<div class="title_select_container">
				<h1>부품 목록</h1>
			</div>
			<div id="process_code_button">
				<button type="button" class="change_button" id="new_process_button">추가</button>
				<button type="button" class="edit_button change_button"
					data-id="${process.sequenceNo}">수정</button>
				<button type="button"  class="change_button" onclick="deleteSelectedProcess();">삭제</button>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div id="main_content">
		<table id="process_board1">
			<!-- 테이블 너비 조절 -->
			<colgroup>
				<col style="width: 8%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>코 드</th>
					<th>이 름</th>
					<th>가 격</th>
					<th>타 입</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach var="component" items="${components}">
		            <tr>
		            	<th><input 
                                type="checkbox" 
                                name="selectedProduct"
                                value="${component.product_seq}"
                                data-id="${component.product_seq}"
                                data-name="${component.product_name}"></th>
                        <td>${component.product_code}</td>
                        <td>${component.product_name}</td>
                        <td>${component.product_price}</td>
                        <td>${component.product_type}</td>
		            </tr>
       			</c:forEach>
			</tbody>
		</table>
	</div>
	<div id="process_code">
		<div class="top_section">
			<div class="title_select_container">
				<h1>완제품 목록</h1>
			</div>
			<div id="process_code_button">
				<button type="button" id="print_bom_button" class="change_button bom_button">BOM 출력</button>
				<button type="button" class="change_button" id="new_process_button">추가</button>
				<button type="button" class="edit_button change_button"
					data-id="${process.sequenceNo}">수정</button>
				<button type="button" class="change_button" onclick="deleteSelectedProcess();">삭제</button>
			</div>
		</div>
	</div>
	<div id="main_content">
	<table id="process_board2">
			<!-- 테이블 너비 조절 -->
			<colgroup>
				<col style="width: 8%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
				<col style="width: 23%" />
			</colgroup>
			<thead>
				<tr>
					<th></th>
					<th>코 드</th>
					<th>이 름</th>
					<th>가 격</th>
					<th>타 입</th>
				</tr>
			</thead>

			<tbody>
				 <c:forEach var="finishedProduct" items="${finishedProducts}">
		            <tr>
		            	<th><input 
                    			type="checkbox" 
                    			name="selectedProduct"
                    	 		value="${finishedProduct.product_seq}"
                    	 		data-id="${finishedProduct.product_seq}"></th>
		                <td>${finishedProduct.product_code}</td>
		                <td>${finishedProduct.product_name}</td>
		                <td>${finishedProduct.product_price}</td>
		                <td>${finishedProduct.product_type}</td>
		            </tr>
		        </c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 공정 신규등록 및 수정 팝업 div -->
	<div id="process_new_register" style="display:none;">
        <div id="process_title">공정명 등록/수정</div>
        <div id="table_wrap">
            <form action="/alphaknow/processcode" method="post">
            	<input type="hidden" name="action" id="form_action" value="add"> 
            	<input type="hidden" name="sequenceNo"> 
                <table id="new_process">
                    <colgroup>
                        <col style="width: 30%" />
                        <col style="width: 70%" />
                    </colgroup>
                    <tr>
                        <td>코드</td>
                        <td><input type="text" class="text" name="code" placeholder="진행코드"></td>
                    </tr>
                    <tr>
                        <td>에러코드</td>
                        <td><input type="text" class="text" name="errorCode" placeholder="에러코드"></td>
                    </tr>
                    <tr>
                        <td>공정약칭</td>
                        <td><input type="text" class="text" name="processAbbreviation" placeholder="공정약칭"></td>
                    </tr>
                    <tr>
                        <td>공정별칭</td>
                        <td><input type="text" class="text" name="processAlias" placeholder="공정별칭"></td>
                    </tr>
                    <tr>
                        <td>공정구분</td>
                        <td><input type="text" class="text" name="processType" placeholder="공정구분"></td>
                    </tr>
                    <tr>
                        <td>기준</td>
                        <td><input type="text" class="text" name="standard" placeholder="기준"></td>
                    </tr>
                    <tr>
                        <td>ST</td>
                        <td><input type="text" class="text" name="standardWorkingTime" placeholder="표준작업시간을 입력"></td>
                    </tr>
                    <tr>
                        <td>가성불량경고</td>
                        <td><input type="text" class="text" name="fakeFaultWarning"></td>
                    </tr>
                    <tr>
                        <td>진성불량경고</td>
                        <td><input type="text" class="text" name="genuineFaultWarning"></td>
                    </tr>
                    <tr>
                        <td>반복</td>
                        <td><input type="text" class="text" name="repeatable"></td>
                    </tr>
                </table>
                <div id="setting_button">
                    <button type="submit" class="change_button" id="save_button">저장</button>
                    <button type="button" class="button_basic" id="close">닫기</button>
                </div>
            </form>
        </div>
    </div>
    <script>
    $(document).ready(function() {
        $(".change_button").click(function() {
            var selectedProducts = [];
            $('input[name="selectedProduct"]:checked').each(function() {
                selectedProducts.push($(this).val());
            });

            if (selectedProducts.length > 0) {
                // 서버에서 BOM 데이터를 HTML 테이블 형식으로 요청
                $.ajax({
                    url: '/alphaknow/bom/details',
                    type: 'GET',
                    data: { product_seq: selectedProducts.join(',') },
                    success: function(data) {
                        // 서버로부터 받은 HTML 데이터를 QR 코드 생성 API로 전송
                        var url = "/alphaknow/generateQR?data=" + encodeURIComponent(selectedProducts.join(','));
                        var features = "toolbar=no,menubar=no,scrollbars=yes,resizable=yes,width=800,height=600";
                        var newWin = window.open(url, "WindowForm", features);

                        // QR 코드 생성 요청
                        $.ajax({
                            url: url,
                            type: 'GET',
                            success: function(imagePath) {
                                var html = "<html><head><title>BOM 정보</title></head><body>";
                                html += "<h1>BOM 정보</h1>";
                                html += "<img src='" + imagePath + "' alt='QR Code' style='display:block; margin-bottom:20px;'>";
                                html += data; // 서버에서 받은 HTML 테이블
                                html += "<button onclick='window.close();'>Close</button>";
                                html += "</body></html>";

                                newWin.document.write(html);
                                newWin.document.close();
                            },
                            error: function(xhr, status, error) {
                                console.error('QR 또 너야?!:', error);
                            }
                        });
                    },
                    error: function(xhr, status, error) {
                        alert("좀 고쳐저라 BOM: " + error);
                    }
                });
            } else {
                alert("접어라~");
            }
        });
    });

	</script>
    
	<script src="/alphaknow/resources/js/processcode_popup.js"></script>
</body>