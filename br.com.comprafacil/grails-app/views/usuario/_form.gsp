<g:render template="/layouts/msg"/>
<form onsubmit="save('${createLink(controller: 'usuario', action: 'save')}', this)" method="POST">
    <input type="hidden" name="id" id="id" value="${entityInstance?.id}"/>
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
            <input id="fullname" name="fullname" type="text" value="${entityInstance?.fullname}">
            <label for="fullname"><g:message code="usuario.username.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="fullname">
                <span class="help-block error">
                    <g:renderErrors bean="${entityInstance}" field="fullname"/>
                </span>
            </g:hasErrors>
        </div>
        <div class="input-field col s4">
            <input id="password" name="password" type="text" value="">
            <label for="password"><g:message code="usuario.senha.label"/> </label>
            <g:hasErrors bean="${entityInstance}" field="password">
                <span class="help-block error">
                    <g:renderErrors bean="${entityInstance}" field="password"/>
                </span>
            </g:hasErrors>
        </div>

        <div class="input-field col s4">
            <input id="tipo" name="tipo" disabled type="text" value='${message(code:("usuario.role."+entityInstance?.authorities?.authority?.getAt(0)))}'>
            <label for="tipo"><g:message code="usuario.tipo.label"/> </label>
        </div>
    </div>
    <div class="row nopad">
        <div class="file-field input-field col s4">
            <div class="btn">
                <span><g:message code="usuario.avatar.label"/></span>
                <input type="file" id="file" name="file">
            </div>
            <div class="file-path-wrapper">
                <input class="file-path validate" type="text">
            </div>
        </div>
        <g:if test="${entityInstance?.avatar!=null}">
            <div class="col s4">
                <img class="responsive-img circle" id="userPhoto" src="data:image/png;bmp;jpg;base64,${entityInstance?.avatar?.filedata?.encodeBase64()}" style="width:80px;height:80px;"/>
            </div>
        </g:if>
    </div>
</form>