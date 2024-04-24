function openPopup() {
    window.open('/alphaknow/myprofile/calendar', '프로필', 'width=950, height=750');
}

//JavaScript 함수로 드롭다운 메뉴를 토글하는 기능을 추가합니다.
function toggleDropdown(event) {
    document.getElementById("myDropdown").classList.toggle("show");
}


// 밖에 클릭하면 메뉴를 닫는 함수
window.onclick = function(event) {
  if (!event.target.matches('.profile, .profile *')) { // '.profile img' 에서 변경
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }    
	 }
 	}
 }