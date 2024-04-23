window.addEventListener('load', function() {

	const date = new Date();

	const renderCalendar = () => {
		const viewYear = date.getFullYear();
		const viewMonth = date.getMonth();

		document.querySelector('.year_month').textContent = `${viewYear}.${viewMonth + 1}`;

		const prevLast = new Date(viewYear, viewMonth, 0);
		const thisLast = new Date(viewYear, viewMonth + 1, 0);

		const PLDate = prevLast.getDate();
		const PLDay = prevLast.getDay();

		const TLDate = thisLast.getDate();
		const TLDay = thisLast.getDay();

		const prevDates = [];
		const thisDates = [...Array(TLDate + 1).keys()].slice(1);
		const nextDates = [];

		if (PLDay !== 6) {
			for (let i = 0; i < PLDay + 1; i++) {
				prevDates.unshift(PLDate - i);
			}
		}
		for (let i = 1; i < 7 - TLDay; i++) {
			nextDates.push(i)
		}

		const dates = prevDates.concat(thisDates, nextDates);
		const firstDateIndex = dates.indexOf(1);
		const lastDateIndex = dates.lastIndexOf(TLDate);

		dates.forEach((date, i) => {
			const condition = i >= firstDateIndex && i < lastDateIndex + 1 ? 'this' : 'other';
			dates[i] = `<div class="date"><span class = ${condition} > ${date}</span></div>`;
		});

		this.document.querySelector('.dates').innerHTML = dates.join('');

		const today = new Date();

		if (viewMonth === today.getMonth() && viewYear === today.getFullYear()) {
			for (let date of document.querySelectorAll('.this')) {
				if (+date.innerText === today.getDate()) {
					date.classList.add('today');
				}
			}
		}
	}
	renderCalendar();
	document.querySelector('.arrow1').addEventListener('click', function() {
		console.log('Previous month clicked'); // 디버깅을 위한 콘솔 로그
		date.setMonth(date.getMonth() - 1);

		renderCalendar();
	});

	document.querySelector('.arrow2').addEventListener('click', function() {
		console.log('Next month clicked'); // 디버깅을 위한 콘솔 로그
		date.setMonth(date.getMonth() + 1);

		renderCalendar();
	});

	document.querySelectorAll('.date').forEach(date => {
		date.addEventListener('click', function(e) {
			const selectedDate = e.target.innerText;
			// 선택된 날짜를 입력 폼에 설정
			document.getElementById('selected-date').value = `${viewYear}-${viewMonth + 1}-${selectedDate}`;
			// 입력 폼 표시
			document.querySelector('.input-form').style.display = 'block';
		});
	});
});

window.addEventListener('load', function() {
	let formattedDateElement = document.getElementById('currentDate');
	let currentDate = new Date();

	let year = currentDate.getFullYear();
	let month = (currentDate.getMonth() + 1).toString().padStart(2, '0');
	let day = currentDate.getDate().toString().padStart(2, '0');

	let formattedDate = `${year}.${month}.${day}`;

	formattedDateElement.textContent = formattedDate;
});

window.addEventListener('load', function() {
	let ann_leave_app = document.getElementById("ann_leave_app");
	document.getElementById("ann_application").addEventListener("click", function() {
		ann_leave_app.style.display = "block";
	});

	document.getElementById("close").addEventListener("click", function() {
		ann_leave_app.style.display = "none";
	});
});