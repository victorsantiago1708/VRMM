package br.com

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

@Secured('ROLE_ADMIN')
class HomeController{
    SpringSecurityService springSecurityService
    
    def index(){
        render(view: "index")
    }
}
