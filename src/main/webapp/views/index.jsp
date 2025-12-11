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
    
    <script src="/js/ElementClass.js"></script>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
<div class="main">
    <header-element pageBack=false>메인페이지</header-element>
    <div class="mainButtons">
        <div></div>
        <button id="Reserve" class="button">예약</button>
        <div></div>
        <button id="payment" class="button">수납</button>
        <div></div>
    </div>
    <iframe id="ReserveList" src="/reserve/list" frameborder="0"></iframe>

    <script>
        document.getElementById('Reserve').onclick=()=>{
            open("/user/login?type=reserve",'_parent');
        }
        document.getElementById('payment').onclick=()=>{
            open("/user/login?type=payment",'_parent');
        }
    </script>
</div>
</body>