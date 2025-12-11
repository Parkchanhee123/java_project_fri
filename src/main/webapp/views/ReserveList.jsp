<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>예약 목록</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary-blue: #4A90E2;
            --bg-gray: #F5F7FA;
        }

        body {
            font-family: 'Pretendard', sans-serif;
            margin: 0;
            padding: 10px;
            background-color: transparent;
            box-sizing: border-box;

            display: flex;
            gap: 15px;
            height: 100vh;
            overflow: hidden;
        }

        .doctor-column {
            flex: 1;
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.05);
            display: flex;
            flex-direction: column;
            overflow: hidden;
            border: 1px solid #eee;
        }

        .column-header {
            background-color: #f8f9fa;
            padding: 15px 10px;
            text-align: center;
            font-size: 1.3rem;
            font-weight: bold;
            color: #333;
            border-bottom: 2px solid var(--primary-blue);
        }
        .column-header i {
            color: var(--primary-blue);
            margin-right: 5px;
        }

        .wait-list {
            flex: 1;
            padding: 10px;
            overflow-y: auto;
        }

        .wait-list::-webkit-scrollbar { width: 6px; }
        .wait-list::-webkit-scrollbar-thumb { background-color: #ddd; border-radius: 3px; }

        .patient-item {
            display: block;
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 12px;
            margin-bottom: 8px;
            font-size: 1.2rem;
            text-align: center;
            color: #555;
            font-weight: 500;
        }

        .patient-item:first-child {
            background-color: #e3f2fd;
            border-color: #90caf9;
            color: #1565c0;
            font-weight: bold;
            animation: blink 2s infinite;
        }

        .no-patient {
            text-align: center;
            color: #aaa;
            margin-top: 20px;
            font-size: 1rem;
        }

        @keyframes blink {
            0% { border-color: #90caf9; }
            50% { border-color: var(--primary-blue); }
            100% { border-color: #90caf9; }
        }
    </style>
</head>
<body>

<c:forEach var="doc" items="${doctors}">

    <div class="doctor-column">
        <div class="column-header">
            <i class="fa-solid fa-stethoscope"></i> ${doc.docName}
        </div>

        <div class="wait-list">
            <c:set var="count" value="0" />
            <c:forEach var='res' items='${reserves}'>
                <c:if test="${doc.docId == res.docId}">

                    <div class="patient-item">
                        대기번호 <strong>${res.resId}</strong>
                    </div>

                    <c:set var="count" value="${count + 1}" />
                </c:if>
            </c:forEach>

            <c:if test="${count == 0}">
                <div class="no-patient">대기 환자 없음</div>
            </c:if>
        </div>
    </div>

</c:forEach>

</body>
</html>