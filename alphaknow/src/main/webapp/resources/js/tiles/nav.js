// li 클릭시 a링크 실행
window.addEventListener("load", ()=>{
	// 게시판
	let boardLi = document.querySelectorAll('ul #boardLi');
	
    boardLi.forEach(function(li) {
        li.addEventListener('click', function(event) {
            var aLink = li.querySelector('a');
            if (aLink) {
                aLink.click();
            }
        });
    });
    
    // 사원관리등록
    let employeeLi = document.querySelectorAll('ul #employeeLi');
	
    employeeLi.forEach(function(li) {
        li.addEventListener('click', function(event) {
            var aLink = li.querySelector('a');
            if (aLink) {
                aLink.click();
            }
        });
    });

    // 실적현황
    let chartLi = document.querySelectorAll('ul #chartLi');
	
    chartLi.forEach(function(li) {
        li.addEventListener('click', function(event) {
            var aLink = li.querySelector('a');
            if (aLink) {
                aLink.click();
            }
        });
    });
        
})