<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MainPage</title>
    <link rel="stylesheet" href="../css/styles.css">
    <script src="../js/script.js"></script>
</head>
<style>

</style>

<body>

    <%@ include file="../mainheader.jsp"%>

        <div id="content" style="background-color: #2b3e4f;">
            <div id="info">
                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="" id="change_img">
                        </div>
                        <div id="info_frame">
                            <div id="info_name1"></div>
                            <div id="job1"></div>
                            <div id="tool1">담당자: 직원1</div>
                            <div id="work1">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power"></div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
                <div id="right_frame">
                    <div id="graph">
                        <div id="percent">0%</div>
                        <div id="chart">
                            <div id="chart_bar">
                            </div>
                        </div>

                    </div>
                    <div id="explain">
                        <div id="percentage">가동률: 0%</div>
                        <div id="success">성공: 0</div>
                        <div id="failure">불량개수: 0</div>
                        <div id="need">필요한 개수: 500</div>
                        <div id="expect">예상시간 : 30분</div>
                    </div>
                </div>
            </div>

            <div id="equip1">
                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="../img/auto.webp" id="loader">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">PCB 로더</div>
                            <div id="job">모델명: HM-300</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power" class="P_ON"></div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>

                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="../img/solder.webp" id="solder">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">솔더 프린팅</div>
                            <div id="job">모델명: US-1113X</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power">on /off</div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="../img/spi.webp" id="spi">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">SPI (솔더 페이스트 검사기)</div>
                            <div id="job">모델명: Hmzenith</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power">on /off</div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
            </div>

            <div id="equip2">
                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="../img/mounter.webp" id="chip">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">칩 마운터</div>
                            <div id="job">모델명: HM520W HP</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power">on /off</div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="../img/reflow.webp" id="reflow">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">리플로우 솔더링</div>
                            <div id="job">모델명: 1080 mkv-e</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power">on /off</div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
                <div id="full_frame">

                    <div id="top_frame">

                        <div id="img_frame">
                            <img src="../img/aoi.webp" id="aoi">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">자동광학검사</div>
                            <div id="job">모델명: AMF1234</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>

                    <div id="bottom_frame">
                        <div id="power">on /off</div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
            </div>
            <div id="equip3">
                <div id="full_frame">
                    <div id="top_frame">
                        <div id="img_frame">
                            <img src="../img/auto.webp" id="unloader">
                        </div>
                        <div id="info_frame">
                            <div id="info_name">PCB 언로더</div>
                            <div id="job">모델명: HM-300</div>
                            <div id="tool">담당자: 직원1</div>
                            <div id="work">가동시간:</div>
                        </div>
                    </div>
                    <div id="bottom_frame">
                        <div id="power">on /off</div>
                        <div id="time">기준시간: 20H</div>
                    </div>
                </div>
                <div id="full_frame">
                    <div id="on_off_frame1">
                        <div id="f1">
                            <div id="f1_1">PCB 로더</div>
                            <div id="f1_1"><button id="PCB_ON">ON</button></div>
                            <div id="f1_1"><button id="PCB_OFF">OFF</button></div>
                        </div>
                        <div id="f2">
                            <div id="f1_1">솔더프린팅</div>
                            <div id="f1_1"><button id="on">ON</button></div>
                            <div id="f1_1"><button id="off">OFF</button></div>
                        </div>
                        <div id="f3">
                            <div id="f1_1">SPI</div>
                            <div id="f1_1"><button id="on">ON</button></div>
                            <div id="f1_1"><button id="off">OFF</button></div>
                        </div>
                    </div>
                </div>
                <div id="full_frame">
                    <div id="on_off_frame2">
                        <div id="f4">
                            <div id="f1_1">칩마운터</div>
                            <div id="f1_1"><button id="on">ON</button></div>
                            <div id="f1_1"><button id="off">OFF</button></div>
                        </div>
                        <div id="f5">
                            <div id="f1_1">리플로우 솔더링</div>
                            <div id="f1_1"><button id="on">ON</button></div>
                            <div id="f1_1"><button id="off">OFF</button></div>
                        </div>
                        <div id="f6">
                            <div id="f1_1">자동광학검사</div>
                            <div id="f1_1"><button id="on">ON</button></div>
                            <div id="f1_1"><button id="off">OFF</button></div>
                        </div>
                        <div id="f7">
                            <div id="f1_1">PCB 언로더</div>
                            <div id="f1_1"><button id="on">ON</button></div>
                            <div id="f1_1"><button id="off">OFF</button></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>