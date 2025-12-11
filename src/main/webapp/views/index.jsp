<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>키오스크 메인</title>

    <%-- jQuery & Bootstrap --%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <%-- FontAwesome (아이콘) --%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<div class="kiosk-header">
    <div class="logo-area">
        <i class="fa-solid fa-hospital-user"></i> 병원 123
    </div>
    <div class="time-area" id="clock">
        00:00
    </div>
</div>

<div class="main-container">
    <div class="mb-4 text-center">
        <h2 style="font-weight: 700;">원하시는 업무를 선택해주세요</h2>
    </div>

    <div class="row mb-4" style="height: 250px;">
        <div class="col-6">
            <div id="Reserve" class="action-card btn-reserve">
                <i class="fa-regular fa-calendar-check"></i>
                <h3>진료 예약</h3>
                <p>접수 및 진료 대기 등록</p>
            </div>
        </div>
        <div class="col-6">
            <div id="payment" class="action-card btn-payment">
                <i class="fa-solid fa-credit-card"></i>
                <h3>수납 / 처방</h3>
                <p>진료비 결제 및 처방전 발급</p>
            </div>
        </div>
    </div>

    <div class="status-section">
        <div class="status-title">실시간 진료 현황</div>
        <iframe id="ReserveList" src="/reserve/list"></iframe>
    </div>
</div>

<script>
    document.getElementById('Reserve').onclick = () => {
        location.href = "/user/login?type=reserve";
    }
    document.getElementById('payment').onclick = () => {
        location.href = "/user/login?type=payment";
    }

    function updateClock() {
        const now = new Date();
        const timeString = now.toLocaleTimeString('ko-KR', { hour: '2-digit', minute: '2-digit' });
        const dateString = now.toLocaleDateString('ko-KR', { month: 'long', day: 'numeric', weekday: 'short'});
        document.getElementById('clock').innerHTML = dateString + ' ' + timeString;
    }
    setInterval(updateClock, 1000);
    updateClock();
</script>

</body>
</html>