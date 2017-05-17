package br.com

class FabricanteController extends CrudController {
    def entity = Fabricante
    def query = { println (params)
        if(params.nome){
            ilike('nome',params.nome + "%")
        }
    }


}
