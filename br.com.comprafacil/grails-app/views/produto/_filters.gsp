<div class="row nopad" style="border-bottom: 1px solid #ccc;">
    <div class="col s9">
        <h1>
            <g:message code="default.busca.label"/> <span >|</span> <g:message code="produto.label"/>
        </h1>
    </div>
    <div class="col s3 center-align">
        <a style="margin-top:25%;" class="waves-effect waves-light btn red" href="#" onclick="novo('${createLink(controller: 'produto', action: 'novo')}')">
            <g:message code="default.novo.label"/>
            <i class="fa fa-file fa-1x"></i>
        </a>
    </div>
</div>
<g:form name="myForm" url="[action:'list',controller:'produto']" class="col s12">
    <div class="row nopad">
        <div class="input-field col s3">
            <input id="nome" name="nome" type="text" >
            <label for="nome"><g:message code="produto.nome.label"/> </label>
        </div>
        <div class="input-field col s3">
            <input id="descricao" name="descricao" type="text" >
            <label for="descricao"><g:message code="produto.descricao.label"/> </label>
        </div>
        <div class="input-field col s3 m3">
            <select name="fabricante" id="fabricante" class="icons">
                <option value="" disabled selected><g:message code="default.selecione.label"/></option>
                <g:each in="${fabricantes}" var="fabricante">
                    <option value="${fabricante?.id}" data-icon="images/sample-1.jpg" class="circle">${fabricante?.nome}</option>
                </g:each>
            </select>
            <label><g:message code="produto.fabricante.label"/> </label>
        </div>
        <div class="col s3">
            <label class="labelSpace"> &nbsp; </label>
            <button class="btn waves-effect waves-light blue lighten-1" type="submit" name="action">
                <g:message code="default.pesquisar.label"/>
                <i class="fa fa-search fa-1x"></i>
            </button>
        </div>
    </div>
</g:form>