<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>수납</title>
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

        /* 2. 헤더 스타일 */
        .kiosk-header {
            flex: 0 0 auto;
            position: relative;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #1a2b4b;
            color: white;
            padding: 0 40px;
            height: 80px;
            width: 100%;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            z-index: 100;
        }


        .logo-area {
            font-size: 1.5rem;
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
            gap: 2rem;
            width: 100%;
        }

        .page-guide {
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1rem;
        }

        .icon-box {
            width: 90px;
            height: 90px;
            background-color: #e3f2fd;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1976d2;
            margin-bottom: 10px;
            box-shadow: 0 4px 15px rgba(25, 118, 210, 0.2);
        }

        .guide-title {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin: 0;
        }

        .info-card {
            background: white;
            width: 100%;
            max-width: 450px;
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.08);
            display: flex;
            flex-direction: column;
            gap: 1.5rem;
        }

        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 0;
        }

        .info-label {
            font-size: 1.2rem;
            color: #666;
            font-weight: 500;
        }

        .info-value {
            font-size: 1.4rem;
            font-weight: bold;
            color: #333;
            text-align: right;
        }

        .info-divider {
            height: 1px;
            background-color: #eee;
            width: 100%;
            margin: 0.5rem 0;
        }

        .total-price-area {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
            padding-top: 1.5rem;
            border-top: 2px dashed #ddd;
        }

        .total-label {
            font-size: 1.4rem;
            font-weight: bold;
            color: #333;
        }

        .total-value {
            font-size: 2.2rem;
            font-weight: 800;
            color: #e53935;
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

    <div class="header-title">진료비 수납</div>

    <div class="time-area" id="currentTime">00:00</div>
</header>

<div class="container">

    <div class="page-guide">
        <div class="icon-box">
            <svg width="45" height="45" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                <rect x="1" y="4" width="22" height="16" rx="2" ry="2"></rect>
                <line x1="1" y1="10" x2="23" y2="10"></line>
            </svg>
        </div>
        <h2 class="guide-title">수납 내역을 확인해 주세요</h2>
    </div>

    <div class="info-card">
        <div class="info-item">
            <span class="info-label">담당 의료진</span>
            <span class="info-value">${doctor.docName} 의사</span>
        </div>

        <div class="info-divider"></div>

        <div class="info-item">
            <span class="info-label">진단명</span>
            <span class="info-value">${historys.prescription}</span>
        </div>

        <div class="total-price-area">
            <span class="total-label">수납 금액</span>
            <span class="total-value">${historys.pay}원</span>
        </div>
    </div>

</div>

<div class="button-area">
    <button id="okButton" class="button">결제하기</button>
</div>

<script>
    function updateClock() {
        const now = new Date();
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        document.getElementById('currentTime').innerText = hours + ":" + minutes;
    }

    setInterval(updateClock, 1000);
    updateClock();

    document.getElementById('okButton').onclick = () => {
        location.href = "/";
    }
</script>
</body>
</html>