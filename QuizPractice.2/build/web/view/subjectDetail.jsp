<%-- 
    Document   : DetailPage
    Created on : 17-Aug-2021
    Author     : PhatNK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Online Feast Booking</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/myStyle.css" type="text/css" />
        <link rel="stylesheet" href="css/detail.css" type="text/css" />
    </head>
    <body>
        <div class="container">
            <%--<jsp:include page="Header.jsp"/>--%>
            <!--top menu-->
            <div class="top-bar">
                <ul class="nav-top">
                    <li class="nav-top-items btn-success btn-rounded"><a href="home">Trang chủ</a></li>
                    <!--                    <li class="nav-top-items btn-rounded">Thực đơn</li>
                                        <li class="nav-top-items btn-rounded">Combo</li>
                                        <li class="nav-top-items btn-rounded">Dịch vụ</li>-->
                </ul>
                <!--                <div style="position: relative">
                                    <div class="cart">
                                        <i class="fa fa-shopping-cart" 
                                           style="font-size: 1rem"></i>
                                    </div>
                                    <span class="cart-count">0</span>
                                </div>-->
            </div>
            <div class="content">
                <!--slide show container-->
                <div class="slide-show">
                    <div class="slide-show-main">
                        <!--button previous-->
                        <div class="btn-previous"  
                             onclick="slideBtnHandler('previous')">
                            <div class="line-top"></div>
                            <div class="line-side"></div>
                        </div>
                        <!--main image-->
                        <div class="main-img">
                            <img id="main-img" src=${subject.image} >
                        </div>
                        <!--button next-->
                        <div class="btn-next" onclick="slideBtnHandler('next')"> 
                            <div class="line-top"></div>
                            <div class="line-side"></div>
                        </div>
                    </div>
                    <!--thumbnail slider-->
                    <ul id="slide-show-thumb">
                        <%--<c:forEach items="${listImg}" var="l" varStatus="loop">--%>
                        <li data-thumb-index="${loop.index}" 
                            id="list-${loop.index}" 
                            onclick="thumbClickHandler('list-${loop.index}')">
                            <img class="thumb-img" 
                                 src="${subject.image}" >
                        </li>
                        <%--</c:forEach>--%>
                    </ul>
                </div>
                <!--restaurant name, province and average rating-->
                <div style="margin: 50px 120px; text-align: left"> 
                    <div style="display: flex; align-items: center">
                        <h2 style="font-size: 1.6rem; margin: 0">${subject.subjectName}</h2>
                        <div class="rate">
                            <c:forEach varStatus="loop" begin="0" end="4">
                                <c:if test="${restaurantDetail.avgRate - loop.count >= 0}">
                                    <span style="color: gold"></span>
                                </c:if>
                                <c:if test="${restaurantDetail.avgRate lt loop.count}">
                                    <c:if test="${loop.count - restaurantDetail.avgRate <= 0.5 and loop.count - restaurantDetail.avgRate > 0}" >
                                        <span class="half"></span>
                                    </c:if>
                                    <c:if test="${loop.count - restaurantDetail.avgRate > 0.5}">
                                        <span></span>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <p style="font-size: 1rem; margin: 0"><i class="fa fa-map-marker" style="font-size: 1.5rem"></i>&emsp;${subject.description}</p>
                </div>
                <!--user feedback container-->
                <div class="feedback-form">
                    <div id="custom-message-box">
                    </div>
                    <h3>Subject Name :  ${subject.subjectName}</h3>
                    <div style="display: flex;align-items: center">
                        <div class="rate" style="width: 150px">
                            <c:forEach varStatus="loop" begin="0" end="4">
                                <c:if test="${restaurantDetail.avgRate - loop.count >= 0}">
                                    <span style="color: gold"></span>
                                </c:if>
                                <c:if test="${restaurantDetail.avgRate lt loop.count}">
                                    <c:if test="${loop.count - restaurantDetail.avgRate <= 0.5 and loop.count - restaurantDetail.avgRate > 0}" >
                                        <span class="half"></span>
                                    </c:if>
                                    <c:if test="${loop.count - restaurantDetail.avgRate > 0.5}">
                                        <span></span>
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                        <span><strong>${restaurantDetail.avgRate % 1 == 0 
                                        ? fn:substring(restaurantDetail.avgRate, 0, 1)   
                                        : fn:substring(restaurantDetail.avgRate, 0, 3)}/5</strong> 
                            dựa trên ${totalFeedback} đánh giá
                        </span>
                    </div>
                    <!--user comment form-->
                    <form  action="detail" method="POST" id="feedback-form" >
                        <div class="form-group">
                            <label for="comment"><strong>Đánh giá:</strong></label>
                            <textarea cols="25" 
                                      rows="3" 
                                      name="comment" 
                                      id="comment"
                                      value=""
                                      placeholder="Nhập đánh giá của bạn" 
                                      oninput="validateComment()">
                                ${userFeedback}
                            </textarea>
                            <p id="tooltip-comment">Hãy nhập</p>
                            <input type="hidden" name="id" value="${restaurantDetail.id}" >
                            <div class="radio-group">
                                <input type="radio" 
                                       id="star5" 
                                       name="rdbRate" 
                                       value="5">
                                <input type="radio" 
                                       id="star4" 
                                       name="rdbRate" 
                                       value="4">
                                <input type="radio" 
                                       id="star3" 
                                       name="rdbRate" 
                                       value="3">
                                <input type="radio" 
                                       id="star2" 
                                       name="rdbRate" 
                                       value="2">
                                <input type="radio" 
                                       id="star1" 
                                       name="rdbRate" 
                                       value="1" 
                                       checked="true">
                            </div>
                            <input id="hidden-submit" type="hidden" name="isSubmit" value="submit">
                            <button type="button" 
                                    class="btn-success btn-rounded"
                                    onclick="submitForm()">Đánh giá
                            </button>
                        </div>
                        <p style="text-align: left;
                           font-size: 0.7rem;
                           color: #666666;
                           margin-left: 100px;
                           margin-top: 0"><span id="char-count">0</span>/150 ký tự.
                        </p>
                        <div>
                            <input id="input-filter" type="hidden" name="filter" value="${filter}">
                            <button class="<c:if test="${filter eq ''}">btn-success</c:if> btn-rounded btn-rate" onclick="rateFilterHandler('')">Tất cả</button>
                            <button class="<c:if test="${filter eq 5}">btn-success</c:if> btn-rounded btn-rate" onclick="rateFilterHandler(5)">5 sao</button>
                            <button class="<c:if test="${filter eq 4}">btn-success</c:if> btn-rounded btn-rate" onclick="rateFilterHandler(4)">4 sao</button>
                            <button class="<c:if test="${filter eq 3}">btn-success</c:if> btn-rounded btn-rate" onclick="rateFilterHandler(3)">3 sao</button>
                            <button class="<c:if test="${filter eq 2}">btn-success</c:if> btn-rounded btn-rate" onclick="rateFilterHandler(2)">2 sao</button>
                            <button class="<c:if test="${filter eq 1}">btn-success</c:if> btn-rounded btn-rate" onclick="rateFilterHandler(1)">1 sao</button>
                            </div>
                        </form>
                        <!--restaurant feedback-->
                        <div class="comment" style="margin-bottom: 30px">
                        <c:if test="${listFeedback.size() == 0}">
                            <div class="no-result" 
                                 style="font-size: 1rem; width: 70%" >
                                Không có kết quả
                            </div>
                        </c:if>
                        <c:forEach items="${listFeedback}" var="item">
                            <div style="text-align: left; margin-top: 20px; margin-bottom: 30px;">
                                <h4 style="margin: 5px 0">
                                    <i class="fa fa-user-circle" 
                                       style="color: lightgray; margin-right: 5px;">
                                    </i>
                                    ${item.userName}
                                </h4>
                                <div class="comment-rate">
                                    <c:forEach varStatus="loop" begin="0" end="4">
                                        <c:if test="${item.userRate - loop.count >= 0}">
                                            <span style="color: gold"></span>
                                        </c:if>
                                        <c:if test="${item.userRate lt loop.count}">
                                            <span></span>
                                        </c:if>
                                    </c:forEach>
                                </div>
                                <p style="margin: 10px 0"><i>"${item.feedback}"</i></p>
                                <p style="margin: 5px 0">${item.feedbackDate}</p>
                            </div>
                        </c:forEach>
                    </div>
                    <!--paging control-->
                    <c:if test="${maxPage gt 1}">
                        <form id="pagingnation-form" action="detail" method="POST">
                            <div class="pagination">    
                                <button type="button" 
                                        onclick="pagingHandle(${pageIndex})" 
                                        class="btn-success rounded-50"
                                        >Trang trước
                                </button>
                                <input type="hidden" 
                                       id="index" 
                                       name="index"
                                       value="${pageIndex}">
                                <c:forEach varStatus="loop" begin="1" end="${maxPage}">
                                    <div class="pagination-index">
                                        <span class="<c:if test="${loop.index eq pageIndex}">pagination-active</c:if>" 
                                              style="padding: 20px"
                                              >${loop.index}
                                        </span>
                                    </div>
                                </c:forEach>
                                <button type="button" 
                                        onclick="pagingHandle(${pageIndex}, ${maxPage})" 
                                        class="btn-success rounded-50"  
                                        >Trang sau
                                </button>
                                <input type="hidden"
                                       name="id" 
                                       value="${restaurantDetail.id}">      
                                <input type="hidden"
                                       id="hidden-comment"
                                       name="comment"
                                       value="">
                                <input type="hidden"
                                       id="hidden-rate"
                                       name="rdbRate"
                                       value="${userRate}">
                                <input type="hidden"
                                       name="filter"
                                       value="${filter}">
                                <input type="hidden"
                                       name="isSubmit"
                                       value="none">
                            </div>
                        </form>
                    </c:if>
                </div>
            </div>
            <%--<jsp:include page="Footer.jsp"/>--%>
        </div>
        <script>
            document.getElementById("comment").value =
                    document.getElementById("comment").value.trim();
            const contextPath = "<%=request.getContextPath()%>";
            let resId = "<%=request.getParameter("id")%>";
            let filterRate = "<%=request.getAttribute("rate")%>";
            var currentListElement = document.getElementById("list-0");
            const listImage = new Array();
            <c:forEach items="${listImg}" var="item" varStatus="loop">
            listImage[${loop.index}] = "${item.imgSource}";
            </c:forEach>;
