window.addEventListener('load', function() {
	let popHeader = document.querySelector('.pop_header');
	let popWrap = document.querySelector('.pop_wrap');
	let isDown = false;
	let offset = {
		x : 0,
		y : 0
	};

	popHeader.addEventListener('mousedown', function(e) {
		isDown = true;
		offset = {
			x : popWrap.offsetLeft - e.clientX,
			y : popWrap.offsetTop - e.clientY
		};
		popHeader.classList.add('draggable');
	}, true);

	document.addEventListener('mouseup', function() {
		isDown = false;
		popHeader.classList.remove('draggable');
	}, true);

	document.addEventListener('mousemove', function(event) {
		event.preventDefault();
		if (isDown) {
			let moveX = event.clientX + offset.x;
			let moveY = event.clientY + offset.y;

			// 전체 화면 넘어가지 않도록 한다.
			let pageWidth = document.documentElement.clientWidth;
			let pageHeight = document.documentElement.clientHeight;
			let popupWidth = popWrap.offsetWidth;
			let popupHeight = popWrap.offsetHeight;

			if (moveX < 0)
				moveX = 0;
			if (moveY < 0)
				moveY = 0;
			if (moveX + popupWidth > pageWidth)
				moveX = pageWidth - popupWidth;
			if (moveY + popupHeight > pageHeight)
				moveY = pageHeight - popupHeight;

			popWrap.style.left = moveX + 'px';
			popWrap.style.top = moveY + 'px';
		}
	}, true);
});