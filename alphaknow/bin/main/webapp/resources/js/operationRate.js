//////////////////////////////
// content 영역 자바스크립트 //
/////////////////////////////

document.addEventListener('DOMContentLoaded', function () {
    var formattedDateElement = document.getElementById('currentDate');

    // 초기 월 설정
    var currentDate = new Date();
    var currentMonth = currentDate.getMonth();

    // 초기 월 표시
    updateFormattedDate(currentDate);

    // 이전 월 버튼 클릭 시
    document.getElementById('prevMonth').addEventListener('click', function () {
        currentMonth--;
        updateFormattedDate(new Date(currentDate.getFullYear(), currentMonth, 1));
    });

    // 다음 월 버튼 클릭 시
    document.getElementById('nextMonth').addEventListener('click', function () {
        currentMonth++;
        updateFormattedDate(new Date(currentDate.getFullYear(), currentMonth, 1));
    });

    function updateFormattedDate(date) {
        var year = date.getFullYear();
        var month = (date.getMonth() + 1).toString().padStart(2, '0');
        var formattedDate = `${year}.${month}`;
        formattedDateElement.textContent = formattedDate;
    }
});

document.addEventListener('DOMContentLoaded', function () {
    let option_btn1 = document.getElementById('option_btn1');
    let option_btn2 = document.getElementById('option_btn2');
    let rateTable_day = document.getElementById('rateTable_day');
    let rateChart_week = document.getElementById('rateChart_week');

    option_btn1.classList.add('active');
    option_btn2.classList.add('inactive');

    option_btn1.addEventListener('click', function () {
        if (!option_btn1.classList.contains('active')) {
            option_btn1.classList.remove('inactive');
            option_btn1.classList.add('active');
            option_btn2.classList.remove('active');
            option_btn2.classList.add('inactive');
        }

        rateTable_day.style.display = 'block';
        rateChart_week.style.display = 'none';
    });

    option_btn2.addEventListener('click', function () {
        if (!option_btn2.classList.contains('active')) {
            option_btn2.classList.remove('inactive');
            option_btn2.classList.add('active');
            option_btn1.classList.remove('active');
            option_btn1.classList.add('inactive');
        }

        rateTable_day.style.display = 'none';
        rateChart_week.style.display = 'flex';
    });
});

document.addEventListener('DOMContentLoaded', function () {
    // 현재 날짜를 가져오기
    const currentDate = new Date();

    // 현재 월의 일 수를 계산
    const currentMonth = currentDate.getMonth() + 1;
    const daysInMonth = new Date(currentDate.getFullYear(), currentMonth + 1, 0).getDate();

    // 테이블 생성
    const table = document.createElement('table');
    table.setAttribute('id', 'dayTable');

    // 일 헤더 생성
    const headerRow = table.insertRow();
    const dayHeader = headerRow.insertCell();
    dayHeader.textContent = 'Day';
    dayHeader.style.backgroundColor = '#ddd';
    dayHeader.style.position = 'sticky';
    dayHeader.style.top = '0';

    // 장비 정보 헤더 생성
    const equipmentHeaders = ['PCB 로더', '솔더 프린팅', 'SPI (솔더 페이스트 검사기)'
        , '칩 마운터', '리플로우 솔더링', '자동광학검사', 'PCB 언로더'];
    equipmentHeaders.forEach(headerText => {
        const header = headerRow.insertCell();
        header.textContent = headerText;
        header.style.backgroundColor = '#ddd';
        header.style.position = 'sticky';
        header.style.top = '0';
    });

    // 평균 열 헤더 생성
    const avgHeader = headerRow.insertCell();
    avgHeader.textContent = '평균';
    avgHeader.style.backgroundColor = '#ddd';
    avgHeader.style.position = 'sticky';
    avgHeader.style.top = '0';

    // 각 날짜에 대한 데이터 계산 및 테이블에 추가
    for (let i = 1; i <= daysInMonth; i++) {
        const row = table.insertRow();

        // 날짜 열 추가
        const dayCell = row.insertCell();
        dayCell.textContent = i + "일";

        let total = 0;

        // 각 장비 정보 열 추가
        equipmentHeaders.forEach(headerText => {
            const cell = row.insertCell();
            let randomValue;

            // 토요일 또는 일요일인 경우 0으로 설정
            if ((new Date(currentDate.getFullYear(), currentMonth, i)).getDay() === 0 ||
                (new Date(currentDate.getFullYear(), currentMonth, i)).getDay() === 6) {
                randomValue = '0%';
            } else {
                randomValue = (Math.random() * 1.9 + 98).toFixed(1) + '%';
            }

            cell.textContent = randomValue;
            total += parseFloat(randomValue);
        });

        // 평균 열 추가
        const avgCell = row.insertCell();
        const average = (total / equipmentHeaders.length).toFixed(1);
        avgCell.textContent = average + '%';
    }

    // 테이블을 body에 추가
    document.getElementById('rateTable_day').appendChild(table);
});

