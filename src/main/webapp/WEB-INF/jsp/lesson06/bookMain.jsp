<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>통나무 팬션</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>  

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

   <!--  <link rel="stylesheet" type="text/css" href="jQuery_quiz06_style.css">  --> 

<style>

#wrap {max-width: 1200px; margin:auto;}
#title {height: 100px;}
nav {height: 40px;
background-color:peru ;}
section {height: 300px;}
aside {background-color:sienna ;}
#sectionMain {background-color: chocolate;}
footer {height: 100px;}
.radioSection {height: 50px;}
.nav-link {color:white;}
.nav-link:hover {color: rgb(30, 13, 1);}

</style>


</head>

<body>
    <div id="wrap">
        <header class="d-flex justify-content-center">
            <div id="title" class="d-flex align-items-center">
                <h1>통나무 팬션</h1>
            </div>
        </header>
        <nav>
            <ul class="nav  nav-fill  font-weight-bold">
                <li class="nav-item">
                    <a href="#" class="nav-link ">팬션소개</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link ">객실보기</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link ">예약하기</a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link">예약목록</a>
                </li>
            </ul>
        </nav>
        <main>
            <article>
                <img src="/img/test06_banner1.jpg" id="mainBanner">
            </article>
            <section class="d-flex">
                <aside class="col-4 d-flex align-items-center justify-content-center">
                    <div class="text-white">
                        <h1>실시간<br>예약하기</h1>
                    </div>
                </aside>
                <article id="sectionMain" class="col-5 text-white">
                    <div class="d-flex align-items-baseline radioSection mt-4">
                        <h3>예약확인</h3>
                        <div class="d-flex col-4 justify-content-between">
                            <label>회원<input type="radio" name="member" value="yes" checked> </label>
                            <label>비회원<input type="radio" name="member" value="no"></label>
                        </div>
                    </div>

                    <div id="memberN" class="d-none">
                        <div class="d-flex col-11 justify-content-between align-items-center mb-3">
                            이름
                            <input type="text" id="name" class="form-control col-10">
                        </div>
                        <div class="d-flex col-11 justify-content-between align-items-center mb-3">
                            전화번호
                            <input type="text" id="phone" class="form-control col-10">
                        </div>
                        <div class="d-flex col-11 justify-content-between align-items-center mb-3">
                            날짜
                            <input type="text" class="form-control col-10" id="datepicker">
                        </div>
                    </div>

                    <div id="memberY">
                        <div class="d-flex col-11 justify-content-between align-items-center mb-3">
                            아이디
                            <input type="text" id="id" class="form-control col-10">
                        </div>
                        <div class="d-flex col-11 justify-content-between align-items-center mb-3">
                            비밀번호
                            <input type="password" id="password" class="form-control col-10">
                        </div>
                    </div>

                    <div class="col-11 d-flex justify-content-end">
                        <input type="button" class="btn bg-success text-white" id="lookUp" value="조회하기">
                    </div>
                </article>
                <aside class="col-3 d-flex align-items-center justify-content-center">
                    <div class="text-white">
                        <h4>예약문의:</h4>
                        <h2>010-<br>000-1111</h2>
                    </div>
                </aside>
            </section>
        </main>
        <footer>
            <div class="text-secondary mt-2">
                <small>
                    제주특별자치도 제주시 애월읍<br>
                    사업자등록번호: 111-22-25522 / 농어촌민박사업자지정 / 대표:<br>
                    Copyright 2025 All right reserved
                </small>
            </div>
        </footer>



    </div>

    <script>
        $(document).ready(function () {
            /////////////////////////////////////////
            let images = ["/img/test06_banner1.jpg", "/img/test06_banner2.jpg", "/img/test06_banner3.jpg", "/img/test06_banner4.jpg"];
            let imgNum = 1;
            function changeImg() {
                $("#mainBanner").attr("src", images[imgNum]);
                imgNum++;
                if (imgNum > 3 ) {
                    imgNum = 0;
                }
            }
            setInterval(changeImg, 3000);


            $("input[name=member]").on("change", function () {
                let memberCheck = $(this).val();

                if (memberCheck == "no") {
                    $("#memberN").removeClass("d-none");
                    $("#memberY").addClass("d-none");
                    return;
                }
                if (memberCheck == "yes") {
                    $("#memberY").removeClass("d-none");
                    $("#memberN").addClass("d-none");
                    return;
                }
            });

            $.datepicker.setDefaults({
                dateFormat: "yy년 mm월 dd일",
                dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                minDate: 0
            });
            $("#datepicker").datepicker();

            $("#lookUp").on("click", function () {
                let check = $("input[name='member']:checked").val();
                if (check == "yes") {
                    if ($("#id").val() == "") {
                        alert("아이디를 입력하세요.");
                        return;
                    }
                    if ($("#password").val() == "") {
                        alert("패스워드를 입력하세요.");
                        return;
                    }
                    alert("ID : " + $("#id").val());
                    return;
                }

                if (check == "no") {
                    let phoneNum = $("#phone").val();
                    if ($("#name").val() == "") {
                        alert("이름을 입력하세요.");
                        return;
                    }
                    if (phoneNum == "") {
                        alert("전화번호를 입력하세요.");
                        return;
                    }
                    if (!$("#datepicker").val()) {
                        alert("날짜를 고르세요.");
                        return;
                    }
                    if (phoneNum.slice(0, 3) != "010") {
                        alert("010으로 시작하는 번호만 입력 가능합니다.");
                        return;
                    }

                    alert("이름 : " + $("#name").val() + "\n전화번호 : " + phoneNum + "\n날짜 : " + $("#datepicker").val());
                    return;
                }
            });


            /////////////////////////////////////////
        });
    </script>

</body>

</html>

</body>
</html>