package br.com

class Cliente {
    String nome
    String cpf
    String endereco
    String telefone
    String email

    static belongsTo = [usuario: Usuario]

    static constraints = {
    }
}
