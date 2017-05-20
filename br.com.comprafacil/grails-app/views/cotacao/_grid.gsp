<g:render template="filters"/>
<div class="row nopad">
    <table class="striped ">
        <thead>
        <tr>
            <th>
                <g:message code="produto.nome.label"/>
            </th>
            <th>
                <g:message code="produto.descricao.label"/>
            </th>
            <th>
                <g:message code="produto.fabricante.label"/>
            </th>
            <th>
                <g:message code="cotacao.status.label"/>
            </th>
            <th>
                <g:message code="default.acoes.label"/>
            </th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${entityList}" var="cotacao">
            <tr>
                <td>
                    ${cotacao?.produto?.nome}
                </td>
                <td>
                    ${cotacao?.produto?.descricao}
                </td>
                <td>
                    ${cotacao?.produto?.fabricante?.nome}
                </td>
                <td>
                    ${cotacao?.status}
                </td>
                <td>
                    <a class="modal-trigger waves-effect waves-light btn red cotar" href="#" data-prod-id="${cotacao?.id}"><i class="fa fa-list fa-1x"></i></a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>
