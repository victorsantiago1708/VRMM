package br.com

import grails.transaction.Transactional
import org.springframework.security.core.context.SecurityContextHolder

@Transactional
class UsuarioService {
    def springSecurityService

    static Usuario getUsuarioLogado(){
        Usuario user = Usuario.findByUsername(SecurityContextHolder.getContext().getAuthentication().principal.getUsername())
        return user
    }
}
