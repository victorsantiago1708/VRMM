
var logar;

window.onload = function(){
    $(document).delegate("#logar","click", logar);
    $(document).delegate("#senha", "keyup", function(e){ if(e.keyCode==13){ logar(); } })
    Materialize.updateTextFields();
};

logar = function(){
    if( $("#username").val() != "" && $("#senha").val() != "" ){
        var url = '/login/authenticate';

        console.log($("#username").val());
        console.log($("#senha").val());

        $.ajax({
            url: url,
            data: {username: $("#username").val(), password: $("#senha").val(), 'remember-me': $("#remember_me").val()},
            type: "POST",
            success: function(data){
                if(typeof(data.error) != 'undefined'){
                    swal({
                        title: $("#erroSwall").val(),
                        text: data.error,
                        type: "error",
                        confirmButtonText: "Ok"
                    });
                }else if(typeof(data.success) != 'undefined'){
                    window.location = "/home/index";
                }
            },
            error: function(){

            }
        })
    }else{
        swal({
            title: $("#erroSwall").val(),
            text: $("#erroLoginDadosInvalidos").val(),
            type: "error",
            confirmButtonText: "Ok"
        });
    }
};
