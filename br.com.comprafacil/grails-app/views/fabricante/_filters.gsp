<div class="row nopad" style="border-bottom: 1px solid #ccc;">
    <div class="col s9">
        <h1>
            <g:message code="default.busca.label"/> <span >|</span> <g:message code="fabricante.label"/>
        </h1>
    </div>
    <div class="col s3 center" style="">
        <a style="margin-top:25%;" class="waves-effect waves-light btn red" href="#" onclick="novo('${createLink(controller: 'fabricante', action: 'novo')}')">
            <g:message code="default.novo.label"/>
            <i class="fa fa-file fa-1x"></i>
        </a>
    </div>
</div>
<form name="myForm" onsubmit="list('${createLink(controller: 'fabricante', action: 'list')}', this)" method="POST" class="col s12">
    <div class="row nopad">
        <div class="input-field col s3">
            <input id="nome" name="nome" type="text" >
            <label for="nome"><g:message code="fabricante.label"/> </label>
        </div>
        <div class="col s3">
            <label class="labelSpace"> &nbsp; </label>
            <button class="btn waves-effect waves-light blue lighten-1" type="submit" name="action">
                <g:message code="default.pesquisar.label"/>
                <i class="fa fa-search fa-1x"></i>
            </button>
        </div>
    </div>
</form>