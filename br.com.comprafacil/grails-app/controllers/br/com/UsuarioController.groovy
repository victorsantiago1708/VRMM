package br.com

import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import org.springframework.web.multipart.MultipartHttpServletRequest

class UsuarioController extends CrudController {
    def entity = Usuario

    def perfil(){
        Usuario user = Usuario.read(springSecurityService.currentUserId)
        render view: "index", model: ['entityInstance': user]
    }

//    def returnSave(boolean edit, boolean editPai,def entityInstance, LinkedHashMap model) {
//        if (!((edit || editPai) || !entityInstance.validate())) {
//            entityInstance = entity.newInstance()
//        }
//
//        model.put('user', entityInstance?.fullname)
//        model.put('avatar', entityInstance?.avatar?.filedata?.encodeAsBase64())
//        model.put('tipo', message(code:("usuario.role."+entityInstance?.authorities?.authority?.getAt(0))))
//
//        def offset = params.offset
//
//        if (params.dontSearch) {
//            model.put('entityInstanceList', entity.list())
//        }
//
//        render model as JSON
//    }

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
