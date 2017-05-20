package br.com

class FabricanteController extends CrudController {
    def entity = Fabricante
    def query = {
        if(params.nome){
            ilike('nome',params.nome + "%")
        }
    }


}
