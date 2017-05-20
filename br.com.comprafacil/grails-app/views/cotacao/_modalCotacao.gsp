<div id="modalAcaoCotar" class="modal modal-fixed-footer" style="width: 30%;text-align: center">
    <div class="modal-content">
        <h4><g:message code="cotacao.label"/></h4>
        <br/>
        <input type="hidden" id="id" name="id" value=""/>
        <div class="input-field" style="width: 80%;">
            <input id="nomeProd" name="nomeProd" type="text" value="${produto?.nome}">
            <label for="nomeProd"><g:message code="produto.nome.label"/> </label>
        </div>
        <div class="input-field" style="width: 80%;">
            <input type="number" id="quantidade" name="quantidade" type="text" value="">
            <label for="quantidade"><g:message code="cotacao.produto.quantidade.label"/> </label>
        </div>
    </div>
    <div class="modal-footer">
        <button style="margin-left:10px;" class="waves-effect red waves-light btn confirmarCotacao"><g:message code="default.button.confirmar"/></button>
        <a href="#!" class="modal-action modal-close waves-effect waves-light btn-flat "><g:message code="default.button.sair"/></a>
    </div>
</div>