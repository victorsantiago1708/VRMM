<form onsubmit="save('${createLink(controller: 'usuario', action: 'save')}', this)" method="POST">
    <div class="row nopad" style="border-bottom: 1px solid #ccc;">
        <div class="col s8">
            <h1>
                <g:message code="usuario.label"/> <span >|</span> <g:message code="usuario.perfil.label"/>
            </h1>
        </div>
        <div class="col s4 center" style="margin-top: 51px">
            <a style="" class="waves-effect waves-light btn orange lighten-2" href="${createLink(controller: 'home', action: 'index')}"><g:message code="default.voltar.label"/> <i class="fa fa-arrow-left fa-1x"></i></a>
            <button style="" class="btn waves-effect waves-light red" type="submit" name="submit">
                <g:message code="default.save.label"/>
                <i class="fa fa-check fa-1x"></i>
            </button>
        </div>
    </div>
    <div class="row nopad">
        <div class="input-field col s4">
            <input id="username" name="username" type="text" value="${entityInstance?.username}">
            <label for="username"><g:message code="usuario.username.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="username">
                <span class="help-block">
                    <g:renderErrors bean="${entityInstance}" field="username"/>
                </span>
            </g:hasErrors>
        </div>
        <div class="input-field col s4">
            <input id="password" name="password" type="text" value="">
            <label for="password"><g:message code="usuario.password.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="password">
                <span class="help-block">
                    <g:renderErrors bean="${entityInstance}" field="password"/>
                </span>
            </g:hasErrors>
        </div>

        <div class="input-field col s4">
            <input id="tipo" name="tipo" disabled type="text" value='${message(code:("usuario.role."+entityInstance?.authorities?.authority?.getAt(0)))}'>
            <label for="password"><g:message code="usuario.tipo.label"/> </label>
        </div>
    </div>
</form>