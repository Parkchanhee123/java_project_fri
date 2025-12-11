<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약 완료</title>
    <script src="/js/ElementClass.js"></script>
    <link rel="stylesheet" href="/css/style.css">

    <style>
        body {
            display: flex;
            flex-direction: column;
            height: 100vh;
            margin: 0;
            background-color: #f5f7fa;
            font-family: 'Noto Sans KR', sans-serif;
            overflow: hidden;
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
        }

        .time-area {
            font-size: 1.5rem;
            font-weight: 300;
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

        .success-header {
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 1.5rem;
        }

        .check-icon {
            width: 100px;
            height: 100px;
            background-color: #4CAF50;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 15px rgba(76, 175, 80, 0.4);
            color: white;
            margin-bottom: 10px;
        }

        .success-title {
            font-size: 2rem;
            font-weight: bold;
            color: #333;
            margin: 0;
        }

        .success-desc {
            color: #666;
            font-size: 1.2rem;
        }

        .info-card {
            background: white;
            width: 100%;
            max-width: 400px;
            border-radius: 20px;
            padding: 2.5rem;
            box-shadow: 0 4px 25px rgba(0, 0, 0, 0.08);
            display: flex;
            flex-direction: column;
            gap: 2rem;
            text-align: center;
            align-items: center;
        }

        .info-item {
            display: flex;
            flex-direction: column;
            gap: 0.8rem;
        }

        .info-label {
            font-size: 1rem;
            color: #888;
            font-weight: 500;
        }

        .info-value {
            font-size: 1.8rem;
            font-weight: bold;
            color: #333;
        }

        .info-divider {
            height: 1px;
            background-color: #eee;
            width: 100%;
        }

        .button-area {
            width: 100%;
            padding: 0 0 3rem 0;
            display: flex;
            justify-content: center;
        }

        #okButton {
            padding: 10px 32px;
            width: 100%;
            max-width: 300px;
            font-size: 1.3rem;
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

    <div class="header-title">예약 완료</div>

    <div class="time-area" id="currentTime">00:00</div>
</header>

<div class="container">

    <div class="success-header">
        <div class="check-icon">
            <svg width="50" height="50" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="3" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="20 6 9 17 4 12"></polyline>
            </svg>
        </div>
        <h2 class="success-title">예약이 확정되었습니다</h2>
        <p class="success-desc">잠시 대기해 주시면 안내해 드리겠습니다.</p>
    </div>

    <div class="info-card">
        <div class="info-item">
            <span class="info-label">담당 의료진</span>
            <span class="info-value" id="doctorName">${doc.docName}</span>
        </div>

        <div class="info-divider"></div>

        <div class="info-item">
            <span class="info-label">나의 대기번호</span>
            <span class="info-value" id="number" style="color: #3b82f6; font-size: 2.5rem;">${res.resId}번</span>
        </div>
    </div>

</div>

<div class="button-area">
    <button id="okButton" class="button">메인 화면으로 이동</button>
</div>

<script>
    // 1. 시계 기능 구현 (키오스크 필수 기능)
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