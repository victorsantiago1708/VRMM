<%@ page contentType="text/html;charset=UTF-8" %>

<g:if test='${flash.error}'>
	<script>
		swal({
			title: "${message( code: 'default.alert.label.title.erro' ).encodeAsJavaScript()}",
			text: "${flash.error.encodeAsJavaScript()}",
			type: 'error'
		});
	</script>
</g:if>
		
<g:if test='${flash.message}'>
	<script>
		swal({
			title: "${message( code: 'default.alert.label.title.mensagem' ).encodeAsJavaScript()}",
			text: "${flash.message.encodeAsJavaScript()}",
			type: 'success'
		});
	</script>
</g:if>

<g:if test='${flash.info}'>
	<script>
		swal({
			title: "${message( code: 'default.alert.label.title.info' ).encodeAsJavaScript()}",
			text: "${flash.info.encodeAsJavaScript()}",
			type: 'info'
		});
	</script>
</g:if>
		
<g:if test='${flash.warning}'>
	<script>
		swal({
			title: "${message( code: 'default.alert.label.title.atencao' ).encodeAsJavaScript()}",
			text: "${flash.warning.encodeAsJavaScript()}",
			type: 'warning'
		});
	</script>
</g:if>