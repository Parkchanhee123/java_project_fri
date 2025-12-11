<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>회원 확인</title>

    <%-- 공통 라이브러리 및 스타일 --%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <script src="/js/ElementClass.js"></script>
    <link rel="stylesheet" href="/css/style.css">

    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            overflow: hidden;
            background-color: #F5F7FA;
        }

        .kiosk-header {
            flex: 0 0 auto;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a2b4b;
            color: white;
            padding: 0 40px;
            height: 110px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .logo-area {
            font-size: 1.5rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .header-title {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            font-size: 2.2rem;
            font-weight: bold;
        }

        .time-area {
            font-size: 1.5rem;
            font-weight: 300;
        }

        .main-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 30px;
        }

        .input-section {
            background: white;
            border-radius: 30px;
            padding: 60px 40px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.15);
            text-align: center;

            max-width: 750px;
            width: 95%;

            display: flex;
            flex-direction: column;
            gap: 40px;
        }

        .guide-text h2 { font-weight: bold; font-size: 2.6rem; margin-bottom: 15px; color: #333; }
        .guide-text p { color: #666; font-size: 1.4rem; margin: 0; }

        input-tel {
            position: static !important;
            display: block;
            transform: none !important;
            margin: 10px auto;

            transform: scale(1.3) !important;
        }


        #okButton {
            width: 100%;
            padding: 28px;
            font-size: 2rem;
            font-weight: bold;
            color: white;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            transition: 0.2s;
            box-shadow: 0 6px 20px rgba(0,0,0,0.15);
            margin-top: 10px;
        }
        #okButton:active {
            transform: scale(0.98);
            filter: brightness(90%);
        }
    </style>
</head>
<body>

<div class="kiosk-header">
    <div class="logo-area" onclick="location.href='/'" style="cursor: pointer;">
        <i class="fa-solid fa-arrow-left"></i> 처음으로
    </div>

    <div class="header-title" id="headerTitle">
        회원 확인
    </div>

    <div class="time-area" id="clock">
        00:00
    </div>
</div>

<div class="main-container">
    <div class="input-section">
        <div class="guide-text">
            <h2 id="pageTitle">전화번호 입력</h2>
            <p>진료 접수 및 수납을 위해<br>핸드폰 번호를 입력해주세요.</p>
        </div>

        <input-tel></input-tel>

        <button id="okButton">확인</button>
    </div>
</div>

<script>
    const type = "${Type}";
    console.log("Current Type:", type);

    const headerTitle = document.getElementById('headerTitle');
    const pageTitle = document.getElementById('pageTitle');
    const okBtn = document.getElementById('okButton');

    if (type === "reserve") {
        headerTitle.innerText = '진료 예약';
        pageTitle.innerText = '예약자 확인';
        okBtn.style.background = "linear-gradient(135deg, #4facfe 0%, #00f2fe 100%)";
    } else if (type === "payment") {
        headerTitle.innerText = '수납 및 처방';
        pageTitle.innerText = '수납자 확인';
        okBtn.style.background = "linear-gradient(135deg, #f6d365 0%, #fda085 100%)";
    } else {
        okBtn.style.background = "linear-gradient(135deg, #a18cd1 0%, #fbc2eb 100%)";
    }

    function updateClock() {
        const now = new Date();
        const timeString = now.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
        document.getElementById('clock').innerText = timeString;
    }
    setInterval(updateClock, 1000);
    updateClock();

    const telComponent = document.querySelector('input-tel');

    document.getElementById('okButton').onclick = () => {
        const phoneNumber = telComponent.value ? telComponent.value.trim() : "";

        if(phoneNumber === ''){
            alert('전화번호를 입력해주세요.');
            return;
        }

        switch(type){
            case "reserve":
                checkUser(phoneNumber, (exists, tel) => {
                    if(exists){
                        location.href = "/reserve?phoneNumber=" + tel;
                    } else {
                        if(confirm("등록된 정보가 없습니다.\n신규 환자로 등록하시겠습니까?")) {
                            location.href = "/user/join?phoneNumber=" + tel;
                        }
                    }
                });
                break;

            case "payment":
                checkUser(phoneNumber, (exists, tel) => {
                    if(exists){
                        location.href = "/user/payment?phoneNumber=" + tel;
                    } else {
                        alert('등록되지 않은 회원입니다.\n원무과 데스크에 문의해주세요.');
                    }
                });
                break;

            default:
                location.href = "/";
        }
    }

    function checkUser(tel, callback) {
        fetch('/user/check?phoneNumber=' + tel)
            .then(response => response.json())
            .then(exists => {
                callback(exists, tel);
            })
            .catch(error => {
                console.error('에러 발생:', error);
                alert('서버 통신 중 오류가 발생했습니다.');
            });
    }
</script>
</body>
</html>