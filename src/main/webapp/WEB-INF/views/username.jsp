<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/20
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<input type="text" name="username" id="username"><span id="namespan"></span>

<script>

    (function () {

        function createXmlHttp() {
            var xmlHttp = null;
            if (window.ActiveXObject) {
                xmlHttp = new ActiveXObject("microsoft.XMLHTTP");
            } else {
                xmlHttp = new XMLHttpRequest();
            }
            return xmlHttp;
        }

        document.querySelector("#username").onchange = function () {
            var xmlHttp = createXmlHttp();
            var username = this.value;
            var url = "/registname?username="+encodeURIComponent(username);
//            var url = "/registname?username=" + encodeURIComponent(username) + "&" + new Date().getTime();
            xmlHttp.open("get", url);
            console.log(111);
            xmlHttp.onreadystatechange = function () {
                var readystste = xmlHttp.readyState;
                console.log(readystste);
                if (4 == readystste) {
                    var status = xmlHttp.status;
                    if (200 == status) {
                        var responseText = xmlHttp.responseText;
                        if ("yes" == responseText) {
                            document.querySelector("#namespan").innerText = "该用户名可以使用";
                        } else {
                            document.querySelector("#namespan").innerText = "该用户名已存在";
                        }
                    } else {
                        alert("服务器请求异常");
                    }
                }
            }

            xmlHttp.send();

        }

    })();

</script>

</body>
</html>
