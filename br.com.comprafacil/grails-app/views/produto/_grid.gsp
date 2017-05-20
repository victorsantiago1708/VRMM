<%@ page import="br.com.Role; br.com.Usuario" %>
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
                        <g:if test="${Usuario.hasAcesso(Role.findByAuthority('ROLE_FORNECEDOR'))}">
                            <a class="waves-effect waves-light btn red" href="${createLink(controller: 'produto', action: 'delete', id: produto?.id)}"><i class="fa fa-trash fa-1x"></i></a>
                            <a class="waves-effect waves-light btn red" href="#" onclick="edit('${createLink(controller: 'produto', action: 'edit', id: produto?.id)}')"><i class="fa fa-pencil fa-1x"></i></a>
                        </g:if>
                        <g:if test="${Usuario.hasAcesso(Role.findByAuthority('ROLE_CLIENTE'))}">
                            <a class="modal-trigger waves-effect waves-light btn red cotar" href="#" data-prod-id="${produto?.id}"><i class="fa fa-cart-plus fa-1x"></i></a>
                        </g:if>
                    </td>
                </tr>
            </g:each>
        </tbody>
    </table>
</div>
<div id="modalCotacao">
    <g:render template="modalCotacao"/>
</div>