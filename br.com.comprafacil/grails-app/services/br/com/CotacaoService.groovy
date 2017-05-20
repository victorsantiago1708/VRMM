package br.com

import grails.plugin.springsecurity.SpringSecurityService
import grails.transaction.Transactional

@Transactional
class CotacaoService {
    SpringSecurityService springSecurityService

    Boolean gerarCotacao(Produto produto, Integer quantidade){
        Cotacao cotacao = new Cotacao()
        cotacao.produto = produto
        cotacao.cliente = Usuario.read(springSecurityService.currentUserId)
        cotacao.quantidade = quantidade

        if(cotacao.errors.getErrorCount() < 1 && cotacao.validate()){
            if(cotacao.save(flush:true, failOnError:true)){
                return true
            }else{
                return false
            }
        }else{
            return false
        }
    }
}
