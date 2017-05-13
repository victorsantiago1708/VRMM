%{--verificar erros nos campos exp: ${entityInstance?.errors?.hasFieldErrors('descricao') --}%
<form onsubmit="save('${createLink(controller: 'produto', action: 'save')}', this)" method="POST">
    <div class="row nopad" style="border-bottom: 1px solid #ccc;">
        <div class="col s8">
            <h1>
                <g:message code="default.novo.label"/> <span >|</span> <g:message code="produto.label"/>
            </h1>
        </div>
        <div class="col s4 center" style="margin-top: 51px">
            <a style="" class="waves-effect waves-light btn orange lighten-2" href="${createLink(controller: 'produto', action: 'index')}"><g:message code="default.voltar.label"/> <i class="fa fa-arrow-left fa-1x"></i></a>
            <button style="" class="btn waves-effect waves-light red" type="submit" name="submit">
                <g:message code="default.save.label"/>
                <i class="fa fa-check fa-1x"></i>
            </button>
        </div>
    </div>
    <div class="row nopad">
        <div class="input-field col s3">
            ${renderErrors(bean: 'entityInstance', field:'nome')}
            <input id="nome" name="nome" type="text" value="${entityInstance?.nome}">
            <label for="nome"><g:message code="produto.nome.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="nome">
                <span class="help-block">
                    <g:renderErrors bean="${entityInstance}" field="nome"/>
                </span>
            </g:hasErrors>
        </div>
        <div class="input-field col s3">
            <input id="codigo" name="codigo" type="text" value="${entityInstance?.codigo}">
            <label for="nome"><g:message code="produto.codigo.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="codigo">
                <span class="help-block">
                    <g:renderErrors bean="${entityInstance}" field="codigo"/>
                </span>
            </g:hasErrors>
        </div>
        <div class="input-field col s3">
            <input id="descricao" name="descricao" type="text" value="${entityInstance?.descricao}">
            <label for="descricao"><g:message code="produto.descricao.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="descricao">
                <span class="help-block">
                    <g:renderErrors bean="${entityInstance}" field="descricao"/>
                </span>
            </g:hasErrors>
        </div>
        <div class="input-field col s3">
            <select name="fabricante" id="fabricante" class="icons">
                <option value="" disabled selected><g:message code="default.selecione.label"/></option>
                <g:each in="${fabricantes}" var="fabricante">
                    <option value="${fabricante?.id}" ${(entityInstance?.fabricante?.id == fabricante?.id)?'selected':''} data-icon="images/sample-1.jpg" class="circle">${fabricante?.nome}</option>
                </g:each>
            </select>
            <label><g:message code="produto.fabricante.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="fabricante">
                <span class="help-block">
                    <g:renderErrors bean="${entityInstance}" field="fabricante"/>
                </span>
            </g:hasErrors>
        </div>
    </div>
</form>

