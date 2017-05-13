// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better
// to create separate JavaScript files as needed.
//
//= require jquery-2.2.0.min
//= require_tree .
//= require_self

var novo;
var save;

if (typeof $ !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function() {
            $('.load').fadeIn();
            Materialize.updateTextFields();
        }).ajaxStop(function() {
            $('.load').fadeOut();
            Materialize.updateTextFields();
        });
    })($);

}

$(document).ready(function(){
    $("form").submit(function(e){
        e.preventDefault(e);
    });

    $(document).ajaxStop(function(){
        $("form").submit(function(e){
            e.preventDefault(e);
        });
    });
});


save = function(path, form){
    var dontSearch = true;
    var data = $(form).serialize()+"&dontSearch="+dontSearch;

    $.ajax({
        type: 'POST',
        data: data,
        url: path,
        success: function(data, textStatus) {
            $('#conteudo').html(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {}
    });

    return false;
};

novo = function(path){

    $.ajax({
        type:'POST',
        url: path,
        success:function(data, textStatus){
            $('#conteudo').html(data);
        },
        error:function(XMLHttpRequest,textStatus,errorThrown){

        }
    });

    return false;
};

