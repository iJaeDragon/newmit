<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴밋</title>
    <link rel="apple-touch-icon" sizes="57x57" href="/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192"  href="/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="/favicon/favicon-16x16.png">
    <link rel="manifest" href="/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <meta
            name="식자재 관리의 새로운 방법을 만나다, 뉴밋."
            content="식자재 관리와 요리의 즐거움을 일깨워 주는 서비스인 뉴밋은 레시피 공유, 식자재 관리등을 개성있게 할 수 있는 서비스 입니다."
    >
    <link rel="stylesheet" href="/styles/slick.css">
    <link rel="stylesheet" href="/styles/styles.css">
    <script src="/scripts/jquery-2.2.4.min.js"></script>
    <script src="/scripts/slick.min.js"></script>
    <script src="/scripts/scripts.js"></script>
    <script>
        window.onload = function () {
            commonUtil.enableToHeader(false);
            commonUtil.enableToFooter(false);

            if(userInfo["userNm"] != null) {
                document.getElementById("userNm").innerText = userInfo["userNm"];
            } else {
                window.location.href = "/login";
            }

        }
        function historyBack() {
            window.history.back();
        }
    </script>
</head>
<body>
<div class="wrap">
    <header class="effectUnset">
        <ul>
            <li><a href="javascript:historyBack();"><img src="/images/icons/ic-arrow-left.svg" alt=""></a></li>
        </ul>
    </header>
    <section>
        <div class="profile">
            <div class="imageUploader">
                <label>
                    <input type="file" accept="image/*" hidden>
                    <i class="ic-camera"></i>
                    <p>식자재 이미지를 추가해주세요</p>
                </label>
                <img class="imageUploaderImg" src="/images/food/temp.png" alt="">
            </div>
            <p class="user-name"><span id="userNm">ㅇㅇㅇ</span> 요리사님</p>
            <ul class="user-recipe">
                <%--<li>
                    <a href="">
                        <p>저장한 레시피</p>
                        <span>0</span>
                    </a>
                </li>
                <li>
                    <a href="">
                        <p>내가 본 레시피</p>
                        <span>0</span>
                    </a>
                </li>--%>
                <li>
                    <a href="/recipe/viewWrittenRecipeList">
                        <p>작성한 레시피</p>
                        <span><c:out value="${writtenRecipeCount}"/></span>
                    </a>
                </li>
            </ul>
            <ul class="list">
                <%--<li>
                    <a href="/food/foodCalendar.html"><span>식자재 달력</span></a>
                </li>
                <li>
                    <a href=""><span>개인정보 수정</span></a>
                </li>--%>
                <li>
                    <label>
                        <span>푸시 알림 받기</span>
                        <div class="ipt">
                            <div>
                                <label>
                                    <input type="checkbox" class="toggle">
                                </label>
                            </div>
                        </div>
                    </label>
                </li>
                <%--<li>
                    <a href=""><span>약관 및 개인정보 처리 동의</span></a>
                </li>--%>
                <li>
                    <a href=""><span>고객센터</span></a>
                </li>
                <c:if test="${userRole == '0'}">
                    <li>
                        <a href="/admin/viewFoodIngredientsManagement"><span>(관리자) 식자재 구분 관리</span></a>
                    </li>
                </c:if>
            </ul>
        </div>
    </section>
</div>
</body>
</html>