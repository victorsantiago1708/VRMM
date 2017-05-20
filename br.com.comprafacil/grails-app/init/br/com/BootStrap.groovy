package br.com

class BootStrap {

    def init = { servletContext ->
        def adminRole = Role.findOrSaveByAuthority('ROLE_ADMIN')
        def clienteRole = Role.findOrSaveByAuthority('ROLE_CLIENTE')
        def fornecedorRole = Role.findOrSaveByAuthority('ROLE_FORNECEDOR')
        def user = Usuario.findByUsername('admin')
        def userCliente = Usuario.findByUsername('cliente')
        def userFornecedor = Usuario.findByUsername('fornecedor')

        if(!user){
            user = new Usuario(username: 'admin', password: 'admin')
            user.save(failOnError: true, flush: true)
            userCliente = new Usuario(username: 'cliente', password: 'cliente')
            userCliente.save(failOnError: true, flush: true)
            userFornecedor = new Usuario(username: 'fornecedor', password: 'fornecedor')
            userFornecedor.save(failOnError: true, flush: true)
        }

        if(!user.authorities.contains(adminRole)){
            UsuarioRole.create(user, adminRole)
        }
        if(!userCliente.authorities.contains(clienteRole)){
            UsuarioRole.create(userCliente, clienteRole)
        }
        if(!userFornecedor.authorities.contains(fornecedorRole)){
            UsuarioRole.create(userFornecedor, fornecedorRole)
        }
    }
    def destroy = {
    }
}
