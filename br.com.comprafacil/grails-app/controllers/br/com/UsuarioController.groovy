package br.com

import org.springframework.web.multipart.commons.CommonsMultipartFile

class UsuarioController extends CrudController {
    def entity = Usuario

    def perfil(){

    }

    def uploadAvatar(){
        CommonsMultipartFile file = request.getFile('file')
        Usuario user = Usuario.read( springSecurityService.getCurrentUserId() )
        Arquivo foto = new Arquivo()
        foto.nome = file.originalFilename
        foto.filedata = file.getBytes()
        user.avatar = foto
        user.save(flush: true, failOnError: true)
    }
}
