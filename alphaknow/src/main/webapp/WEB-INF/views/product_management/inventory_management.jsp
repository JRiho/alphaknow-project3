<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="/alphaknow/resources/css/inventory_management.css" />
<script src="https://code.jquery.com/jquery-4.0.0-beta.min.js"></script>
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
                	안전재고
                </th>
                <th>
                    현재고(EA) <!-- 상세에서 모든 lot의 합계가 오도록 -->
                </th>
                <th>
                    과부족(%)
                </th>
                <th>
                    상태
                </th>
            </tr>
        </thead>
        <tbody>
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
        </tbody>
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
            </tr>
        </tbody>
    </table>
</div>