// 팝업 요소 선택
		var dragPopup = document.getElementById("process_new_register");

		// 드래그 시작 시 좌표와 팝업의 원래 위치
		var startX, startY, originalX, originalY;

		// 드래그 시작 함수
		function dragStart(e) {
			// 드래그 시작 위치 설정
			startX = e.clientX;
			startY = e.clientY;

			// 팝업의 원래 위치 가져오기
			originalX = dragPopup.offsetLeft;
			originalY = dragPopup.offsetTop;

			// 이동 이벤트와 종료 이벤트 등록
			document.addEventListener('mousemove', dragMove);
			document.addEventListener('mouseup', dragEnd);
		}

		// 드래그 이동 함수
		function dragMove(e) {
			// 이동한 거리 계산
			var moveX = e.clientX - startX;
			var moveY = e.clientY - startY;

			// 팝업의 새 위치 설정
			dragPopup.style.left = originalX + moveX + 'px';
			dragPopup.style.top = originalY + moveY + 'px';
		}

		// 드래그 종료 함수
		function dragEnd() {
			// 이벤트 리스너 제거
			document.removeEventListener('mousemove', dragMove);
			document.removeEventListener('mouseup', dragEnd);
		}

		// 팝업에 드래그 시작 이벤트 리스너 추가
		dragPopup.addEventListener('mousedown', dragStart);
	