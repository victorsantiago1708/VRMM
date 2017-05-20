package br.com

class Produto {

    String nome
    String descricao
    String codigo

    static belongsTo = [fabricante: Fabricante]

    static constraints = {
        nome unique: true
        codigo unique: true
    }
}
