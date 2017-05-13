
var logar;

window.onload = function(){
    $(document).delegate("#logar","click", logar);
    $(document).delegate("#password", "keyup", function(e){ if(e.keyCode==13){ logar(); } })
};

logar = function(){
    if( $("#username").val() != "" && $("#password").val() != "" ){
        var url = '/login/authenticate';
        $.ajax({
            url: url,
            data: {username: $("#username").val(), password: $("#password").val(), 'remember-me': $("#remember_me").val()},
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
                    window.location = "/home";
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
