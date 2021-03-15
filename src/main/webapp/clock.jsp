<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <title>Clock</title>
    <style>
        .container {
            margin-top: 5vh;
        }
        .center {
            height: 80vh;
        }
        .one, .two, .three {
            height: 20vh;
            margin-bottom: 10vh;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row align-items-center">
            <div class="col-2 text-center">
                <div class="sequence">
                    <c:forEach items="${requestScope.accessSequence}" var="label" varStatus="indices">
                        <c:if test="${requestScope.index == indices.index}">
                            <h2 style="color: red"><c:out value="${label}"/></h2>
                        </c:if>
                        <c:if test="${requestScope.index != indices.index}">
                            <h2><c:out value="${label}"/></h2>
                        </c:if>
                    </c:forEach>
                </div>
            </div>

            <div class="col-8 border border-primary rounded-circle center">
                <div class="row one">
                    <div class="col text-center">
                        <div>
                        <c:if test="${requestScope.clockIndex == 0}">
                            <h1 style="color: red;">
                        </c:if>
                        <c:if test="${requestScope.clockIndex != 0}">
                            <h1>
                        </c:if>
                                <span><c:out value="${requestScope.buffer[0].label}"/></span>|
                                <span><c:out value="${requestScope.buffer[0].reference}"/></span>
                            </h1>
                        </div>
                    </div>
                </div>
                <div class="row two align-items-center">
                    <div class="col d-flex justify-content-start">
                        <div>
                            <c:if test="${requestScope.clockIndex == 3}">
                                <h1 style="color: red;">
                            </c:if>
                            <c:if test="${requestScope.clockIndex != 3}">
                                <h1>
                            </c:if>
                                <span><c:out value="${requestScope.buffer[3].label}"/></span>|
                                <span><c:out value="${requestScope.buffer[3].reference}"/></span>
                            </h1>
                        </div>
                    </div>
                    <div class="col d-flex justify-content-end">
                        <div>
                            <c:if test="${requestScope.clockIndex == 1}">
                                <h1 style="color: red;">
                            </c:if>
                            <c:if test="${requestScope.clockIndex != 1}">
                                <h1>
                            </c:if>
                                <span><c:out value="${requestScope.buffer[1].label}"/></span>|
                                <span><c:out value="${requestScope.buffer[1].reference}"/></span>
                            </h1>
                        </div>
                    </div>
                </div>
                <div class="row three align-items-end">
                    <div class="col text-center">
                        <div>
                            <c:if test="${requestScope.clockIndex == 2}">
                                <h1 style="color: red;">
                            </c:if>
                            <c:if test="${requestScope.clockIndex != 2}">
                                <h1>
                            </c:if>
                                <span><c:out value="${requestScope.buffer[2].label}"/></span>|
                                <span><c:out value="${requestScope.buffer[2].reference}"/></span>
                            </h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-2 text-center">
                <div class="sequence">
                    <c:forEach items="${requestScope.labels}" var="label" varStatus="indices">
                        <h2><c:out value="${label}"/></h2>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-2 offset-5">
                <button class="btn btn-primary" id="btn-clock">Next</button>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function () {
            $('#btn-clock').click(function () {
                $.ajax({
                    url: '/clockServlet',
                    method: 'post',
                    success: function (data) {
                        if (data === 'True')
                            location.reload()
                        else {
                            alert('Some error!');
                        }
                    }
                })
            });
        })
    </script>
</body>
</html>
