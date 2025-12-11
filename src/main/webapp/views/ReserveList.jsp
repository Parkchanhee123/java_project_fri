<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>예약 목록</title>

  <style>
    body{
      display:flex;
      position: absolute;
      height:100%;
      width:100%;
      margin:0;
      padding:8px;
      box-sizing: border-box;
    }
  </style>
</head>
<body>
  <c:forEach var="doc" items="${doctors}">
    <reservation-list>
      <div slot="doctorName">${doc.docName}</div>
      <div slot="list">
        <c:forEach var='res' items='${reserves}'>
          
          <c:if test="${doc.docId == res.docId}">
            <div>${res.resId}번</div> 
          </c:if>
        </c:forEach>
      </div>
    </reservation-list>
  </c:forEach>
  <script>
    class ReservationList extends HTMLElement{
      constructor(){
        super();
        this.attachShadow({mode:'open'});
        this.shadowRoot.innerHTML=`
          <style>
            :host{
              position:relative;
              display:flex;
              flex-grow: 1;
              flex-direction:column;
              border:1px solid #bbb;
              align-items:baseline;
            }
            #title{
              display:flex;
              justify-content: center;
              align-items:center;
              width:100%;
              border-bottom:1px solid #bbb;
            }
            #list{
              display:flex;
              justify-content: center;
              align-items:center;
              width:100%;
            }
          </style>
          <div id="title"><slot name="doctorName"></slot></div>
          <div id="list"><slot name="list"></slot></div>
          
        `
        this.list=this.shadowRoot.querySelector('#list');
      }
    }
    customElements.define("reservation-list",ReservationList);
    
  </script>
</body>
</html>