function getWeeksInMonth(year, month) {
    const firstDayOfMonth = new Date(year, month - 1, 1);

    // 첫째 날의 요일을 가져오기
    const firstDayOfWeek = firstDayOfMonth.getDay();

    // 첫째 주의 시작일을 계산
    let firstWeekStart = 1; // 월요일부터 시작
    if (firstDayOfWeek <= 3) { // 목요일을 포함하지 않는 경우
        firstWeekStart = 5 - firstDayOfWeek + 1;
    }

    // 해당 월의 마지막 날짜 가져오기
    const lastDayOfMonth = new Date(year, month, 0).getDate();

    // 마지막 날짜의 요일 가져오기
    const lastDayOfWeek = new Date(year, month - 1, lastDayOfMonth).getDay();

    // 마지막 주의 마지막 날짜를 계산
    let lastWeekEnd = lastDayOfMonth; // 기본적으로 마지막 날짜로 설정
    if (lastDayOfWeek >= 4) { // 목요일을 포함하는 경우
        lastWeekEnd = lastDayOfMonth - (lastDayOfWeek - 4);
    }

    // 총 주 수를 계산
    const totalWeeks = Math.ceil((lastWeekEnd - firstWeekStart + 1) / 7);

    return totalWeeks;
}

function generateRandomData(year, month) {
    const weeksInMonth = getWeeksInMonth(year, month);
    const data = [];

    for (let week = 1; week <= weeksInMonth; week++) {
        // 랜덤 데이터 생성
        const value = (Math.random() * 1.9 + 98).toFixed(1);
        data.push(value);
    }

    return data;
}

