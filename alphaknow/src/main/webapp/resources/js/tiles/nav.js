// 게시판 li 클릭시 a링크 실행
window.addEventListener("load", ()=>{
	let boardLi = document.querySelectorAll('ul #boardLi');
	
    boardLi.forEach(function(li) {
        li.addEventListener('click', function(event) {
            var aLink = li.querySelector('a');
            if (aLink) {
                aLink.click();
            }
        });
    });
})