<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Main page</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.js"
            integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            padding: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-4 offset-4">
            <h1>Best-fit</h1>
            <a href="/bestFitServlet">get blocks</a>
            <br>
            <form method="post" action="/bestFitServlet">
                <div class="form-group">
                    <label for="size">Enter process size</label>
                    <input type="text" class="form-control" id="size" name="block">
                </div>
                <button type="button" class="btn btn-primary" id="btn-generate">Generate</button>
                <button type="button" class="btn btn-primary" id="btn-next">Next</button>
                <button type="button" class="btn btn-primary" id="btn-reset">Reset</button>
            </form>
            <br>
            <div id="generatedBlock" style="height: 50px; width: 0; background-color: purple"></div>
        </div>
    </div>
    <br>
    <div style="width: 10px; height: 10px; background-color: dodgerblue; display: inline-block"></div><span>Free space:</span>
    <c:forEach items="${requestScope.processes}" var="process" varStatus="loop">
        <c:if test="${loop.index % 2 == 0}">
            <span><c:out value="${process.value - process.usedSpace}"/>MB</span>
        </c:if>
    </c:forEach>
    <br>
    <div style="width: 10px; height: 10px; background-color: orange; display: inline-block"></div><span>Used space:</span>
    <c:forEach items="${requestScope.processes}" var="process" varStatus="loop">
        <c:if test="${loop.index % 2 == 0}">
            <span><c:out value="${process.usedSpace}"/>MB</span>
        </c:if>
    </c:forEach>
    <br>
    <div class="d-flex">
        <c:forEach items="${requestScope.processes}" var="process" varStatus="loop">
            <c:if test="${loop.index % 2 == 0}">
                <div style="width: ${process.value}px; height: 50px; background-color: dodgerblue">
                    <div style="width: ${process.usedSpace}px; height: 50px; display: inline-block; background-color: purple"></div>
                </div>
            </c:if>
            <c:if test="${loop.index % 2 == 1}">
                <div style="width: ${process.value}px; height: 50px; background-color: orange"></div>
            </c:if>
        </c:forEach>
    </div>
    <a href="/clockServlet">clock</a>
</div>

<script>
    $(document).ready(function () {
        $('#btn-generate').click(function () {
            let size = $('#size').val();
            if (size === "") {
                alert('Please enter some value')
                return
            }
            $('#generatedBlock').css("width", size);
        });

        $('#btn-next').click(function () {
            let size = $('#size').val()
            if (size === "") {
                alert('Please enter some value')
                return
            }
            $.ajax({
                url: '/bestFitServlet',
                method: 'post',
                data: {block: size, action: 'next'},
                success: function (data) {
                    if (data === 'True')
                        location.reload()
                    else {
                        alert('Process is too large');
                    }
                }
            })
        });

        $('#btn-reset').click(function () {
            $.ajax({
                url: '/bestFitServlet',
                method: 'post',
                data: {action: 'reset'},
                success: function (data) {
                    if (data === 'True')
                        location.reload()
                    else {
                        alert('Error');
                    }
                }
            })
        })

    })
</script>
</body>
</html>