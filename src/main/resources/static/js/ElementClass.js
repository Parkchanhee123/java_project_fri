class HeaderElement extends HTMLElement{
  _backBtn=null;
  // 생성자 정의
  constructor(){
    super();
    this.attachShadow({mode:'open'});
    this.shadowRoot.innerHTML=`
      <style>
        :host{
          position:fixed;
          display:grid;
          left:0;top:0;
          width:100%;
          height:4rem;
          background:#ffe5bb;
          box-shadow:0 0 3px 3px #5553
        }
        button{
          position:absolute;
          left:0;
          top:0;
          background:none;
          height:calc(100% - 8px);
          margin:4px;
          border:none;
          aspect-ratio:1;
          cursor:pointer;
        }
        h3{
          position:absolute;
          left:50%;
          top:50%;
          margin:0;
          transform:translate(-50%,-50%);
        }
      </style>
      <button><svg viewBox="0 0 32 32"><path fill="none" stroke="#444" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m14 7-8 9 8 9m12-9H6"/></svg></button>
      <h3><slot></slot></h3>
    `;
  }
  connectedCallback() {
    this._backBtn=this.shadowRoot.querySelector('button');
    this._backBtn.addEventListener('click',()=>window.history.back());
    this._pageBack(this.getAttribute('pageBack'));
  }
  // 속성 변경 처리
  static get observedAttributes(){
    return['pageBack'];
  }
  attributeChangedCallback(name,oldValue,newValue) {
    if(oldValue==newValue) return;

    switch(name){
      case'pageBack':
        this._pageBack(newValue);
        break;
    }
  }
  _pageBack(a){
    if(a=='true'){
      this._backBtn.style.display='block';
    }else if(a=='false'){
      this._backBtn.style.display='none';
    }else{
      this._backBtn.style.display='block';
    }
  }
}
customElements.define("header-element",HeaderElement);

class Tel extends HTMLElement{
  input=null;
  constructor(){
    super();
    this.attachShadow({mode:'open'});
    this.shadowRoot.innerHTML=`
      <style>
        :host{
          display:flex;
          flex-direction:column;
        }
        button{
          border:none;
          border-radius:6px;
          background:#ffcc7a;
          padding:12px;
          font-size:1.5rem;
        }
        #input{
          display:flex;
          height:calc(2rem + 8px);;
          gap:2px;
          margin-bottom:2px;
        }
        #input>input{
          border:1px solid #444;
          border-radius:6px;
          font-size:1.5rem;
        }
        #remove{
          display:block;
          height:100%;
          aspect-ratio:1;
          padding:1px;
        }
        #remove>svg{
          width:100%;
          height:100%;
        }
        #numberButtons{
          display:grid;
          grid-template-columns:repeat(3,1fr);
          gap:2px;
        }
      </style>
      <div id='input'>
        <input type="tel" id="telInput" placeholder="전화번호를 입력해주세요">
        <button id="remove"><svg viewBox="0 0 32 32"><path fill="none" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M26 23V9H11l-6 7 6 7zm-5-4-6-6m0 6 6-6"/></svg></button>
      </div>
      <div id="numberButtons"></div>
    `;
    this.input=this.shadowRoot.querySelector('input');

    this.shadowRoot.querySelector('#remove').onclick=()=>{
      this.input.value=this.input.value.slice(0, -1);
    };

    let numBtns=this.shadowRoot.querySelector('#numberButtons');
    for(let i of [
      '1','2','3',
      '4','5','6',
      '7','8','9',
      '*','0','#'
    ]){
      let btn=document.createElement('button');
      btn.innerText=i;
      btn.onclick=()=>{
        this.input.value+=i;
      };
      numBtns.append(btn);
    }
  }
  connectedCallback() {
    this.input.value=this.getAttribute('value');
  }
  get value(){
    return this.input.value;
  }
}
customElements.define("input-tel",Tel);