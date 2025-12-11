<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>신규 등록</title>
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
    #nameLabel{
      position:absolute;
      display:block;
      margin-bottom:16px;
      font-size: 2rem;
      left: 50%;
      bottom:35%;
      transform:translateX(-50%);
    }
    #name{
      font-size: 2rem;
    }
  </style>
</head>
<body>
  <header-element>신규 등록</header-element>


  
  <input-tel value="${phoneNumber}"></input-tel>
  
  <label id="nameLabel">이름 <input type="text" id="name" name="name"placeholder="이름을 입력해주세요"></label>
  
  <button id="okButton" class="button">확인</button>

  <script>
    document.getElementById('okButton').onclick=()=>{
      let tel=document.querySelector('input-tel').value;
      fetch('/user/regist?phoneNumber='+tel+'&name='+document.querySelector('#name').value).then(response => {
        open("/reserve?phoneNumber="+tel,'_parent');
      })
      
    }
  </script>
</body>
</html>