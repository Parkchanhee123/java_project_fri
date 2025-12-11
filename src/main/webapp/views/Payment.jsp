<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>등록</title>
  <script src="/js/ElementClass.js"></script>
  <link rel="stylesheet" href="/css/style.css">
  <style>
    
    input-tel{
      position:absolute;
      bottom:50%;
      left: 50%;
      transform:translateX(-50%);
    }

    #okButton{
      position:absolute;
      left:50%;
      bottom:20%;
      transform:translateX(-50%);
      padding: 16px 32px;
    }
    #receipt{
      position:absolute;
      
      top:5rem;
      left:50%;
      font-size: 1.5rem;
      transform: translateX(-50%);
      border: 1px solid #444;
      border-radius: 8px;
      padding: 16px 16px;
      width: 20rem;
    }
    #receipt>p{
      text-align: center;
    }
    #receipt ul{
      display: flex;
      flex-direction: column;
    }
  </style>
</head>
<body>
  <header-element>수납</header-element>
  <div id="receipt">
    <p>진료 정보</p>
    <ul>
      <p>의사 : ${doctor.docName}</p>
      <p>진단 : ${historys.prescription}</p>
      <p>금액 : ${historys.pay}원</p>
    </ul>
  </div>
  
  
  
  <button id="okButton" class="button">결제하기</button>

  <script>
    document.getElementById('okButton').onclick=()=>{
      location.href="/"
    }
  </script>
</body>
</html>