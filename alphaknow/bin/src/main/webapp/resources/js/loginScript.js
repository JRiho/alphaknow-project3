 
document.addEventListener('DOMContentLoaded', function () {
    let loginType_id = document.getElementById('loginType_id');
    let loginType_qr = document.getElementById('loginType_qr');
    let id_login = document.getElementById('id_login');
    let qr_login = document.getElementById('qr_login');

    loginType_id.classList.add('active');

    loginType_id.addEventListener('click', function () {
        if (!loginType_id.classList.contains('active')) {
            loginType_id.classList.remove('inactive');
            loginType_id.classList.add('active');
            loginType_qr.classList.remove('active');
            loginType_qr.classList.add('inactive');
        }

        id_login.style.display = 'block';
        qr_login.style.display = 'none';
    });

    loginType_qr.addEventListener('click', function () {
        if (!loginType_qr.classList.contains('active')) {
            loginType_qr.classList.remove('inactive');
            loginType_qr.classList.add('active');
            loginType_id.classList.remove('active');
            loginType_id.classList.add('inactive');
        }

        qr_login.style.display = 'block';
        id_login.style.display = 'none';
    });

    document.getElementById('id').addEventListener('keyup', function (event) {
        if (event.key === 'Enter') {
            login(); // login 함수 호출
        }
    });

});

function login() {
    let id = document.getElementById('id').value;
    let pass = document.getElementById('pass').value;

    if (!id) {
        alert('아이디를 입력해주세요.');
        document.getElementById('id').focus(); // 아이디 입력란에 포커스
        return; // 함수 종료
    }

    // 비밀번호 입력 검사
    if (!pass) {
        alert('비밀번호를 입력해주세요.');
        document.getElementById('pass').focus(); // 비밀번호 입력란에 포커스
        return; // 함수 종료
    }

    let adminAccount = { id: 'admin', pass: '0000' };
    let userAccount = { id: 'user', pass: '1234' };

    if (id == adminAccount.id && pass == adminAccount.pass) {
        window.location.href = 'mainPage.html'
        alert('어서오세요 관리자님');
    } else if (id == userAccount.id && pass == userAccount.pass) {
        window.location.href = 'mainPage.html'
        alert('어서오세요 user님')
    } else {
        alert('아이디나 비밀번호가 일치하지 않습니다.');
    }
}

function openPopup() {
    window.open('project_findPass.jsp', '비밀번호 찾기', 'width=850, height=400');
}