function updateChart(year, month) {
    const ctx = document.getElementById('weeklyChart').getContext('2d');
    const weeksInMonth = getWeeksInMonth(year, month);
    const weekLabels = Array.from({ length: weeksInMonth }, (_, index) => `${index + 1}주차`);

    const data = {
        labels: weekLabels,
        datasets: [
            {
                label: 'PCB 로더',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(226, 15, 0, 0.2)',
                borderColor: 'rgba(226, 15, 0, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            },
            {
                label: '솔더 프린팅',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(226, 155, 0, 0.2)',
                borderColor: 'rgba(226, 155, 0, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            },
            {
                label: 'SPI (솔더 페이스트 검사기)',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(168, 230, 0, 0.2)',
                borderColor: 'rgba(168, 230, 0, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            },
            {
                label: '칩 마운터',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(0, 216, 144, 0.2)',
                borderColor: 'rgba(0, 216, 144, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            },
            {
                label: '리플로우 솔더링',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(75, 192, 192, 0.2)',
                borderColor: 'rgba(75, 192, 192, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            },
            {
                label: '자동광학검사',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(0, 60, 255, 0.2)',
                borderColor: 'rgba(0, 60, 255, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            },
            {
                label: 'PCB 언로더',
                data: generateRandomData(year, month),
                backgroundColor: 'rgba(119, 0, 231, 0.2)',
                borderColor: 'rgba(119, 0, 231, 1)',
                borderWidth: 1,
                barPercentage: 0.8,
            }
        ]
    };

    const config = {
        type: 'bar',
        data: data,
        options: {
            responsive: false,
            maintainAspectRatio: false,
            scales: {
                y: {
                    beginAtZero: true,
                }
            },
            layout: {
            }
        }
    };
    
    if (window.myChart) {
        window.myChart.destroy();
      }

      window.myChart = new Chart(ctx, config);
};

document.addEventListener('DOMContentLoaded', function () {
    const currentDate = new Date();
    let currentYear = currentDate.getFullYear();
    let currentMonth = currentDate.getMonth() + 1;

    // 초기 차트 생성
    updateChart(currentYear, currentMonth);

    // 이전 월 버튼 클릭 시 차트 업데이트
    document.getElementById('prevMonth').addEventListener('click', function () {
        currentMonth = (currentMonth - 1 + 12) % 12;
        if (currentMonth === 0) currentMonth = 12;
        updateChart(currentYear, currentMonth);
    });

    // 다음 월 버튼 클릭 시 차트 업데이트
    document.getElementById('nextMonth').addEventListener('click', function () {
        currentMonth = (currentMonth % 12) + 1;
        updateChart(currentYear, currentMonth);
    });
});

document.addEventListener('DOMContentLoaded', function () {
    let currentMonth = new Date().getMonth() + 1; // 현재 월 초기화

    function updateTable() {
        // 이전 월 버튼 클릭 시 날짜 변경하면서 테이블변경 함수 실행
        document.getElementById('prevMonth').addEventListener('click', function () {
            currentMonth = (currentMonth - 1 + 12) % 12;
            updateTableBody();
        });

        // 다음 월도 마찬가지
        document.getElementById('nextMonth').addEventListener('click', function () {
            currentMonth = (currentMonth % 12) + 1;
            updateTableBody();
        });

        updateTableBody();
    }

    function updateTableBody() {
        // 현재 테이블 삭제
        const existingTable = document.getElementById('dayTable');
        if (existingTable) {
            existingTable.remove();
        }

        // 다시 테이블 생성
        const table = document.createElement('table');
        table.setAttribute('id', 'dayTable');

        // 헤더 생성
        const headerRow = table.createTHead().insertRow();
        const dayHeader = headerRow.insertCell();
        dayHeader.textContent = 'Day';
        dayHeader.style.backgroundColor = '#ddd';
        dayHeader.style.position = 'sticky';
        dayHeader.style.top = '0';

        // 장비 정보 헤더 생성
        const equipmentHeaders = ['PCB 로더', '솔더 프린팅', 'SPI (솔더 페이스트 검사기)', '칩 마운터', '리플로우 솔더링', '자동광학검사', 'PCB 언로더'];
        equipmentHeaders.forEach(headerText => {
            const header = headerRow.insertCell();
            header.textContent = headerText;
            header.style.backgroundColor = '#ddd';
            header.style.position = 'sticky';
            header.style.top = '0';
        });

        // 평균 열 헤더 생성
        const avgHeader = headerRow.insertCell();
        avgHeader.textContent = '평균';
        avgHeader.style.backgroundColor = '#ddd';
        avgHeader.style.position = 'sticky';
        avgHeader.style.top = '0';

        // 각 날짜에 대한 데이터 계산 및 테이블에 추가
        const daysInMonth = new Date(new Date().getFullYear(), currentMonth, 0).getDate();
        for (let i = 1; i <= daysInMonth; i++) {
            const row = table.insertRow();

            // 날짜 열 추가
            const dayCell = row.insertCell();
            dayCell.textContent = i;

            let total = 0;

            // 각 장비 정보 열 추가
            equipmentHeaders.forEach(headerText => {
                const cell = row.insertCell();
                const randomValue = (Math.random() * 1.9 + 98).toFixed(1);
                cell.textContent = randomValue;

                total += parseFloat(randomValue); // 총합 계산
            });

            // 평균 열 추가
            const avgCell = row.insertCell();
            const average = (total / equipmentHeaders.length).toFixed(1);
            avgCell.textContent = average;
        }

        // 테이블을 body에 추가
        document.getElementById('rateTable_day').appendChild(table);
    }

    // 초기 테이블 생성
    updateTable();

});