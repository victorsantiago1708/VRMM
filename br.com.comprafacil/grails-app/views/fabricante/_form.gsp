<g:render template="/layouts/msg"/>
<form onsubmit="save('${createLink(controller: 'fabricante', action: 'save')}', this)" method="POST">
    <div class="row nopad" style="border-bottom: 1px solid #ccc;">
        <div class="col s8">
            <h1>
                <g:message code="default.novo.label"/> <span >|</span> <g:message code="fabricante.label"/>
            </h1>
        </div>
        <div class="col s4 center" style="margin-top: 51px">
            <a style="" class="waves-effect waves-light btn orange lighten-2" href="${createLink(controller: 'fabricante', action: 'index')}"><g:message code="default.voltar.label"/> <i class="fa fa-arrow-left fa-1x"></i></a>
            <button style="" class="btn waves-effect waves-light red" type="submit" name="submit">
                <g:message code="default.save.label"/>
                <i class="fa fa-check fa-1x"></i>
            </button>
        </div>
    </div>
    <div class="row nopad">
        <div class="input-field col s3">
            ${renderErrors(bean: 'entityInstance', field:'nome')}
            <input id="nome" name="nome" type="text" class="${entityInstance?.errors?.hasFieldErrors('nome')? 'error':''}" value="${entityInstance?.nome}">
            <label for="nome"><g:message code="fabricante.nome.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="nome">
                <span class="help-block error">
                    <g:renderErrors bean="${entityInstance}" field="nome"/>
                </span>
            </g:hasErrors>
        </div>