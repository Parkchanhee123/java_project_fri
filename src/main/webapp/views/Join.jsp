<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>신규 등록</title>
    <script src="/js/ElementClass.js"></script>
    <link rel="stylesheet" href="/css/style.css">

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            padding: 0;
            background-color: #f5f7fa;
            font-family: 'Noto Sans KR', sans-serif;
            overflow: hidden;
            width: 100%;
        }

        .kiosk-header {
            flex: 0 0 auto;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a2b4b;
            color: white;
            padding: 0 30px;
            height: 80px;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            z-index: 100;
        }

        .logo-area {
            font-size: 1.0rem;
            font-weight: bold;
            display: flex;
            align-items: center;
            gap: 15px;
            cursor: pointer;
        }

        .header-title {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            font-size: 1.5rem;
            font-weight: bold;
            white-space: nowrap;
        }

        .time-area {
            font-size: 1.5rem;
            font-weight: 300;
            min-width: 60px;
            text-align: right;
        }

        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 2rem;
            width: 100%;
            gap: 3rem;
        }

        .form-group {
            width: 100%;
            max-width: 500px;
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .input-label {
            font-size: 1.5rem;
            font-weight: bold;
            color: #333;
            margin-bottom: 0.5rem;
            display: block;
        }

        .tel-wrapper {
            display: flex;
            justify-content: center;
            margin-bottom: 1rem;
        }

        #name {
            width: 100%;
            padding: 20px;
            font-size: 1.8rem;
            border: 2px solid #ddd;
            border-radius: 12px;
            background-color: white;
            transition: border-color 0.2s;
            text-align: center;
        }

        #name:focus {
            outline: none;
            border-color: #1a2b4b;
            box-shadow: 0 0 0 4px rgba(26, 43, 75, 0.1);
        }

        .button-area {
            width: 100%;
            padding: 0 0 3rem 0;
            display: flex;
            justify-content: center;
        }

        #okButton {
            padding: 16px 32px;
            width: 100%;
            max-width: 350px;
            font-size: 1.5rem;
            border-radius: 16px;
            background-color: #1a2b4b;
            color: white;
            border: none;
            cursor: pointer;
            font-weight: bold;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            transition: transform 0.1s;
        }

        #okButton:active {
            transform: scale(0.98);
        }
    </style>
</head>
<body>

<header class="kiosk-header">
    <div class="logo-area" onclick="location.href='/'">
        <svg width="32" height="32" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
            <path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path>
            <polyline points="9 22 9 12 15 12 15 22"></polyline>
        </svg>
        <span>처음으로</span>
    </div>
    <div class="header-title">신규 환자 등록</div>
    <div class="time-area" id="currentTime">00:00</div>
</header>

<div class="container">

    <div class="form-group">
        <div>
            <label class="input-label" style="text-align: center;">전화번호 확인</label>
            <div class="tel-wrapper">
                <input-tel value="${phoneNumber}"></input-tel>
            </div>
        </div>

        <div>
            <label for="name" class="input-label" style="text-align: center;">이름을 입력해 주세요</label>
            <input type="text" id="name" name="name" placeholder="터치하여 입력" autocomplete="off">
        </div>
    </div>

</div>

<div class="button-area">
    <button id="okButton" class="button">확인</button>
</div>

<script>
    // 시계 기능
    function updateClock() {
        const now = new Date();
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        document.getElementById('currentTime').innerText = hours + ":" + minutes;
    }
    setInterval(updateClock, 1000);
    updateClock();

    document.getElementById('okButton').onclick = () => {
        let tel = document.querySelector('input-tel').value;
        let name = document.querySelector('#name').value;

        if (!name) {
            alert("이름을 입력해주세요.");
            document.getElementById('name').focus();
            return;
        }

        fetch('/user/regist?phoneNumber=' + tel + '&name=' + name).then(response => {
            open("/reserve?phoneNumber=" + tel, '_parent');
        })
    }
</script>
</body>
</html>