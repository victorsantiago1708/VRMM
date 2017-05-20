var openModalCotacao;
var cotar;

window.onload = function(){
    $('#modalAcaoCotar').modal();
    $(document).delegate('.cotar', 'click', openModalCotacao);
    $(document).delegate('.confirmarCotacao', 'click', cotar);
    Materialize.updateTextFields();
};


openModalCotacao = function(){
    var produtoID = $(this).attr("data-prod-id");
    var produtoNome = $(this).parents('tr').find('td:first')[0].innerText;

    $("#id").val(produtoID);
    $("#nomeProd").val(produtoNome);
    $("#quantidade").val("");
    $("#modalAcaoCotar").modal("open");
    Materialize.updateTextFields();
};


cotar = function(){
    var id = $("#id").val();
    var qtd = $("#quantidade").val();

    if(qtd != '' && qtd > 0){
        $.ajax({
            url: '/produto/cotar',
            type: 'POST',
            data: {id:id, quantidade: qtd},
            success: function(data){
                if(data.result == true || data.result == 'true'){
                    swal({
                        title: $("#successSwall").val(),
                        text: data.mensagem,
                        type: "success",
                        confirmButtonText: "Ok"
                    });
                    $("#modalAcaoCotar").modal("close");
                }else{
                    swal({
                        title: $("#erroSwall").val(),
                        text: data.mensagem,
                        type: "error",
                        confirmButtonText: "Ok"
                    });
                }
            }
        });
    }else{
        swal({
            title: $("#erroSwall").val(),
            text: $("#erroQtdMenorQueZero").val(),
            type: "error",
            confirmButtonText: "Ok"
        });
    }
};