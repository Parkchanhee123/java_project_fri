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

  </style>
</head>
<body>
  <header-element id="header">예약</header-element>

  
  <input-tel></input-tel>
  
  <button id="okButton" class="button">확인</button>

  <script>
    console.log("${Type}");

    switch("${Type}"){
      case "reserve":
        document.getElementById('header').innerText='예약';
      break;
      case "payment":
        document.getElementById('header').innerText='수납';
      break;
    }

    const tel=document.querySelector('input-tel');
    document.getElementById('okButton').onclick=()=>{
      if(tel.value.trim()===''){
        alert('전화번호를 입력해주세요.');
        return;
      }
      switch("${Type}"){
        case "reserve":
          checkUser(tel.value,(exists,tel)=>{
            if(exists){
              location.href="/reserve?phoneNumber="+tel
            }else{
              location.href="/user/join?phoneNumber="+tel
            }
          });
          break;
        case "payment":
          checkUser(tel.value,(exists,tel)=>{
            if(exists){
              location.href="/user/payment?phoneNumber="+tel
            }else{
              alert('등록되지 않은 회원입니다.');
            }
          });
          break;
        default:
          open("/",'_parent');
      }
    }

    function checkUser(tel,callback) {
      fetch('/user/check?phoneNumber=' + tel)
        .then(response => response.json())
        .then(exists => {
          callback(exists,tel);
        })
        .catch(error => {
          console.error('에러 발생:', error);
          alert('조회 중 오류가 발생했습니다.');
        });
    }
  </script>
</body>
</html>