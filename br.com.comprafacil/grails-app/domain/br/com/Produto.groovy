package br.com

class Produto {

    String nome
    String descricao
    String codigo

    static belongsTo = [fabricante: Fabricante]

    static constraints = {
        fabricante nullable: true
    }
}
