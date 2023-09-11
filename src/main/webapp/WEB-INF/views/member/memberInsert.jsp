<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- /web/member/login.jsp -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보수정</title>
    <%@ include file="../include/head.jsp" %>
</head>
<body>
<%@ include file="../include/header.jsp" %>

<div class="content container">
    <form class="text-left clearfix form_row" action="${rootPath}/JoinPro.do" method="post" onsubmit="return inform(this)">
        <div class="columns ID">
            <input type="hidden" id="idck" value="no">
            <div class="column is-4">아이디는 영문 또는 숫자 4글자 이상, 16글자 이하</div>
            <div class="column is-4"><input type="text" class="input" id="id" name="id" aria-describedby="idStatus" pattern="^[A-Za-z0-9]{4,16}" maxlength="16" placeholder="아이디는 영문 또는 숫자 4글자 이상, 16글자 이하"></div>
            <div class="column"><button type="button" class="btn btn-primary mb-3" onclick="idcheck()">중복검사</button></div>
            <div class="column" id="idStatus">아이디 중복 검사를 진행해주세요</div>
        </div>

        <div class="columns PASSWORD">
            <input type="hidden" id="pwck" value="no">

            <div class="column is-4"><input type="password" class="input" id="pw" name="pw" required pattern="^[A-Za-z0-9]{4}" placeholder="비밀번호는 영문 또는 숫자 4글자 이상"></div>
            <div class="column is-4"><input type="password" class="input" id="pwchk" name="pwchk" placeholder="비밀번호 확인해주세요" required></div>
        </div>

        <div class="columns NAME">
            <div class="column is-2"><label for="name">name</label></div>
            <div class="column"><input type="text" class="input" id="name" name="name" placeholder="이름을 입력하세요"></div>
        </div>

        <div class="columns EMAIL&TEL&BIRTH">
            <div class="column"><input type="email" class="input" id="email" name="email" placeholder="이메일을 입력하세요"></div>
            <div class="column"><input type="tel" class="input" id="tel" name="tel" placeholder="전화번호를 입력하세요"></div>
            <div class="column"><input type="date" class="input" id="birth" name="birth" placeholder="생일을 입력하세요"></div>
        </div>

        <div class="columns ADDRESS1">
            <div class="column"><input type="text" class="input" id="address1" name="address1" placeholder="주소를 입력하세요."></div>
            <div class="column"><input type="text" class="input mt-10" id="postcode" name="postcode" placeholder="우편번호"></div>
            <div class="column"><button type="button" class="btn btn-primary  mt-10" onclick="findAddr()">우편번호 검색</button></div>
        </div>

        <div class="columns ADDRESS2">
            <div class="column"><input type="text" class="input" id="address2" name="address2" placeholder="상세주소를 입력하세요."></div>
        </div>

        <button type="submit" class="btn btn-main text-center">회원가입</button>

    </form>
</div>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
    $(document).ready(function(){
        $("#pwchk").keyup(function(){
            if($("#pw").val()===""||$("#pwchk").val()===""){
                console.log($("#pwchk").val())
                $("#pwStatus").html("<strong style='color: red'>비밀번호를 입력하세요.</strong>");
                $("#pwck").val("no");
            }
            else if($("#pw").val()==$("#pwchk").val()){
                $("#pwStatus").html("<strong style='color: green'>비밀번호가 일치합니다.</strong>");
                $("#pwck").val("yes");
            } else{
                $("#pwStatus").text("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                $("#pwck").val("no");
            }
        })

        $("#id").keyup(function(){
            $("#idck").val("no");
            $("#idStatus").text("아이디 중복 검사를 진행해주세요");
        })
    })

    function inform(frm){
        if($("#idck").val()!="yes"){
            alert("아이디 중복 검사를 진행하지 않았습니다.")
            $("#id").focus();
            return false;
        }
        if($("#pwck").val()!="yes"){
            alert("비밀번호를 다시 확인해주십시오.");
            $("#pw").focus();
            return false;
        }
    }

    function idcheck(){
        if($("#id").val()==""){
            alert("아이디를 입력하지 않았습니다.")
            $("#id").focus();
            return false;
        }
        var params = {id:$("#id").val()}
        $.ajax({
            url:"${headPath }/member/idCheck.do",
            type: "post",
            dataType: "json",
            data: params,
            success: function(data){
                var idPass = data.result;
                if(idPass===false){
                    $("#idck").val("no");
                    $("#idStatus").html("<strong style='color:red;'>사용할 수 없는 아이디 입니다.</strong>");
                    $("#id").focus();
                }
                else if(idPass){
                    $("#idck").val("yes");
                    $("#idStatus").html("<strong style='color:green;'>사용할 수 있는 아이디 입니다.</strong>");
                } else{
                    $("#idStatus").html("<strong style='color:red;'>아이디가 확인되지 않았습니다. 다시 시도하시길 바랍니다.</strong>");}
            }
        })
    }

    function findAddr(){
        new daum.Postcode({
            oncomplete:function(data){
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress;
                document.getElementById("postcode").value = data.zonecode;
                if(roadAddr !== ''){
                    document.getElementById("address1").value = roadAddr;
                } else if(jibunAddr !== ''){
                    document.getElementById("address1").value = jibunAddr;
                }
                document.getElementById("address2").focus();
            }
        }).open();
    }
</script>

<%@ include file="../include/footer.jsp"%>
</body>
</html>