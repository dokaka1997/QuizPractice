<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subject List</title>
        <link rel="stylesheet" href="./css/myStyle.css" type="text/css" />
    </head>
    <body>
        <div class="container">
            <%--<jsp:include page="header.jsp"/>--%>
            <div class="content">

                <div class="my-gallery">
                    <h2 style="text-align: left; margin: 40px 0 0 20px;">List Subject:</h2>
                    <c:forEach items="${listSubject}" var="l">
                        <div class="gallery-item">
                            <div class="gallery-img_preview">
                                <img  src="${l.image}">
                            </div>
                            <div class="gallery-item_content">
                                <h4 style="margin: 5px">${l.subjectName}</h4>
                                <div class="item-overlay">
                                    <div class="bg-overlay"></div>
                                    <a class="btn-overlay" href="<%= request.getContextPath()%>/SubjectDetailController?id=${l.subjectId}">Xem</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <c:if test="${maxPage gt 1}">
                <div class="pagination">    
                    <button onclick="pagingHandle(${pageIndex})" class="btn-success rounded-50">Trang trước</button>
                    <c:forEach varStatus="loop" begin="1" end="${maxPage}">
                        <span class="pagination-index <c:if test="${loop.index eq pageIndex}">pagination-active</c:if>">${loop.index}</span>

                    </c:forEach>
                    <button onclick="pagingHandle(${pageIndex}, ${maxPage})" class="btn-success rounded-50"  >Trang sau</button>
                </div>
            </c:if>
            <%--<jsp:include page="footer.jsp"/>--%>
        </div>

        <script>
            const contextPath = "<%=request.getContextPath()%>";
            function pagingHandle(index, max) {
                if (typeof max === 'undefined') {
                    --index;
                } else {
                    ++index;
                }
                if (index < 1 || index > max)
                    return;
                window.location.href = contextPath + "/GetAllSubjectController?index=" + index;
            }
        </script>
    </body>
</html>
