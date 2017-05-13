package br.com

class ProdutoController extends CrudController{
    def entity = Produto

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
    def beforeList () {
        def model=[:]
        List<Fabricante> fabricantes = Fabricante.findAll()
        model.put("fabricantes",fabricantes)

        return model
    }

    @Override
    def editaModelPadrao( def model ){
        List<Fabricante> fabricantes = Fabricante.findAll()
        model.put("fabricantes",fabricantes)
        return model
    }

    @Override
    def editaModelDoSave( def model ){
        model = editaModelDoNovo(model)
        return model
    }

    @Override
    def editaModelDoNovo( def model ){
        model = editaModelPadrao(model)
        return model
    }

}
