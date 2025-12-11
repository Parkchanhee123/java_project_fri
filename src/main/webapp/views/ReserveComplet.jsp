<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예약</title>
  <script src="/js/ElementClass.js"></script>
  <link rel="stylesheet" href="/css/style.css">
  <style>
    #info{
      position:absolute;
      display: flex;
      align-items: center;
      justify-content: center;
      top:5rem;
      left:50%;
      width:10rem;
      height:60%;
      gap:3rem;
      flex-direction: column;
      transform: translateX(-50%);
    }
    #doctorName{
      border: 1px solid #444;
      border-radius: 8px;
      padding: 16px 32px;
      font-size: 24px;
      width:100%;
      text-align: center;
    }
    #number{
      border: 1px solid #444;
      border-radius: 8px;
      padding: 16px 32px;
      font-size: 24px;
      width:100%;
      text-align: center;
    }

    #okButton{
      position:absolute;
      left:50%;
      bottom:20%;
      transform:translateX(-50%);
      padding: 16px 32px;
    }

  </style>
</head>
<body>
  <header-element pageBack=false>예약 완료</header-element>

  <div id="info">
    <span id="doctorName">${doc.docName}</span>

    <span id="number">대기번호 ${res.resId}번</span>
  </div>
  
  
  <button id="okButton" class="button">메인으로 이동</button>

  <script>

    document.getElementById('okButton').onclick=()=>{
      open("/",'_parent');
    }
  </script>
</body>
</html>