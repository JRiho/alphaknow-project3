<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/alphaknow/resources/css/group.css">
</head>
<style>
    .menu ul li a.calendar {
        background: rgb(26, 188, 156);
        color: #fff;
        border: 0;
        cursor: pointer;
    }

    .date {
        position: relative;
        align-items: center;
        text-align: center;
        margin-top: 10px;
    }

    .date img {
        position: absolute;
    }

    .arrow1 {
        max-height: 100%; 
        transform: scaleX(-1);
        width: 30px;
        height: 30px;
        left: 40%;
        top: 20%;
    }

    .arrow2 {
        max-height: 100%; 
        width: 30px;
        height: 30px;
        right: 40%;
        top: 20%;
    }

    .cal {
        margin-top: 20px;
    }

    table {
        width: 100%;
        height: 600px;
        border-collapse: collapse;
        font-size: 14px;
    }

    tr, td {
        padding: 8px;
        vertical-align: top;
        border-bottom: 2px solid #777;
        border-top: 2px solid #777;
    }

    .save_but {
        text-decoration: none;
        margin-top: 20px;
        font-size: 20px;
        font-weight: bold;
        width: 120px;
        height: 40px;
        border: 0; 
        text-align: center; 
        line-height: 40px;
        background-color: rgb(190, 190, 190);
        color: #fff;
        border-radius: 10px;
        cursor: pointer;
    }
</style>
<body>
    <div class="side">
        <div class="side_profile">
            <img src="/alphaknow/resources/img/profile_icon.png" class="profile_img">
            <div><font size="5"><b>이민영</b></font></div>
            <div>생산1팀/매니저</div>
            <div>010-5811-9717</div>
            <div style="margin-top: 20px"><a href="../project_login.jsp" class="logout">정보수정</a></div>
        </div>
        
        <div class="vertical_line"></div>

        <div class="side_menu">
            <ul>
                <li><a class="active">일정관리</a></li>
                <li><a class="side_EDSM" href="project_EDSM.jsp">전자결재</a></li>
            </ul>
        </div>
    </div>

    <div class="main">
        <div class="menu">
            <ul>
                <li><a class="calendar">캘린더</a></li>
                <li class="att"><a href="project_attendance.jsp">근태현황</a></li>
            </ul>
        </div>

        <div class="date">
            <img src="/alphaknow/resources/img/arrow_icon.png"
            class="arrow1">
            <font size="6"><b>2024.02</b></font>
            <img src="/alphaknow/resources/img/arrow_icon.png"
            class="arrow2">
        </div>

        <div class="cal">
            <table>
                <tr height="30">
                    <td><font color="red">일</font></td> <td>월</td> <td>화</td> <td>수</td>
                    <td>목</td> <td>금</td> <td><font color="blue">토</font></td>
                </tr>
                <tr>
                    <td><font color="#999">28</font></td> <td><font color="#999">29</font></td> 
                    <td><font color="#999">30</font></td> <td><font color="#999">31</font></td>
                    <td>1</td> <td>2</td> <td><font color="blue">3</font></td>
                </tr>
                <tr>
                    <td><font color="red">4</font></td> <td>5</td> <td>6</td> <td>7</td>
                    <td>8</td> <td>9</td> <td><font color="blue">10</font></td>
                </tr>
                <tr>
                    <td><font color="red">11</font></td> <td>12</td> <td>13</td> <td>14</td>
                    <td>15</td> <td>16</td> <td><font color="blue">17</font></td>
                </tr>
                <tr>
                    <td><font color="red">18</font></td> <td>19</td> <td>20</td> <td>21</td>
                    <td>22</td> <td>23</td> <td><font color="blue">24</font></td>
                </tr>
                <tr>
                    <td><font color="red">25</font></td> <td>26</td> <td>27</td> <td>28</td>
                    <td>29</td> <td><font color="#999">1</font></td> 
                    <td><font color="#999">2</font></td>
                </tr>
            </table>
        </div>

        <div style="text-align: right;">
            <input class="save_but" type="button" value="일정저장">
        </div>
    </div> 
</body>
</html>