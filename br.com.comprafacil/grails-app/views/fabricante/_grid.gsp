<g:render template="filters"/>
<div class="row nopad">
    <table class="striped ">
        <thead>
        <tr>
            <th width="80%">
                <g:message code="fabricante.label"/>
            </th>
            <th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${entityList}" var="fabricante">
            <tr>
                <td>
                    ${fabricante?.nome}
                </td>
                <td>
                    <a class="waves-effect waves-light btn red" href="#" onclick="edit('${createLink(controller: 'fabricante', action: 'edit', id: fabricante?.id)}')"><i class="fa fa-pencil fa-1x"></i></a>
                    <a class="waves-effect waves-light btn red" href="${createLink(controller: 'fabricante', action: 'delete', id: fabricante?.id)}"><i class="fa fa-trash fa-1x"></i></a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</div>