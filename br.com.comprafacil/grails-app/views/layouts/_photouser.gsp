<%@ page import="br.com.UsuarioService" %>

<g:if test="${UsuarioService.getUsuarioLogado()?.avatar || user!=null}">

        <a href="#">
            <div class="col s3">
                <img id="photoUser" style="width:35px;height:35px;vertical-align:-11px;" class="responsive-img circle" src="data:image/png;bmp;jpg;base64,${UsuarioService.getUsuarioLogado()?.avatar?.filedata?.encodeBase64()}"/>
            </div>
        </a>

</g:if>
<g:else>

        <a href="#" style="height: 62px;">
            <i class="fa fa-user-circle-o fa-3x" aria-hidden="true"></i>
        </a>

</g:else>