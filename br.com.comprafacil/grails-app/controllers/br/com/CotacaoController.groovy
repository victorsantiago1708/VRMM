package br.com

class CotacaoController extends CrudController{
    def entity = Cotacao
    def cotacaoService

    def query = {
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
    def editaModelDoList( def model ){
        List<Fabricante> fabricantes = Fabricante.findAll()
        model.put("fabricantes", fabricantes)
        return model
    }
}
