package br.com

class Cotacao {

    Produto produto
    Integer quantidade
    Double preco
    CotacaoStatus status = CotacaoStatus.ANDAMENTO

    static belongsTo = [cliente: Usuario]

    static constraints = {
        preco nullable: true
    }
}
