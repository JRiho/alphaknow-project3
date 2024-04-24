<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/alphaknow/resources/css/group.css">
    <link rel="stylesheet" href="/alphaknow/resources/css/annual_popup.css">
    <script src="/alphaknow/resources/js/EDSM.js"></script>

</head>

<style>
    .menu ul li a.ann {
        background: rgb(26, 188, 156);
        color: #fff;
        border: 0;
        cursor: pointer;
    }

    .year_month {
		text-align: center;
        font-size: 32px;
        font-weight: bold;
        margin-top: 10px;
	}

    .info {
        position: relative;
        width: 94%;
        height: 100px;
        border: 2px solid #b9b9b9;
        margin-left: 30px;
        margin-top: 30px;
        border-radius: 10px;
    }

    .info img {
        position: absolute;
        width: 50px;
        height: 50px;
        margin-top: 20px;
        margin-left: 30px;
    }

    .info span {
        position: absolute;
        margin-top: 4%;
        margin-left: 12%;
        font-size: 18px;
    }
    
    .info p {
        font-size: 35px;
        color: rgb(26, 188, 156);
        margin-top: 10px;
    }

    .line1 {
        position: absolute;
        height: 100%;
        top: 0;
        left: 30%;
        border-right: 2px solid #b9b9b9;
    }

    .total_ann,
    .used_ann,
    .left_ann {
        position: absolute;
        width: 10%;
        text-align: center;
        margin-top: 13px;
    }

    .total_ann {
        margin-left: 40%;
    }

    .used_ann {
        margin-left: 60%;
    }

    .left_ann {
        margin-left: 80%;
    }

    .line2 {
        position: absolute;
        height: 70%;
        top: 15%;
        left: 54%;
        border-right: 2px solid #b9b9b9;
    }

    .line3 {
        position: absolute;
        height: 70%;
        top: 15%;
        left: 75%;
        border-right: 2px solid #b9b9b9;
    }

    .ann_date {
        width: 80%;
        margin: 3%;
    }

    .ann_date p {
        font-size: 20px;
        color: #777;
    }

    .ann_date input {
        width: 120px;
        height: 22px;
    }

    .his {
        margin: 3%;
    }

    .used_his table {
        width: 100%;
        height: 150px;
        text-align: center;
        border-top: 2px solid #777;
        border-bottom: 2px solid #777;
        border-collapse: separate;
        border-spacing: 0;
    }

    .used_his th {
        border-bottom: 2px solid #777;
    }

    .his2 {
        margin: 3%;
    }

    .create_his table {
        width: 100%;
        height: 100px;
        text-align: center;
        border-top: 2px solid #777;
        border-bottom: 2px solid #777;
        border-collapse: separate;
        border-spacing: 0;
    }

    .create_his th {
        border-bottom: 2px solid #777;
    }
    
    button {
        width: 80px;
        height: 30px;
        border: 0;
        background-color: #1abd9c;
        color: white;
        border-radius: 10px;
        cursor: pointer;
    }

    button:hover {
        background-color: #15a084;
    }
</style>

