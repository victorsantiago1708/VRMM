package br.com

import grails.plugin.springsecurity.SpringSecurityService

class CrudController{
    SpringSecurityService springSecurityService
    def sessionFactory

    def index(){
        list()
    }

    def getEntityInstance(){
        if(params.id){
            return entity.get( params.id )
        }else{
            def entityInstance = entity.newInstance()
            entityInstance.properties = params
            return entityInstance
        }
    }

    def list(){
        def model = beforeList()?:[:]
        if(entity){
            def result = entity.createCriteria().list(query)
            def entityList = result
            def entityListCount = entityList?.size()

            model.put("entityList", entityList)
            model.put("entityListCount", entityListCount)
            model = editaModelDoList(model)
            render(view: 'index', model: model)
        }


    }

    def editaModelPadrao( def model ){
        model
    }

    def editaModelDoNovo( def model ){
        model
    }

    def editaModelDoList( def model ){
        model
    }

    def editaModelDoEdit( def model ){
        model
    }

    def editaModelDoSave( def model ){
        model
    }

    def beforeList (){}

    def novo() {
        flash.clear()
        def filters = params
        def offset = params.offset
        def model = [entityInstance: entity.newInstance(params)]

        model = editaModelDoNovo( model )

        render( template: "form", layout: "ajax" , model: model, filters: filters, offset: offset )
    }

    def edit() {
        flash.clear()
        def entityInstance = entity.get(params.id)
        def offset = params.offset
        def model = [entityInstance: entityInstance, offset: offset]

        model = editaModelDoEdit( model )

        render(template: "form", layout: "ajax", model: model )
    }

    def beforeSave(def entityInstance, def model){}

    def delete(){
        def entityInstance = getEntityInstance()
        try {
            entityInstance.delete(flush: true)
            println("teste")
            flash.message = message(code:'default.deleteSuccess.message')
        }catch (Exception e){
            flash.message = message(code:'default.cantDelete.message')
        }
        redirect(controller: entity, action: "list")
    }

    def save() {
        flash.clear()
        def model = [:]
        def entityInstance
        boolean edit = params.id ? true:false
        boolean editPai = params.editPai ? true:false
        entityInstance = getEntityInstance()

        if( edit && entityInstance.hasProperty( 'isEditavel' ) && entityInstance.isEditavel == false )
        {
            flash.error = message( code: 'default.dont.edit.message' )
        }
        else
        {
            beforeSave( entityInstance, model )
            if( entityInstance.errors.getErrorCount() < 1 && entityInstance.validate() )
            {
                if (entityInstance.save(flush: true)) {
                    afterSave(entityInstance, model)
                    if(edit){
                        flash.message = message(code: 'default.updated.message')
                    }else{
                        flash.message = message(code: 'default.created.message')
                    }
                }else{
                    if(edit){
                        flash.error = message(code: 'default.dont.updated.message')
                    }else{
                        flash.error = message(code: 'default.dont.created.message')
                    }
                }
            }
            else{
                entityInstance.errors?.each{
                    def error = it
                    error.getFieldErrors()?.each{
                        String messageCode = it.getArguments()[1] + "." + it.getField() + "." + it.getCode() + "." + "error"
                        println(message(code: messageCode).toString())
                    }

                }

                afterInvalido( entityInstance, model )
            }
        }

        model = editaModelDoSave( model )

        returnSave( edit, editPai, entityInstance, model)
    }

    def returnSave(boolean edit, boolean editPai,def entityInstance, LinkedHashMap model) {
        if (!((edit || editPai) || !entityInstance.validate())) {
            entityInstance = entity.newInstance()
        }
        model.put('entityInstance', entityInstance)
        def offset = params.offset
        if (params.dontSearch) {
            model.put('entityInstanceList', entity.list())
        }
        render(template: "form", layout: "ajax", model: model, offset: offset)
    }

    def afterInvalido( def entityInstance, def model ){}

    def afterSave(  def entityInstance, def model){}
}
