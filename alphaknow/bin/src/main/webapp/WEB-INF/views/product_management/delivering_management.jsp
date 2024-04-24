<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/alphaknow/resources/css/delivering_management.css" />
<script src="https://code.jquery.com/jquery-4.0.0-beta.min.js"></script>
<script src="/alphaknow/resources/js/delivering_management.js"></script>

<div class="delivering_management_header">
    출고관리
</div>
<div class="delivering_management_list_header">
    출고요청목록
</div>
<div class="delivering_management_list_container">
    <div class="delivering_management_list_buttonset">
        <div class="delivering_management_list_buttonset1">
            <div>전체</div>
            <div>출고대기</div>
            <div>출고중</div>
            <div>출고완료</div>
            <div>반려</div>
        </div>
        <div class="delivering_management_list_buttonset2">
            <button type="button">선택반려</button>
            <button type="button">선택접수</button>
        </div>
    </div>
    <div class="date_search_set">
        <input type="date"> <button type="button">조회</button>
    </div>
    <div class="delivering_management_list_table_container">
        <table border="1" class="delivering_management_list_table">
            <thead>
                <tr>
                    <th>

                    </th>
                    <th>
                        <input type="checkbox" id="selectAllRequestList">
                    </th>
                    <th>
                        출고번호
                    </th>
                    <th>
                        거래처명
                    </th>
                    <th>
                        품목명
                    </th>
                    <th>
                        상태
                    </th>
                    <th>
                        거래금액
                    </th>
                    <th>
                        신청일
                    </th>
                    <th>
                        신청자
                    </th>
                    <th>
                        접수일
                    </th>
                    <th>
                        접수자
                    </th>
                </tr>
            </thead>
            <tbody>
                <th>
                    1
                </th>
                <th>
                    <input type="checkbox" class="selectRequestList">
                </th>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
            </tbody>
        </table>
    </div>
</div>


<div class="center_line">
    <!-- 중앙구분선 -->
</div>

<div class="delivering_management_detail_header">
    상세
</div>
<div class="delivering_management_detail_table_container">
    <table border="1" class="delivering_management_detail_table">
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
                    거래처명
                </th>
                <th>
                    거래처 주소
                </th>
                <th>
                    출고전 재고
                </th>
                <th>
                    출고후 재고
                </th>
                <th>
                    출고수량
                </th>
                <th>
                    단가
                </th>
                <th>
                    총금액
                </th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>
                    1
                </th>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
                <td>

                </td>
            </tr>
        </tbody>
    </table>
</div>