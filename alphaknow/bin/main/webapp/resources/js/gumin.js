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
    }
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

    document.querySelectorAll('.date').forEach(date => {
        date.addEventListener('click', function (e) {
            const selectedDate = e.target.innerText;
            // 선택된 날짜를 입력 폼에 설정
            document.getElementById('selected-date').value = `${viewYear}-${viewMonth + 1}-${selectedDate}`;
            // 입력 폼 표시
            document.querySelector('.input-form').style.display = 'block';
        });
    });

   

///////////////////////////////메인페이지 끝/////////////////////////////////////////////////////////////////////////////

//media 전용
// window.addEventListener('load', function () {
//     if (matchMedia("screen and (min-width:320px) and (min-height:480px)").matches) {
//         let header = document.querySelector('#header');
//         header.style.cssText = "width: 320px; height: 50px;";

//         document.querySelector('.main_box').style.cssText = "width: 320px;";

//         let menu_board = document.querySelector('#menu_board');

//         document.querySelector('#li_icon').remove();

//         let li_search = document.querySelector('#li_search');
//         li_search.style.cssText = "width:285px;"

//         let search_txt = document.querySelector('#search_txt');
//         search_txt.style.cssText = "width:240px; font-size:20px;border:1px solid red;";

//         let li_hamburger = document.querySelector('#li_user_icon');
//         li_hamburger.style.cssText = "width:35px"

//         let hamburger = document.querySelector('#user_icon');
//         hamburger.src = "../img/hamburger.png";
//         hamburger.style.cssText = "width: 30px; margin-left: 5px";
//         menu_board.style.cssText = "display:none;";

//         hamburger.addEventListener('click', function () {
//             if (menu_board.style.display === "none" || menu_board.style.display === "") {
//                 for (let i = 0; i < menu_board.children.length; i++) {
//                     menu_board.children[i].style.cssText = "width:100%; border-bottom:1px solid black";
//                     menu_board.style.cssText = "display:block;";
//                 }
//             } else {
//                 menu_board.style.display = "none";
//             }
//         })
//         let moniter = document.querySelector('#moniter');

//         let monitering = document.querySelector('#monitering');
//             monitering.style.cssText ="position:static; display:block;";
//             moniter.appendChild(monitering);
//         for(let i = 0; i<monitering.children.length; i++){
//             monitering.children[i].classList.add('monitering_child');
//         }
//         document.querySelector('#content_box1').style.cssText = "display:block; height:auto;"
//         document.querySelector('#to_do').style.display = "inline-block; width:100%;";
//         document.querySelector('#plus').style.display = "inline-block";
//         document.querySelector('#content_box2').style.cssText = "display:block; height:auto;"
//         document.querySelector('#calendar_div').style.cssText = "display:none";

//     }
// })




});