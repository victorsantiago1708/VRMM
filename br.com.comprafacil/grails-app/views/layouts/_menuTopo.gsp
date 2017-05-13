<%@ page import="br.com.Role; br.com.Usuario" %>
<div class="navbar-fixed blue darken-2">
    <nav class="blue darken-2">
        <div class="nav-wrapper blue darken-2">
            <sec:ifLoggedIn>
                <a href="${createLink(controller: "home", action: "index")}" class="brand-logo"><g:message code="comprafacil.label"/> </a>
                <ul class="left hide-on-med-and-down" style="margin-left: 250px;">
                    <g:if test="${Usuario.hasAcesso(Role.findByAuthority('ROLE_ADMIN'))}">
                        <li><a href="${createLink(controller: "produto", action: "index")}" style="text-transform: capitalize"><g:message code="menu.item.produtos.label"/></a></li>
                    </g:if>
                </ul>
                <ul class="right hide-on-med-and-down">
                    <li><a href="#" style="text-transform: capitalize"><sec:loggedInUserInfo field="username" /></a></li>
                    <li><a href="${createLink(controller: "user", action: "perfil")}"><g:message code="menu.item.perfil.label"/> <i class="fa fa-user"></i></a></li>
                    <li>
                        <g:link controller="logout" >${message(code: 'menu.item.sair.label')} <i class="fa fa-power-off"></i></g:link>
                    </li>
                </ul>
            </sec:ifLoggedIn>
        </div>
    </nav>
</div>