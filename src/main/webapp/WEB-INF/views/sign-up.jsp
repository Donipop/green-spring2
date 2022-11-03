<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*     { box-sizing:border-box;  }
	
	.sign-upForm { width:600px; margin:0 auto; }

	.sign-upForm input {
       
       border:1px solid grey;
       border-radius:5px;
       width: 50%;
       padding: 10px;
       margin:5px;
       
    }
    
	div  {
            text-align: center;
       }
    
    td { width:200px; }
    
    #container { width:100% }
    
    #form1 { width:100%; }

   
    input[name="signup"]:hover { background-color:#1E90FF; }
    input[name="signup"]:active { background-color:#4169E1; }
	input[name="signup"] { background-color:#87CEFA; border:0px; }
    
    input:focus { border-color:#0000CD; outline:none;}
    
    hr          { width:400px; margin-bottom:70px; }
    


</style>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
    window.onload = function() {

    // Fields
    let username       = document.querySelector('[name=username]');
    const userpassword   = document.querySelector('[name=userpassword]');
    const repasswd       = document.querySelector('[name=repasswd]');
    const usernickname   = document.querySelector('[name=usernickname]');
    // 오류체크메세지
    const unameCheck     = document.getElementById('unameCheck');
    const pwCheck        = document.getElementById('pwCheck');
    const re_pwCheck     = document.getElementById('re_pwCheck');
    const unicknameCheck = document.getElementById('unicknameCheck');
    const checkError     = document.getElementById('checkError');

    // 정규식
    // id : 글자 수 제한(2~20), 영문&숫자
    // pw : 글자 수 제한(8~16), 영문&숫자,특수문자
    // nickname : 글자수 제한 (2~15), 한글, 영문, 숫자 / 특수문자,자음,모음 x
    const nameVaildation     = /^[a-z0-9_-]{2,21}$/g;
    const pwVaildation       = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*[$@$!%*?&*-])[A-Za-z\d$@$!%*?&*-]{8,21}$/g;
    const nicknameVaildation = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/g;
    const form = document.querySelector('form');

    // 회원가입 유효성 검사
    form.addEventListener('submit', function(e) {
        if(username.value == '') {
            checkError.innerHTML = '아이디를 입력하세요';
            username.focus();
            e.preventDefault();

        } else if (userpassword.value == '') {
            checkError.innerHTML = '비밀번호를 입력하세요';
            userpassword.focus();
            e.preventDefault();

        } else if (repasswd.value == '') {
            checkError.innerHTML = '비밀번호 확인을 입력하세요';
            repasswd.focus();
            e.preventDefault();

        } else if (usernickname.value == '') {
            checkError.innerHTML = '닉네임을 입력하세요';
            usernickname.focus();
            e.preventDefault();
        }
        return true;
    });

    // username
    username.addEventListener('blur', function() {
        if(!nameVaildation.test(username.value.trim())) {
            unameCheck.innerHTML = '2자 이상 20자 이내로 입력해주세요';
            username.focus();
            return false;
        } else if(nameVaildation.test(username.value.trim())) {
            unameCheck.innerHTML = '';
        } else {
            if(username.value.search(/\s/) != -1) {
                unameCheck.innerHTML = '공백을 포함할 수 없습니다.';
                username.focus();
            } else {

                // 아이디 중복확인 ajax 처리

                console.log(username.value);
                if( username.value.length != 0) {
                    console.log(username.value.length);
                    $.ajax({
                        type:'POST',
                        url: '/sign-up/usernameCheck',
                        data: username.value,
                        dataType: 'json',
                        contentType: 'application/json; charset=UTF-8',
                        success: function(count) {
                            if(count > 0) {
                                unameCheck.innerHTML = '이미 존재하는 아이디입니다.';
                                username.focus();

                            } else {
                                unameCheck.innerHTML = '사용가능한 아이디입니다.';
                            }
                        }, // success end
                        error:function(error) {
                            unameCheck.innerHTML = '아이디를 다시 입력해주세요.';
                            username.focus();

                        }
                    }); // ajax end
                } else {
                    unameCheck.innerHTML = '아이디를 입력해주세요.';

                }
            } // 첫 if end
        }

    });

    // passwd
    userpassword.addEventListener('change', function() {
        if(!pwVaildation.test(userpassword.value)) {
            pwCheck.innerHTML = '2자 이상 20자 이내로 입력해주세요.';
            userpassword.focus();
            return false;
        } else {
            pwCheck.innerHTML = '';
        }
        return true;
    });

    // repasswd
    repasswd.addEventListener('change', function() {
        if(repasswd.value != userpassword.value) {
            re_pwCheck.innerHTML = '비밀번호가 일치하지 않습니다.';
            repasswd.value = '';
            repasswd.focus();
        } else {
            re_pwCheck.innerHTML = '비밀번호가 일치합니다.';
        }
        return true;
    });

    // usernickname
    usernickname.addEventListener('change', function() {
        if(!nicknameVaildation.test(usernickname.value)) {
            unicknameCheck.innerHTML = '2자이상 15자 이내로 입력해주세요.';
            usernickname.focus();
            return false;
        } else if(nicknameVaildation.test(usernickname.value)) {
                unicknameCheck.innerHTML = '';
        } else {
            if(usernickname.value.search(/\s/) != -1) {
                unicknameCheck.innerHTML = '공백을 포함할 수 없습니다.';
                usernickname.focus();
            } else {

                // 닉네임 중복확인 ajax 처리
                if(usernickname.value.trim().length != 0) {
                    $.ajax({
                        type:'POST',
                        data: usernickname,
                        url: '/sign-up/nicknameCheck',
                        dataType: 'json',
                        contentType: 'application/json; charset=UTF-8',
                        success: function(count) {
                            if(count > 0) {
                                unicknameCheck.innerHTML = '이미 존재하는 아이디입니다.';
                                usernickname.focus();
                                return false;
                            } else {
                                unicknameCheck.innerHTML = '사용가능한 아이디입니다.';
                            }
                        }, // success end
                        error:function(error) {
                            unicknameCheck.innerHTML = '아이디를 다시 입력해주세요.';
                            usernickname.focus();
                            return false;
                        }
                    }); // ajax end
                } else {
                    unicknameCheck.innerHTML = '아이디를 입력해주세요.';
                    return false;
                }
            } // 첫 if end
        } // else end
        return true;
    });


} // window.onload end
	

	


</script>
</head>
<body>
	<div class="sign-upForm">
	<h2>회원가입</h2>
	<hr />
		<form action="/sign-up/register" method="POST" id="form1">
		  <table id="container">
		  	<tr>
                <td>
                    <input type="text" name="username" id="username" placeholder="아이디" maxlength="20"><br>
                    <span id="unameCheck"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="password" name="userpassword" placeholder="비밀번호" maxlength="20"><br>
                    <span id="pwCheck"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="password" name="repasswd" placeholder="비밀번호 확인" maxlength="20"><br>
                    <span id="re_pwCheck"></span>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" name="usernickname" placeholder="닉네임" maxlength="15"><br>
                    <span id="unicknameCheck"></span>
                </td>
            </tr>
            <tr>
                <td><span id="checkError"></span></td>
            </tr>
            <tr>
                <td><input type="submit" name="signup" value="가입하기"/></td>
            </tr>
		  </table>
		</form>

	</div>
</body>
</html>