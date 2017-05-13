package br.com

class BootStrap {

    def init = { servletContext ->
        def adminRole = Role.findOrSaveByAuthority('ROLE_ADMIN')
        def user = Usuario.findByUsername('admin')

        if(!user){
            user = new Usuario(username: 'admin', password: 'admin')
            user.save(failOnError: true, flush: true)
        }

        if(!user.authorities.contains(adminRole)){
            UsuarioRole.create(user, adminRole)
        }
    }
    def destroy = {
    }
}
