<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <title>BOM Details</title>
</head>
<body>
    <!-- 데이터 표시를 위한 테이블 -->
    <table border="1">
        <tr>
            <th>Item ID</th>
            <th>BOM ID</th>
            <th>Product Seq</th>
            <th>Quantity</th>
            <th>Unit</th>
        </tr>
        <c:forEach var="item" items="${bomItems}">
            <tr>
                <td><c:out value="${item.item_id}"/></td>
                <td><c:out value="${item.bom_id}"/></td>
                <td><c:out value="${item.product_seq}"/></td>
                <td><c:out value="${item.quantity}"/></td>
                <td><c:out value="${item.unit}"/></td>
            </tr>
        </c:forEach>
    </table>

<!--     QR 코드 이미지 표시 -->
<!--     <div> -->
<!--         <h2>QR Code:</h2> -->
<!--         <img src="${qrCodeUrl}" alt="QR Code for BOM Details"/> -->
<!--     </div> -->
</body>
</html>
