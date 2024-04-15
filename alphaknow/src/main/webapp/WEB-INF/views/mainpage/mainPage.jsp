<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/gumin.css">
    <script src="js/script.js"></script>
    <script src="js/gumin.js"></script>
     
</head>
<style>

</style>

<body>

     <%@ include file="../mainheader.jsp"%>

        <div id="content">
            <div id="content_box1">
                <div id="to_do">
                    To do List:
                    <div>
                        <ul id="task_list">
                        </ul>
                    </div>
                </div>
                <div id="plus">
                    <div><img src="img/plus.png" id="plus_img" title="내용 추가하기"></div>
                </div>

                <div id="to_do_list">

                    <div id="text">
                        <input type="textarea" id="task_input" value="">
                    </div>
                    <div id="btn">
                        <div><button type="submit" id="btn_submit">등록</button></div>
                        <div><button type="button" id="btn_cancel">취소</button></div>
                        <div><button type="button" id="btn_out">나가기</button></div>
                    </div>
                </div>
                <div id="calendar_div">
                    <div class="head">
                        <div class="year_selector">
                            <span calss="selected_year"></span>
                            <div class="year_dropdown">

                            </div>
                        </div>
                        <div class="year_month"></div>
                        <div class="nav">
                            <button class="go_prev">&lt;</button>
                            <button class="go_next">&gt;</button>
                            <button class="go_today">오늘</button>
                        </div>
                    </div>
                    <div class="main">
                        <div class="days">
                            <div class="day">일</div>
                            <div class="day">월</div>
                            <div class="day">화</div>
                            <div class="day">수</div>
                            <div class="day">목</div>
                            <div class="day">금</div>
                            <div class="day">토</div>
                        </div>
                        <div class="dates"></div>
                    </div>
                </div>
            </div>


            <div id="content_box2">
                <!-- iframe 영역 -->
                <div id="frame">
                    <iframe id="iframe" src="monitoring/reflow_iframe.jsp" frameborder=0 framespacing=0
                        marginheight=0 marginwidth=0 scrolling=no vspace=0>
                        1
                    </iframe>
                </div>
                <div id="frame">
                    <iframe id="iframe" src="monitoring/project_downtimeRate.jsp" frameborder=0 framespacing=0 marginheight=0 marginwidth=0
                        scrolling=no vspace=0>

                    </iframe>
                </div>
            </div>
        </div>
    </div>
</body>

</html>