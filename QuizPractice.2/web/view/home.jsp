<%-- 
    Document   : home
    Created on : Jun 13, 2022, 8:39:11 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Home Page</title>
        <!--=============================================================-->

        <!--==================Bootstrap css===========================-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

        <!--=============================================================-->

        <!--==================Fontawesome===========================-->
        <script src="https://kit.fontawesome.com/64bb7a6643.js" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <!--=============================================================-->

        <!--======================Jost-font==============================-->
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet" />
        <!--=============================================================-->

        <!--==========================Roboto-font===============================-->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet" />

        <!--=============================================================-->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Mono&display=swap" rel="stylesheet" />
        <!---===================MyCss================================-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/hompage.css" />
        <!--=============================================================-->

        <!--===================Swiper=====================================-->
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
        <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
        <script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
        <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
        <!--=============================================================-->
        <script src="https://kit.fontawesome.com/64bb7a6643.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <!--Navbar-->

        <!--end nav bar-->
        <jsp:include page="header.jsp"></jsp:include>

            <!--Slide show-->
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>

                <div class="container-fluid slide-show">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img class="d-block w-100" src="${pageContext.request.contextPath}/img/e-learning.svg" alt="First slide" height="400px" />
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/img/E BOOKS.svg" alt="Second slide" height="400px" />
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="${pageContext.request.contextPath}/img/educational resources.svg" alt="Third slide" height="400px" />
                    </div>
                </div>
            </div>



            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <!--Course List-->
        <div class="container course-list">
            <div class="row">
                <c:forEach items="${listLastQuiz}" var="lq">
                <div class="col-md-3">
                    <div class="card bg-light mb-3">
                        <div class="card-header" style="height: 50px;">${lq.quizName}</div>
                        <img class="card-img-top" src="${pageContext.request.contextPath}/img/asp-mvc.jpg" alt="Course Image" />
                        <div class="card-body">
                            <h6>${lq.ownerName}</h6>
                            <p class="card-text">${lq.dateCreated}</p>
                            <a href=""  class="btn btn-primary">View</a>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
            <div class="view-more" style="margin: 5% 45%;">
                <a href="#" class="btn btn-primary">View More</a>
            </div>
        </div>

        <script>
            const swiper = new Swiper(".swiper-container", {
                // Optional parameters
                slidesPerView: 3,
                centeredSlides: true,
                spaceBetween: 30,

                // If we need pagination
                pagination: {
                    el: ".swiper-pagination",
                    // type: 'fraction',
                },

                // Navigation arrows
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },

                // And if we need scrollbar
                scrollbar: {
                    el: ".swiper-scrollbar",
                },
            });
        </script>
        <script>
            $(function () {
                $('[data-toggle="popover"]').popover();
            });
        </script>
        <!---============================jquery=====================================-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
                integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
        <!---============================popper=====================================-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
                integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <!---============================min.js=====================================-->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
                integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    </body>

    <jsp:include page="footer.jsp"></jsp:include>


</html>

