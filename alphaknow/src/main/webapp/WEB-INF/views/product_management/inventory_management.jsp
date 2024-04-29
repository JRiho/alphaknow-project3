<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/alphaknow/resources/css/inventory_management.css" />
<script src="/alphaknow/resources/js/inventory_management.js"></script>

<div class="inventory_management_header">
    재고관리
</div>
<div class="inventory_management_list_header">
    보유재고현황
</div>
<div class="search_buttonset">
    <div>
        <input type="date"> ~ <input type="date">
    </div>
    <div class="search_buttonset2">
        <input type="text">
        <button type="button">검색</button>
    </div>
</div>

<!-- 모든 정보 로드 -->
<div>
	<c:forEach var="list" items="${ list }">
		<input type="hidden" 
		data-ivseq="${ list.INVENTORY_SEQ }" 
		data-pdseq="${ list.PRODUCT_SEQ }" 
		data-pdamount="${ list.PRODUCT_AMOUNT }"
		data-lot="${ list.LOT }"
		data-pdtype="${ list.PRODUCT_TYPE }"
		data-pdcode="${ list.PRODUCT_CODE }"
		data-pdname="${ list.PRODUCT_NAME }">
	</c:forEach>
</div>

<div class="inventory_list_table_container">
    <table border="1" class="inventory_list_table">
        <thead>
            <tr>
                <th>
                    
                </th>
                <th>
                    품목코드
                </th>
                <th>
                    품목타입
                </th>
                <th>
                    품목명
                </th>
                <th>
                    현재고(EA) <!-- 상세에서 모든 lot의 합계가 오도록 -->
                </th>
            </tr>
        </thead>
        <c:if test="${ not empty list2 }">
        	<c:forEach var="list" items="${ list2 }" varStatus="status">
		        <tbody class="ivNow">
		            <th>
		                ${ status.count }
		            </th>
		            <input type="hidden" 
		            value="${ list.PRODUCT_SEQ }"
		            class="pdseq">
		            <td>
		                ${ list.PRODUCT_CODE }
		            </td>
		            <td>
		                ${ list.PRODUCT_TYPE }
		            </td>
		            <td>
		                ${ list.PRODUCT_NAME }
		            </td>
		            <td>
		                ${ list.PRODUCT_AMOUNT }
		            </td>
		        </tbody>
	        </c:forEach>
        </c:if>
        <c:if test="${ empty list2 }">
        	<tbody>
        		<tr>
        			<th colspan="5">
        				보유재고가 없습니다.
        			</th>
        		</tr>
        	</tbody>
        </c:if>
    </table>
</div>


<div class="center_line">
    <!-- 중앙구분선 -->
</div>

<div class="inventory_management_detail_header">
    상세
</div>
<div class="inventory_detail_table_container">
    <table border="1" class="inventory_detail_table">
        <thead>
            <tr>
                <th>
                    
                </th>
                <th>
                    품목코드
                </th>
                <th>
                    품목명
                </th>
                <th>
                    LOT
                </th>
                <th>
                    현재고(EA)
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
				<th colspan="5">표기할 품목을 선택하세요.</th>
            </tr>
        </tbody>
    </table>
</div>