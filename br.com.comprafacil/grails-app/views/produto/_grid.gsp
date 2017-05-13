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
                    <g:message code="default.acoes.label"/>
                </th>
            </tr>
        </thead>
        <tbody>
            <g:each in="${entityList}" var="produto">
                <tr>
                    <td>
                        ${produto?.nome}
                    </td>
                    <td>
                        ${produto?.descricao}
                    </td>
                    <td>
                        ${produto?.fabricante?.nome}
                    </td>
                    <td>
                        <a class="waves-effect waves-light btn red" href="${createLink(controller: 'produto', action: 'delete', id: produto?.id)}"><i class="fa fa-trash"></i></a>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>
