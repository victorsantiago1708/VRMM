<html>
 <head>
     <meta name="layout" content="main"/>
 </head>
<body>
<g:render template="/layouts/menuTopo"/>
<div class="container" id="conteudo">
    <g:render template="grid"/>
</div>
<input type="hidden" id="erroQtdMenorQueZero" value="${message(code:'cotacao.erroQtdMenorQueZero.message')}"/>
<asset:javascript src="produto/produto.js"/>
</body>
</html>