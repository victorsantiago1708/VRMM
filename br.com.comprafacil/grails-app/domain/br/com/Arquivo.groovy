package br.com

class Arquivo {

    String nome
    byte[] filedata
    Date dataCriacao = new Date()

    static constraints = {
        nome(blank:false,nullable:false)
        filedata(blank: true, nullable:true)
    }

}
