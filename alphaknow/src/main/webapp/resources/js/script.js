/////////////////////////////공동 javascript /////////////////////////////////////////////////////

window.addEventListener('load', function () {
    let searchInput = document.querySelector('#search_txt');
    let engine = document.querySelector('#li_search');
    let searchButton = document.querySelector('#search_img1');

    // 검색 실행 함수
    function executeSearch() {
        const searchValue = searchInput.value;
        if (searchValue === "모니" || searchValue === "모니터" || searchValue === "모니터링") {
            let menu = document.createElement('div');
            menu.classList.add('search_menu');

            let items = [
                { text: '모니터링(장비)', link: '../monitoring/monitoring_equipment.html' },
                { text: '가동률 현황', link: '#' },
                { text: '비가동률 현황', link: '#' },
                { text: '리플로우(온도)', link: '../monitoring/monitoring_reflow.html' }
            ];

            items.forEach(function (item) {
                let menuChild = document.createElement('div');
                menuChild.textContent = item.text;
                menuChild.style.cursor = "pointer";
                menuChild.addEventListener('click', function () {
                    window.location.href = item.link;
                });
                menu.appendChild(menuChild);
            });
            engine.appendChild(menu);
        } else {
            let directLinks = {
                '모니터링(장비)': '../monitoring/monitoring_equipment.html',
                '리플로우(온도)': '../monitoring/monitoring_reflow.html',
                '가동률현황': '#',
                '비가동현황': '#'
            };
            if (directLinks[searchValue]) {
                window.location.href = directLinks[searchValue];
            }
        }
    }

    // 클릭 이벤트 리스너
    searchButton.addEventListener('click', function () {
        executeSearch();
    });

    // 키 입력 이벤트 리스너
    searchInput.addEventListener('keypress', function (e) {
        if (e.key === "Enter") {
            executeSearch();
        }
    });
});
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
    document.querySelector('body').addEventListener('mouseenter', function () {
        predicting.style.display = 'none';
        monitering.style.display = 'none';
        criteria.style.display = 'none';
        planning.style.display = 'none';
        performing.style.display = 'none';
        invent.style.display = 'none';
        storing.style.display = 'none';

    })
})
/////////////////////////////공동 javascript 끝/////////////////////////////////////////////////////


/////////////////////////////메인페이지 시작///////////////////////////////////////////////////////////
