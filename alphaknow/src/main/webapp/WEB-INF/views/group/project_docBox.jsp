<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/group.css">
</head>
<style>
    .menu ul li a.doc_box {
        background: rgb(26, 188, 156);
        color: #fff;
        border: 0;
        cursor: pointer;
    }

    .listDown {
        position: relative;
        align-items: center;
    }

    .listDown span {
        position: absolute;
        margin-top: 6%;
        margin-left: 1%;
    }

    #listDown_but {
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        padding: 0;
        cursor: pointer;
        background-color: white;
        border: none;
        margin-top: 5%;
        margin-left: 4%;
    }

    #listDown_but img {
        max-width: 100%;
        max-height: 100%;
    }

    .doc_opt {
        margin-top: 3%;
        margin-left: 4%;
    }

    .doc_opt button {
        font-size: 16px;
        cursor: pointer;
        background-color: white;
        border: none;
    }

    .doc_opt button:hover {
        font-weight: bold;
    }

    #approval_doc {
        width: 100%;
        margin-top: 1%;
        border-top: 2px solid #777;
        border-bottom: 2px solid #777;
        background-color: #cecece;
    }
</style>

<body>
    <div class="side">
        <div class="side_profile">
            <img src="../img/profile_icon.png" class="profile_img">
            <div>
                <font size="5"><b>이민영</b></font>
            </div>
            <div>생산1팀/매니저</div>
            <div>010-5811-9717</div>
            <div style="margin-top: 20px"><a href="../project_login.jsp" class="logout">정보수정</a></div>
        </div>

        <div class="vertical_line"></div>

        <div class="side_menu">
            <ul>
                <li><a class="side_cal" href="project_calendar.jsp">일정관리</a></li>
                <li><a class="active">전자결재</a></li>
            </ul>
        </div>
    </div>

    <div class="main">

        <div class="menu">
            <ul>
                <li><a class="ann" href="project_EDSM.jsp">연차내역/신청</a></li>
                <li><a class="doc_box" href="">결재함</a></li>
            </ul>
        </div>

        <div class="listDown">
            <button type="button" id="listDown_but">
                <img src="../img/download_icon.png">
            </button>
            <span>목록 다운로드</span>
        </div>

        <div class="doc_opt">
            <button type="button">전체</button>
            <button type="button">진행</button>
            <button type="button">완료</button>
            <button type="button">반려</button>
        </div>

        <div>
            <table id="approval_doc">
                <thead>
                    <tr>
                        <td align="center" width="5%">
                            <input type="checkbox">
                        </td>
                        <td width="15%">기안일</td>
                        <td width="15%">결재양식</td>
                        <td>제목</td>
                        <td width="5%">첨부</td>
                        <td width="10%">문서번호</td>
                        <td width="10%">결재상태</td>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>

</body>

</html>