<body>
    <div class="side">
        <div class="side_profile">
            <img src="/alphaknow/resources/img/profile_icon.png" class="profile_img">
            <div>
				<font size="5">
					<b>
						<%
							String userName = (String)session.getAttribute("userName");
							if(userName != null) {
		                        out.println(userName); // 사용자 이름 출력
		                    }
						%>
					</b>
				</font>
			</div>
			<div>
				<%
					String department = (String)session.getAttribute("department");
					String jobgrade = (String)session.getAttribute("jobgrade");
					if(department != null && jobgrade != null) {
		            	out.println(department+"팀/"+jobgrade); // 사용자 부서/직급 출력
		            }
				%>
			</div>
			<div>
				<%
					String phone = (String)session.getAttribute("phone");
					if(phone != null) {
		            	out.println(phone); // 사용자 휴대폰번호 출력
		            }
				%>		
			</div>
            <div style="margin-top: 20px"><a href="" class="logout">정보수정</a></div>
        </div>

        <div class="vertical_line"></div>

        <div class="side_menu">
            <ul>
                <li><a class="side_cal" href="/alphaknow/myprofile/calendar">일정관리</a></li>
                <li><a class="active">전자결재</a></li>
            </ul>
        </div>
    </div>

    <div class="main">

        <div class="menu">
            <ul>
                <li><a class="ann" href="/alphaknow/myprofile/EDSM">연차내역/신청</a></li>
                <li><a class="doc_box" href="/alphaknow/myprofile/docBox">결재함</a></li>
            </ul>
        </div>

        <div class="year_month"></div>

        <div style="float: right; margin-right: 30px;">
            <button type="button" id="ann_application">연차신청</button>
        </div>

        <div class="info">
            <div>
                <img src="/alphaknow/resources/img/profile_icon2.png">
                <span>이민영 매니저</span>
            </div>

            <div class="line1"></div>

            <div class="total_ann">
                <b>총 연차</b>
                <p>16</p>
            </div>

            <div class="line2"></div>

            <div class="used_ann">
                <b>사용 연차</b>
                <p>3.5</p>
            </div>

            <div class="line3"></div>

            <div class="left_ann">
                <b>잔여 연차</b>
                <p>12.5</p>
            </div>
        </div>

        <div class="ann_date">
            <p>연차 사용기간: <input type="text" id="datepicker">
                ~ <input type="text" id="datepicker1"></p>
        </div>

        <div class="his">
            <h2>사용 내역</h>
        </div>

        <div class="used_his">
            <table>
                <tr>
                    <th width="12%">이름</th>
                    <th width="12%">부서명</th>
                    <th width="12%">휴가종류</th>
                    <th width="40%">사용기간</th>
                    <th width="12%">사용 연차</th>
                    <th width="12%">내용</th>
                </tr>
                <tr>
                    <td>이민영</td>
                    <td>생산팀</td>
                    <td>연차</td>
                    <td>2023-10-18 ~ 2023-10-18</td>
                    <td>1</td>
                    <td>개인사정</td>
                </tr>
                <tr>
                    <td>이민영</td>
                    <td>생산팀</td>
                    <td>연차</td>
                    <td>2023-12-26 ~ 2023-12-27</td>
                    <td>2</td>
                    <td>개인사정</td>
                </tr>
            </table>
        </div>

        <div class="his2">
            <h2>생성 내역</h>
        </div>

        <div class="create_his">
            <table>
                <tr>
                    <th width="25%">등록일</th>
                    <th width="25%">사용기간</th>
                    <th width="25%">발생일수</th>
                    <th width="25%">내용</th>
                </tr>
                <tr>
                    <td>2023-10-01</td>
                    <td>2024-01-01</td>
                    <td>16</td>
                    <td></td>
                </tr>
            </table>
        </div>

    </div>

    <div id="ann_leave_app">
        <div id="head">
            <h2 style="position: relative;">연차신청서</h2>

            <div>
                <button type="button" id="close">
                    <img src="/alphaknow/resources/img/close_icon.png" style="width: 50px; height: 50px;">
                </button>
            </div>
        </div>

        <div>
            <table class="table1" border="1px solid">
                <tr>
                    <th>기안자</th>
                    <td width="70%">
                        <input type="text" id="ann_name">
                    </td>
                </tr>
                <tr>
                    <th>기안부서</th>
                    <td><input type="text" id="ann_dept"></td>
                </tr>
                <tr>
                    <th>기안일</th>
                    <td><input type="text" id="ann_date"></td>
                </tr>
                <tr>
                    <th>문서번호</th>
                    <td><input type="text" id="ann_docu"></td>
                </tr>
            </table>
        </div>

        <div class="top">
            <table class="table2" border="1px solid">
                <tr>
                    <th rowspan="3" width="30px">승인</th>
                    <td></td>
                    <td></td>
                </tr>
                <tr height="60%">
                    <td width="42%">김팀장</td>
                    <td>관리자</td>
                </tr>
                <tr height="20%">
                    <td></td>
                    <td></td>
                </tr>
            </table>

            <table class="table3" border="1px solid">
                <tr>
                    <th rowspan="3" width="30px">신청</th>
                    <td></td>
                </tr>
                <tr height="60%">
                    <td>
                        <img src="/alphaknow/resources/img/approved_icon.png" style="width: 80px; height: 70px;">
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
            </table>
        </div>

        <div>
            <table class="table4" border="1px solid">
                <tr>
                    <th width="15%">휴가 종류</th>
                    <td><input type="text" id="ann_docu"></td>
                </tr>
                <tr>
                    <th>기간 및 일시</th>
                    <td><input type="text" id="ann_term"></td>
                </tr>
                <tr height="15%">
                    <th>반차 여부</th>
                    <td>
                        <input type="checkbox" value="시작일">시작일 (
                        <input type="checkbox" value="오전">오전
                        <input type="checkbox" value="오후">오후 )<br>
                        <input type="checkbox" value="종료일">종료일 (
                        <input type="checkbox" value="오전">오전
                        <input type="checkbox" value="오후">오후 )
                    </td>
                </tr>
                <tr>
                    <th>연차 일수</th>
                    <td><input type="text" id="ann_days"></td>
                </tr>
                <tr height="30%">
                    <th>휴가 사유</th>
                    <td>
                        <textarea id="ann_reason"></textarea>
                    </td>
                </tr>
                <tr height="30%">
                    <th colspan="2" style="text-align: left;">
                        <p style="margin-left: 7%;">
                            <font size="2">1. 연차의 사용은 근로기준법에 따라 전년도에 발생한 개인별 잔여
                                연차에 한하여 사용함을 원칙으로 한다. 단, 최초 입사시에는 근로 기준법<br>
                                에 따라 발생 예정된 연차를 차용하여 월 1회 사용할 수 있다.<br>
                                2. 경조사 휴가는 행사일을 증명할 수 있는 가족 관계 증명서 또는 등본, 청첩장 등 제출<br>
                                3. 공가(예비군/민방위)는 사전에 통지서를, 사후에 참석증을 반드시 제출</font>
                        </p>
                    </th>
                </tr>
            </table>
        </div>

        <div>
            <button type="button" id="save">신청하기</button>
        </div>
    </div>

</body>

</html>