//            document.getElementById("main-img").setAttribute("src", listImage[0]);
            currentListElement.classList.add("active");
            (() => {
                let userRate = "<%=request.getAttribute("userRate")%>";
                switch (userRate) {
                    case '5':
                    {
                        document.getElementById("star5").checked = true;
                        break;
                    }
                    case '4':
                    {
                        document.getElementById("star4").checked = true;
                        break;
                    }
                    case '3':
                    {
                        document.getElementById("star3").checked = true;
                        break;
                    }
                    case '2':
                    {
                        document.getElementById("star2").checked = true;
                        break;
                    }
                    case '1':
                    {
                        document.getElementById("star1").checked = true;
                        break;
                    }
                }
            })();
            (() => {
                if ("<%=request.getAttribute("insertSuccess")%>" !== 'null') {
                    let messBox = document.getElementById("custom-message-box");
                    if ("<%=request.getAttribute("insertSuccess")%>" === 'true') {
                        messBox.innerHTML =
                                '<i class="fa fa-check-circle" style="margin-right: 10px"></i>'
                                + "Đánh giá thành công";
                        messBox.style.backgroundColor = "#DFF0D8";
                        messBox.style.borderColor = "#D6E9C6";
                        messBox.style.color = "#3C763D";
                    } else {
                        messBox.innerHTML =
                                '<i class="fa fa-window-close-o" style="margin-right: 10px"></i>'
                                + "Đánh giá thất bại";
                        messBox.style.backgroundColor = "#F2DEDE";
                        messBox.style.borderColor = "#EBCCD1";
                        messBox.style.color = "#A94442";
                    }
                    messBox.style.display = 'block';
                    setTimeout(function () {
                        messBox.style.display = 'none';
                    }, 3000);
                }
            })();
            (() => {
                if ("<%=request.getParameter("isSubmit")%>" !== 'null')
                    window.scroll(0, findPosition(document.getElementById("feedback-form")));
            })();
            function findPosition(obj) {
                var currenttop = 0;
                if (obj.offsetParent) {
                    do {
                        currenttop += obj.offsetTop;
                    } while ((obj = obj.offsetParent));
                    return currenttop - 350;
                }
            }
            function thumbClickHandler(elementId) {
                let ele = document.getElementById(elementId);
                let index = ele.getAttribute("data-thumb-index");
                currentListElement.classList.remove("active");
                currentListElement = ele;
                currentListElement.classList.add("active");
//                document.getElementById("main-img").setAttribute("src", listImage[index]);
            }

            function slideBtnHandler(btn) {
                let index = parseInt(currentListElement.getAttribute("data-thumb-index"));
                if (btn === 'next') {
                    index = index === listImage.length - 1 ? 0 : ++index;
                } else {
                    index = index === 0 ? listImage.length - 1 : --index;
                }
                thumbClickHandler('list-' + index);
            }
            function pagingHandle(index, max) {
                if (typeof max === 'undefined') {
                    --index;
                } else {
                    ++index;
                }
                if (index < 1 || index > max)
                    return;
                document.getElementById("hidden-comment").value =
                        document.getElementById("comment").value.trim();
                document.getElementById("hidden-rate").value =
                        document.getElementById("star5").checked ? '5'
                        : document.getElementById("star4").checked ? '4'
                        : document.getElementById("star3").checked ? '3'
                        : document.getElementById("star2").checked ? '2'
                        : '1';
                document.getElementById("index").value = index;
                document.getElementById("pagingnation-form").submit();
            }

            function rateFilterHandler(number) {
                document.getElementById("input-filter").value = number;
                document.getElementById("hidden-submit").value = 'none';
                document.getElementById("comment").value =
                        document.getElementById("comment").value.trim();
                document.getElementById('feedback-form').submit();
            }

            function validateComment() {
                let txta = document.getElementById("comment");
                let myTooltip = document.getElementById("tooltip-comment");
                let isValid = true;
                document.getElementById("char-count").textContent = txta.value.trim().length;
                if (txta.value.trim().length > 150) {
                    myTooltip.textContent = 'Đánh giá quá dài. Tối đa 150 ký tự';
                    isValid = false;
                    if (myTooltip.style.display === 'none') {
                        setTimeout(function () {
                            myTooltip.style.display = 'none';
                        }, 5000);
                    }
                    myTooltip.style.display = 'block';
                } else {
                    isValid = true;
                    myTooltip.style.display = 'none';
                }
                return isValid;
            }

            function submitForm() {
                let txta = document.getElementById("comment");
                let myTooltip = document.getElementById("tooltip-comment");
                txta.value = txta.value.trim();
                if (txta.value === '') {
                    myTooltip.textContent = 'Bạn chưa nhập đánh giá';
                    if (myTooltip.style.display === 'none') {
                        setTimeout(function () {
                            myTooltip.style.display = 'none';
                        }, 5000);
                    }
                    myTooltip.style.display = 'block';
                } else if (validateComment()) {
                    document.getElementById("hidden-submit").value = 'submit';
                    document.getElementById('feedback-form').submit();
                }
            }
        </script>
    </body>
</html>

