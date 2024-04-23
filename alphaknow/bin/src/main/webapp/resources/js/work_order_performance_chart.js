 // 바 차트 수치 표기 이벤트 추가
 window.addEventListener("load", function () {

    // 라인 10개 (개당 10% 총 100%) 생성
    for (let i = 10; i >= 0; i--) {
        let div = document.createElement('div');
        document.querySelector("#chart_num").appendChild(div);

        // 라인 10개 숫자 생성
        let label = document.createElement('div');
        document.querySelector("#chart_line").appendChild(label);

        div.setAttribute("id", `line${i}`);
        div.setAttribute("class", "line");

        label.textContent = `${i * 10}%`; // 레이블 내용 설정
        label.setAttribute("class", "line_label");

    }


})












// 테이블 생성 이벤트
window.addEventListener("load", function () {
    let thead = document.querySelector("#info_table_thead");

    let rowCount1 = 1;
    let colCount1 = 7;

    for (let i = 1; i <= rowCount1; i++) {
        let tr = document.createElement('tr');
        thead.appendChild(tr);
        for (let j = 1; j <= colCount1; j++) {
            let th = document.createElement('th');
            tr.appendChild(th);
            th.setAttribute("id", `table1_1_${j}`);
        }
    }

    let tbody = document.querySelector("#info_table_tbody")

    let rowCount2 = 7;
    let colCount2 = 7;

    for (let i = 1; i <= rowCount2; i++) {
        let tr = document.createElement('tr');
        tbody.appendChild(tr);
        for (let j = 1; j <= colCount2; j++) {
            let td = document.createElement('td');
            tr.appendChild(td);
            td.setAttribute("id", `table1_${i + 1}_${j}`);
        }
    }
})

// 컬럼명
window.addEventListener("load", function () {
    document.querySelector("#table1_1_1").appendChild(document.createTextNode("기준일"))
    document.querySelector("#table1_1_2").appendChild(document.createTextNode("부서명"))
    document.querySelector("#table1_1_3").appendChild(document.createTextNode("작업명"))
    document.querySelector("#table1_1_4").appendChild(document.createTextNode("평균작업시간"))
    document.querySelector("#table1_1_5").appendChild(document.createTextNode("생산량"))
    document.querySelector("#table1_1_6").appendChild(document.createTextNode("불량률"))
    document.querySelector("#table1_1_7").appendChild(document.createTextNode("인력비용"))
})