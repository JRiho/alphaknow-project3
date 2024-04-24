// 실행문
makeMenu("공정지시계획<br>&nbsp&nbsp&nbsp불러오기", "get_plan");
makeMenu("작업가능여부<br>&nbsp&nbsp&nbsp최종확인", "get_plan");
makeMenu("공정지시<br>코드부여", "get_plan");
makeMenu("지시서<br>내보내기", "get_plan");

makeTable(1, "#order_table_thead", 1, 4, "#order_table_tbody", 20);
makeColName(1);
checkEvent(1);

// 메뉴 만들기
function makeMenu(menuName, menuId) {
    let orderMenu = document.querySelector("#order_menu");

    let div = document.createElement("div");
    div.setAttribute("id", menuId);

    orderMenu.appendChild(div).innerHTML = menuName;
}



// 테이블 생성
function makeTable(tableNum, theadId, x1, y, tbodyId, x2) {
    let thead = document.querySelector(theadId);

    for (let i = 1; i <= x1; i++) {
        let tr = document.createElement('tr');
        thead.appendChild(tr);
        for (let j = 1; j <= y; j++) {
            let th = document.createElement('th');
            tr.appendChild(th);
            th.setAttribute("id", `thead${tableNum}_${i}_${j}`);
        }
    }

    let tbody = document.querySelector(tbodyId)

    for (let i = 1; i <= x2; i++) {
        let tr = document.createElement('tr');
        tbody.appendChild(tr);
        for (let j = 1; j <= y; j++) {
            let td = document.createElement('td');
            tr.appendChild(td);
            td.setAttribute("id", `tbody${tableNum}_${i}_${j}`);
        }
    }

    // 체크박스 생성
    for (let i = 1; i <= x2; i++) {
        let checkbox = document.createElement("input");
        checkbox.type = "checkbox";
        checkbox.classList.add("table1_chkChild");

        document.querySelector("#tbody1_" + i + "_1").appendChild(checkbox);
        // 체크박스 중앙정렬
        document.querySelector("#tbody1_" + i + "_1").style.cssText = "text-align: center";
    }

}

// 컬럼명 생성
function makeColName(tableNum) {
    let checkbox = document.createElement("input");
    checkbox.type = "checkbox";
    checkbox.classList.add("table1_chkAll")
    document.querySelector(`#thead${tableNum}_1_1`).appendChild(checkbox);
    document.querySelector(`#thead${tableNum}_1_2`).appendChild(document.createTextNode("공정지시코드"))
    document.querySelector(`#thead${tableNum}_1_3`).appendChild(document.createTextNode("공정지시계획코드"))
    document.querySelector(`#thead${tableNum}_1_4`).appendChild(document.createTextNode("작업가능여부"))

}

// 전체선택 이벤트
function checkEvent(tableNum) {

    document.querySelector(`.table${tableNum}_chkAll`).addEventListener("click", function (e) {
        if (document.querySelector(`.table${tableNum}_chkAll`).checked == true) {
            document.querySelectorAll(`.table${tableNum}_chkChild`).forEach(function (chkChild) {
                chkChild.checked = true;
            })
        } else {
            document.querySelectorAll(`.table${tableNum}_chkChild`).forEach(function (chkChild) {
                chkChild.checked = false;
            })
        }
    })

    let checkboxes = document.querySelectorAll(`.table${tableNum}_chkChild`);

    checkboxes.forEach(function (checkbox) {
        checkbox.addEventListener("click", function (e) {
            let allbox = checkboxes.length;
            let nowbox = 0;

            checkboxes.forEach(function (checkbox) {
                if (checkbox.checked) {
                    nowbox++;
                }
            });

            if (allbox === nowbox) {
                document.querySelector(`.table${tableNum}_chkAll`).checked = true;
            } else {
                document.querySelector(`.table${tableNum}_chkAll`).checked = false;
            }
        });
    });

}