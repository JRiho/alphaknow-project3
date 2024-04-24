/////////////////////////////공동 javascript /////////////////////////////////////////////////////

window.addEventListener('load', function () {
    let moniter = document.querySelector('#moniter');
    let monitering = document.querySelector('#monitering');

    let standard = document.querySelector('#standard');
    let criteria = document.querySelector('#criteria');

    let plan = document.querySelector('#plan');
    let planning = document.querySelector('#planning');

    let performance = document.querySelector('#performance');
    let performing = document.querySelector('#performing');

    let prediction = document.querySelector('#prediction');
    let predicting = document.querySelector('#predicting');

    let inventory = document.querySelector('#inventory');
    let invent = document.querySelector('#invent');

    let store = document.querySelector('#store');
    let storing = document.querySelector('#storing');


    document.querySelector('#moniter').addEventListener('mouseenter', function () {
        moniter.style.fontWeight = "bold";
        monitering.style.display = "flex";

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#monitering').addEventListener('mouseleave', function () {
        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';
    })
    document.querySelector('#standard').addEventListener('mouseenter', function () {
        standard.style.fontWeight = "bold";
        criteria.style.display = "flex";

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#criteria').addEventListener('mouseleave', function () {
        standard.style.fontWeight = "400";
        criteria.style.display = 'none';
    })
    document.querySelector('#plan').addEventListener('mouseenter', function () {
        plan.style.fontWeight = "bold";
        planning.style.display = "flex";

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#planning').addEventListener('mouseleave', function () {
        plan.style.fontWeight = "400";
        planning.style.display = 'none';
    })
    document.querySelector('#performance').addEventListener('mouseenter', function () {
        performance.style.fontWeight = "bold";
        performing.style.display = "flex";

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#performing').addEventListener('mouseleave', function () {
        performance.style.fontWeight = "400";
        performing.style.display = 'none';
    })
    document.querySelector('#prediction').addEventListener('mouseenter', function () {
        prediction.style.fontWeight = "bold";
        predicting.style.display = "flex";

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#predicting').addEventListener('mouseleave', function () {
        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';
    })
    document.querySelector('#inventory').addEventListener('mouseenter', function () {
        inventory.style.fontWeight = "bold";
        invent.style.display = "flex";

        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#invent').addEventListener('mouseleave', function () {
        inventory.style.fontWeight = "400";
        invent.style.display = 'none';
    })
    document.querySelector('#store').addEventListener('mouseenter', function () {
        store.style.fontWeight = "bold";
        storing.style.display = "flex";

        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';
    })
    document.querySelector('#storing').addEventListener('mouseleave', function () {
        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
    document.querySelector('#header').addEventListener('mouseenter', function () {
        prediction.style.fontWeight = "400";
        predicting.style.display = 'none';

        moniter.style.fontWeight = "400";
        monitering.style.display = 'none';

        criteria.style.display = 'none';
        standard.style.fontWeight = "400";

        plan.style.fontWeight = "400";
        planning.style.display = 'none';

        performance.style.fontWeight = "400";
        performing.style.display = 'none';

        inventory.style.fontWeight = "400";
        invent.style.display = 'none';

        store.style.fontWeight = "400";
        storing.style.display = 'none';
    })
})
/////////////////////////////공동 javascript 끝/////////////////////////////////////////////////////


/////////////////////////////메인페이지 시작///////////////////////////////////////////////////////////
window.addEventListener('load', function () {
    document.querySelector('#plus_img').addEventListener('click', function () {
        document.querySelector('#to_do_list').style.display = 'block';
        document.querySelector('#to_do').style.opacity = '0.3';
        document.querySelector('#plus').style.opacity = '0.3';
        document.querySelector('#frame').style.opacity = '0.3';
        document.querySelector('#calendar_div').style.opacity = '0.3';

    })

    document.querySelector('#btn_cancel').addEventListener('click', function () {
        document.getElementById('task_input').value = '';
    })
    document.querySelector('#btn_out').addEventListener('click', function () {
        document.querySelector('#to_do_list').style.display = 'none';
        document.querySelector('#to_do').style.opacity = '1';
        document.querySelector('#plus').style.opacity = '1';
        document.querySelector('#frame').style.opacity = '1';
        document.querySelector('#calendar_div').style.opacity = '1';
        document.getElementById('task_input').value = '';
    })
})
document.addEventListener('DOMContentLoaded', () => {
    const btn_submit = document.getElementById('btn_submit');
    const taskInput = document.getElementById('task_input');
    const taskList = document.getElementById('task_list');

    btn_submit.addEventListener('click', () => {
        const task = taskInput.value;
        if (task) {
            addTask(task);
            taskInput.value = '';
            taskInput.focus();
        }
    });

    function addTask(task) {
        const listItem = document.createElement('li');
        listItem.textContent = task;

        const deleteButton = document.createElement('button');
        deleteButton.textContent = '삭제';
        deleteButton.onclick = function () {
            listItem.remove();
        };
        listItem.appendChild(deleteButton);
        taskList.appendChild(listItem);

    }
});

//////////////////////////////////////////////////////////////////////////////////////////////////////////////    
window.addEventListener('load', function () {

    const date = new Date();

    const renderCalendar = () => {
        const viewYear = date.getFullYear();
        const viewMonth = date.getMonth();

        document.querySelector('.year_month').textContent = `${viewYear}년 ${viewMonth + 1}월`;

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
    };

    renderCalendar();

    document.querySelector('.go_prev').addEventListener('click', function () {
        console.log('Previous month clicked'); // 디버깅을 위한 콘솔 로그
        date.setMonth(date.getMonth() - 1);

        renderCalendar();
    });

    document.querySelector('.go_today').addEventListener('click', function () {
        console.log('Go to today clicked'); // 디버깅을 위한 콘솔 로그
        const today = new Date();
        date.setFullYear(today.getFullYear(), today.getMonth(), today.getDate());

        renderCalendar();
    });

    document.querySelector('.go_next').addEventListener('click', function () {
        console.log('Next month clicked'); // 디버깅을 위한 콘솔 로그
        date.setMonth(date.getMonth() + 1);

        renderCalendar();
    });

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    document.addEventListener('DOMContentLoaded', function () {
        const apiKey = 'e20c5e5ad8e68beb46540b4914ba2271';
        const url = `https://api.openweathermap.org/data/2.5/weather?q=Seoul&appid=${apiKey}&units=metric`;

        fetch(url)
            .then(response => response.json())
            .then(data => {
                document.getElementById('temperature').textContent = `온도: ${data.main.temp}°C`;
                document.getElementById('weather').textContent = `날씨: ${data.weather[0].main}`;
                document.getElementById('wind').textContent = `풍속: ${data.wind.speed}m/s`;

                const weatherImage = document.getElementById('weatherImage');
                switch (data.weather[0].main) {
                    case 'Clear':
                        weatherImage.src = '../img/Sun.png';
                        break;
                    case 'Clouds':
                        weatherImage.src = '../img/Sun.png';
                        break;
                    case 'Rain':
                        weatherImage.src = '../img/Sun.png';
                        break;
                    // 여기에 필요한 만큼 다른 날씨 상태를 추가할 수 있습니다.
                    default:
                        weatherImage.src = '../img/Sun.png';
                }
            })
            .catch(error => console.error('API 요청 중 오류 발생:', error));
    })
});

///////////////////////////////메인페이지 끝/////////////////////////////////////////////////////////////////////////////

//media 전용//
// window.addEventListener('load', function () {
// if (matchMedia("screen and (min-width: 335px) and (min-height:413.91px)").matches) {
//     document.querySelector('#header').style.cssText = "width: 335px; height: 50px";
//     document.querySelector('.main_box').style.cssText = "width: 335px;";
//     menu_board = document.querySelector('#menu_board');
//     menu_board.style.cssText = "display:block;";
//     for (let i = 0; i < menu_board.children.length; i++) {
//         menu_board.children[i].style.cssText = "width:100%; border-bottom:1px solid black";
//     }
// document.querySelector('#content_box1').style.cssText ="display:block; height:auto;"
// document.querySelector('#to_do').style.display ="inline-block; width:100%;";
// document.querySelector('#plus').style.display ="inline-block";
// document.querySelector('#content_box2').style.cssText ="display:block; height:auto;"
// document.querySelector('#calendar_div').style.cssText ="display:none";

//     }
// })

////////////////////모니터링(장비) javascript////////////////////////////////////////////////////////////////////////////
window.addEventListener('load', function () {

});