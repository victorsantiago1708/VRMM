package br.com

class Pedido {
    Long codigo
    Double total
    Integer quantidade

    static belongsTo = [cliente: Usuario]
    static hasMany = [itens: Item]

    static constraints = {
    }
}
