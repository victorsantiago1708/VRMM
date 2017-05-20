package br.com

import grails.plugin.springsecurity.SpringSecurityService
import grails.plugin.springsecurity.annotation.Secured

class HomeController{
    SpringSecurityService springSecurityService
    
    def index(){
        render(view: "index")
    }
}
