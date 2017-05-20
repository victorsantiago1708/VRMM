package br.com

import grails.converters.JSON

class ProdutoController extends CrudController{
    def entity = Produto
    def cotacaoService

    def query = {
        println(params)

        if(params.nome){
            ilike('nome',params.nome+ "%")
        }
        if(params.descricao){
            ilike('descricao',params.descricao+ "%")
        }
        if(params.fabricante){
            eq('fabricante',Fabricante.get(params.fabricante))
        }
    }

    @Override
    def editaModelPadrao( def model ){
        List<Fabricante> fabricantes = Fabricante.findAll()
        model.put("fabricantes",fabricantes)
        return model
    }

    @Override
    def editaModelDoSave( def model ){
        model = editaModelPadrao(model)
        return model
    }

    @Override
    def editaModelDoEdit(def model){
        model = editaModelPadrao(model)
        return model
    }

    def editaModelDoList( def model ){
        model = editaModelPadrao(model)
        return model
    }

    @Override
    def editaModelDoNovo( def model ){
        model = editaModelPadrao(model)
        return model
    }

    def cotar(){
        def model = [:]
        if(params.id && params.quantidade){
            Integer qtd = params.quantidade as Integer
            Produto produto = Produto.read(params.id)
            if(cotacaoService.gerarCotacao(produto, qtd)){
                model.put('result', true)
                model.put('mensagem', message(code:'cotacao.cotacaoSuccess.message'))
            }else{
                model.put('result', false)
                model.put('mensagem', message(code:'cotacao.cotacaoError.message'))
            }
        }else{
            model.put('result', false)
            model.put('mensagem', message(code:'cotacao.cotacaoError.message'))
        }

        render model as JSON
    }

}
