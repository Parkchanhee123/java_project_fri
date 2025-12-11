<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>의사 선택</title>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="/css/style.css">

    <style>
        /* 의사 선택 카드 전용 스타일 */
        .doctor-card {
            background: white;
            border: 1px solid #eee;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: 0.3s;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            height: 100%;
        }
        .doctor-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            border-color: var(--primary-blue);
        }
        .doc-img {
            width: 80px;
            height: 80px;
            background-color: #e3f2fd;
            border-radius: 50%;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 2rem;
            color: var(--primary-blue);
        }
        .doc-name { font-size: 1.4rem; font-weight: bold; margin-bottom: 5px; }
        .doc-room { color: #666; font-size: 1rem; }
    </style>
</head>
<body>

<div class="kiosk-header">
    <div class="logo-area" onclick="location.href='/'" style="cursor: pointer;">
        <i class="fa-solid fa-arrow-left"></i> 처음으로
    </div>
    <div class="time-area">진료 예약</div>
</div>

<div class="main-container">
    <div class="mb-4 text-center">
        <h2>진료받으실 원장님을 선택하세요</h2>
    </div>

    <div class="row">
        <c:forEach var="doc" items="${doctors}">
            <div class="col-4 mb-3"> <div class="doctor-card" onclick="location.href='/reserve/result?phoneNumber=${phoneNumber}&docId=${doc.docId}'">
                <div class="doc-img">
                    <i class="fa-solid fa-user-doctor"></i>
                </div>
                <div class="doc-name">${doc.docName} 원장</div>
                <div class="doc-room">진료실 대기환자 확인</div>
            </div>
            </div>
        </c:forEach>
    </div>

    <div class="status-section">
        <div class="status-title">현재 대기 현황</div>
        <iframe id="ReserveList" src="/reserve/list"></iframe>
    </div>
</div>

</body>
</html>