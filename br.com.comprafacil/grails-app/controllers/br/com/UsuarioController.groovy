package br.com

import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class UsuarioController extends CrudController {
    def entity = Usuario

    def perfil(){
        Usuario user = Usuario.read(springSecurityService.currentUserId)
        render view: "index", model: ['entityInstance': user]
    }

    def beforeSave(def entityInstance, def model){
        MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest)request
        MultipartFile file = null

        mRequest.getFileNames()?.each{
             file = mRequest.getFile(it)
        }

        if(file!=null){
            Usuario user = Usuario.read( springSecurityService.getCurrentUserId() )
            Arquivo foto = new Arquivo()
            foto.nome = file.getOriginalFilename()
            foto.filedata = file.getBytes()
            user.avatar = foto
            user.save(flush: true, failOnError: true)
        }

    }

}
