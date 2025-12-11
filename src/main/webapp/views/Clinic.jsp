<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>
        키오스크123
    </title>

    <%-- jquary --%>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>
<body>
<div class="main">
    <ul>
        <c:forEach var="res" items="${reserves}">
        <li>
            ${res.resId} : 
            <c:forEach var="user" items="${users}">
                <c:if test="${user.userId == res.userId}">${user.userName}</c:if>
            </c:forEach>
        </li>
        </c:forEach>
    </ul>
    <label for="">예약id<input type="number" id="resid" name="amount"></label>
    <label for="">금액<input type="number" id="pay" name="amount"></label>
    <textarea name="" id="prescription"></textarea>

    <button id="button">진료 완료</button>

    <script>
        document.getElementById('button').onclick=()=>{
            fetch('/clinic/addHistory' +
                '?resId=' + resid.value +
                '&pay=' + pay.value +
                '&prescription=' + encodeURIComponent(prescription.value))
        }
    </script>
</div>
</body>