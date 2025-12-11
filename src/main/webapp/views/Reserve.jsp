<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>예약</title>
  <script src="/js/ElementClass.js"></script>
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>
  <header-element>예약</header-element>
  <div class="mainButtons">
      <div></div>
      <c:forEach var="doc" items="${doctors}">
        <button class="button" onclick="location.href='/reserve/result?phoneNumber=${phoneNumber}&docId=${doc.docId}'">${doc.docName}</button>
      </c:forEach>
      <div></div>
  </div>
  
  <iframe id="ReserveList" src="/reserve/list" frameborder="0"></iframe>
</body>
</html>