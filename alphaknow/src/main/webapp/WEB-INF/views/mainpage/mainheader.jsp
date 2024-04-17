<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>


<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <script src="${pageContext.request.contextPath}/js/script.js"></script>
</head>
<style>

</style>

<body>
    <div class="main_box">
        <div id="header">
            <ul>
                <li id="li_icon">
                    <a href="${pageContext.request.contextPath}/mainPage.jsp"><img src="${pageContext.request.contextPath}/img/logo.png" id="icon"></a>
                </li>
                <li id="li_search">
                    <div id="search">
                        <div id="search_size">
                            <input type="text" id="search_txt" value="" placeholder="검색어를 입력해 주세요">
                        </div>
                        <div id="search_img">
                            <img src="${pageContext.request.contextPath}/img/search.avif" id="search_img1">
                        </div>
                    </div>
                </li>
                <li id="li_user_name">
                   <% 
                    // 세션에서 사용자 이름 가져오기
                    String userName = (String)session.getAttribute("userName");
                    if(userName != null) {
                        out.print(userName); // 사용자 이름 출력
                    } else {
                        out.print("게스트"); // 세션이 없는 경우 게스트로 표시
                    }
                    %>
                    (<a href="${pageContext.request.contextPath}/logout.jsp">로그아웃</a>) <!-- 로그아웃 링크 -->
                </li>
            </ul>
        </div>
        <div id="menu_board">

            <div><a href="${pageContext.request.contextPath}/select">게시판</a></div>

            <div id="moniter">
                모니터링
            </div>
            <div id="standard">
                공정기준정보
            </div>
            <div id="plan">
                생산계획관리
            </div>

            <div id="performance">
                생산실적관리
            </div>
            <div id="prediction">
                예측분석관리

            </div>
            <div id="inventory">재고관리</div>
            <div id="store">
                입고관리
            </div>
        </div>
        <div id="monitering">

            <div id="moniter1"><a href="${pageContext.request.contextPath}/monitoring/monitoring_equipment.jsp">모니터링(장비)</a></div>
            <div id="moniter2"><a href="${pageContext.request.contextPath}/monitoring/project_operationRate.jsp">가동률현황</a></div>
            <div id="moniter3"><a href="${pageContext.request.contextPath}/monitoring/project_downtimeRate.jsp">비가동현황</a></div>
            <div id="moniter4"><a href="${pageContext.request.contextPath}/monitoring/monitoring_reflow.jsp">리플로우(온도)</a></div>

        </div>
        <div id="criteria">
            <div id="standard1"><a href="${pageContext.request.contextPath}/process/process_code.jsp">공정코드관리</a></div>
            <div id="standard2"><a href="${pageContext.request.contextPath}/process/process_produce.jsp">작업표준서</a></div>
            <div id="standard3"><a href="${pageContext.request.contextPath}/equipment">장비정보관리</a></div>
            <div id="standard4"><a href="${pageContext.request.contextPath}/process/process_part.jsp">부품정보관리</a></div>
        </div>
        <div id="planning">
            <div id="planning1"><a href="${pageContext.request.contextPath}/ppms">생산계획관리</a></div>
            <div id="planning3"><a href="${pageContext.request.contextPath}/productionplan/production_order_management.jsp">생산지시관리</a></div>
            <div id="planning2"><a href="${pageContext.request.contextPath}/productionplan/process_order_plan.jsp">공정지시계획</a></div>
            <div id="planning4"><a href="${pageContext.request.contextPath}/productionplan/process_order.jsp">공정지시관리</a></div>
        </div>
        <div id="performing">
            <div id="perform1"><a href="${pageContext.request.contextPath}/productionperf/production_performance_chart.jsp">생산계획대비 실적현황</a></div>
            <div id="perform2"><a href="${pageContext.request.contextPath}/productionperf/work_order_performance_chart.jsp">작업지시대비 실적현황</a></div>
            <div id="perform3"><a href="${pageContext.request.contextPath}/productionperf/equipment_production_performance_chart.jsp">장비별 생산실적현황</a></div>
        </div>
        <div id="predicting">
            <div id="predicting1"><a href="${pageContext.request.contextPath}/prediction/prediction_producting.jsp">생산량 예측분석</a></div>
            <div id="predicting2"><a href="${pageContext.request.contextPath}/prediction/prediction_quality.jsp">부품 결함예측</a></div>
            <div id="predicting3"><a href="${pageContext.request.contextPath}/prediction/prediction_quality_good.jsp">부품 품질예측</a></div>
        </div>
        <div id="invent">
            <div id="invent1"><a href="${pageContext.request.contextPath}/jaegogwanli/inventory_management.jsp">재고현황</a></div>
            <div id="invent2"><a href="${pageContext.request.contextPath}/jaegogwanli/outgoing.jsp">출하조회/입력</a></div>
            <div id="invent3"><a href="${pageContext.request.contextPath}/jaegogwanli/outgoing_directions.jsp">출하지시서 조회/입력</a></div>
        </div>
        <div id="storing">
            <div id="storing1"><a href="${pageContext.request.contextPath}/ibgogwanli/purchase.jsp">구매조회/입력</a></div>
            <div id="storing2"><a href="${pageContext.request.contextPath}/ibgogwanli/item_registration.jsp">품목별단가조회 및 변경</a></div>
            <div id="storing3"><a href="${pageContext.request.contextPath}/ibgogwanli/customerList.jsp">거래처 관리/등록</a></div>
            <div id="storing4"><a href="${pageContext.request.contextPath}/employee">사원 등록</a></div>
        </div>

        