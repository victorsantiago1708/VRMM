<%--
  Created by IntelliJ IDEA.
  User: RavTecnologia
  Date: 09/05/2017
  Time: 11:28
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
    <meta name="layout" content="main"/>
</head>
<body>
    <g:render template="/layouts/menuTopo"/>
    <asset:javascript src="usuario/usuario.js"/>
    <div class="container" id="conteudo">
        <g:render template="form"/>
    </div>

</body>
</html>