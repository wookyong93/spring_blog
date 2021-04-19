/**
 * 
 */
 //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        	
        }).open();
    }
    //ID 조건식 충족 여부 확인
    function fn_idchk(){
    	//ID 입력시 영문 숫자조합 필수
    	var idRule = /^[A-Za-z0-9]{5,}$/;
    	//ID 조건이 맞는지 출력할 div 호출
    	var idcall = document.getElementById('idcall');
    	if(idRule.test(document.getElementById('id').value)){
    		idcall.innerHTML ="아이디 조건에 맞습니다."
    	}else{
    		idcall.innerHTML ="아이디는 영문 +숫자 조합으로 5글자 이상 사용해야합니다.";
    	}
    	//해당태그에 추가 
    }
    //ID 중복체크 
    function fn_idCheck(){
    	//버튼 클릭시 실행
    	var id = document.getElementById('id');
    	var frm=document.frm;
    	if(id.value==""){
    		//id 값 공란 제거
    		alert('id를 입력해주세요');
    		id.focus();
    	}else{
    		//controller 전송하여 검사
    		frm.method="post";
    		frm.action="${contextPath}/idCheck.do"; 
    		frm.submit();
    	}
    }
    //페스워드가 형식에 맞는지 확인하는 함수
    function fn_passwordCheck(){
    	//패스워드 형식 지정
    	var password=/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*])[A-Za-z\d!@#$%^&*]{8,}$/;
    	var pw = document.getElementById('pw');
    	var checkpwd = document.getElementById('checkpwd');
    	if(!password.test(document.getElementById('pwd').value)){
    		pw.innerHTML ='영어,숫자,특수문자가 1개씩 포함한 8글자 이상이어야합니다.';
    	}else{
    		
  			pw.innerHTML ="사용가능한 비밀번호입니다";
  			checkpwd.value ="ok";
    	}
    	//패스워드 확인 결과 출력
    }
    //PW 와 PWCHECK 가 같은지 화인하는 함수
    function fn_passwordsame(){
    	var pwd = document.getElementById('pwd');
    	var pwdchk = document.getElementById('pwdchk');
    	var pwsame = document.getElementById('pwsame');
    	var checkpwdchk = document.getElementById('checkpwdchk');
    	if(pwd == ""){
    		alert('PW를 입력해주세요');
    	}else if(pwd.value == pwdchk.value){
    		pwsame.innerHTML = "암호가 동일합니다.";
    		checkpwdchk.value ="ok";
    	}else{
    		pwsame.innerHTML ="암호가 다릅니다."
    	}
    }
    //주소 입력해주는 함수
    function fn_address(){
    	var postcode = document.getElementById('postcode').value;
    	var roadAddress = document.getElementById('roadAddress').value;
    	var detailAddress = document.getElementById('detailAddress').value;
    	var extraAddress = document.getElementById('extraAddress').value;
    	var address = document.getElementById('address');
    	address.value = "["+postcode+"]"+roadAddress+", "+detailAddress+extraAddress;
    	console.log(address);
    }
    //이메일 형식 확인하는 함수
    function fn_email(){
    	var emailRule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	var emailcall = document.getElementById('emailcall');
    	var checkemail = document.getElementById('checkemail');
    	if(emailRule.test(document.getElementById('email').value)){
    		emailcall.innerHTML="사용가능한 이메일 형식입니다.";
    		checkemail.value ="ok";
    	}else{
    		emailcall.innerHTML="이메일형식이 틀립니다.";
    	}
    }