// 모든값 미리 로드해놓기
// window.addEventListener('load', () => {
    // const form = document.getElementById('myForm');
    // const formData = new FormData(form);
    // const url = '/alphaknow/inventory/ajax.doSelectAll';
    
    // const xhr = new XMLHttpRequest();
    // xhr.open('GET', url);
    
    // xhr.onload = function() {
    //   if (xhr.status === 200) {
    //     const data = JSON.parse(xhr.responseText);
    //     console.log(data);
    //   } else {
    //     console.error(xhr.statusText);
    //   }
    // };
    
    // xhr.onerror = function() {
    //   console.error('네트워크 연결 오류');
    // };
    
    // xhr.send(formData);
// });


// td클릭 시 상세보기 이벤트
window.addEventListener("load", function() {
    document.querySelectorAll(".ivNow td").forEach(function(td) {
        td.addEventListener("click", function() {
            // 클릭한 물품의 시퀀스 확보
            const pdseq = td.parentNode.querySelector(".pdseq").value
            console.log(pdseq)

            // AJAX
            let url = "/alphaknow/inventoryManagement/ajax.doDetail"
            url += "?pdseq="
            url += pdseq

            const xhr = new XMLHttpRequest();
            xhr.open('GET', url);

            xhr.onload = function() {
              if (xhr.status === 200) {
                const data = JSON.parse(xhr.responseText);
                console.log("data", data);
                
                // 받아온 데이터값 활용
                // 기존 내용 삭제
                let tbody = document.querySelector(".inventory_detail_table tbody")
                let trs = tbody.querySelectorAll("tr");
                trs.forEach(function(tr) {
                    tr.remove();
                })
                // 받아온 내용 삽입
                for(let i=0; i<data.length; i++) {
                    let newTr = document.createElement("tr")
                    let newTh = document.createElement("th")
                    newTh.textContent = i+1
                    let newTd1 = document.createElement("td")
                    newTd1.textContent = data[i].PRODUCT_CODE
                    let newTd2 = document.createElement("td")
                    newTd2.textContent = data[i].PRODUCT_NAME
                    let newTd3 = document.createElement("td")
                    newTd3.textContent = data[i].LOT
                    let newTd4 = document.createElement("td")
                    newTd4.textContent = data[i].PRODUCT_AMOUNT

                    newTr.appendChild(newTh)
                    newTr.appendChild(newTd1)
                    newTr.appendChild(newTd2)
                    newTr.appendChild(newTd3)
                    newTr.appendChild(newTd4)

                    tbody.appendChild(newTr)
                }

              } else {
                console.error(xhr.statusText);
              }
            };
            
            xhr.onerror = function() {
              console.error('네트워크 연결 오류');
            };
            
            xhr.send();
        })
    })
})