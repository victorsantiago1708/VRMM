package br.com

class Pedido {
    Long codigo
    Double total

    static belongsTo = [cliente: Cliente]
    static hasMany = [itens: Item]

    static constraints = {
    }
}
