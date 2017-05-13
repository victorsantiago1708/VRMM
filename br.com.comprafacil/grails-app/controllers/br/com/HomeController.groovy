package br.com

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class HomeController{
    SpringSecurityService springSecurityService
    
    def index(){
        def model = [:]
        Usuario user = Usuario.read(springSecurityService.currentUser.id)
        model.put("user", user)
        model.put("tipoUsuario", user?.authorities?.authority)
        render(view: "index", model: model)
    }
}
