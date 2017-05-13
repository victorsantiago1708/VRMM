/**
 * Created by Victor on 13/05/2017.
 */
var save;

window.onload = function(){

};

save = function(path, form){
    var dontSearch = true;
    var data = new FormData();

    data.append('id', $("#id").val());
    data.append('fullname', $("#fullname").val() );
    data.append('password', $("#password").val() || "" );
    data.append('dontSearch', dontSearch );
    if(typeof $( "input[name='file']" )[0].files[0] != 'undefined')
        data.append('file', $( "input[name='file']" )[0].files[0]);

    $.ajax({
        type: 'POST',
        data: data,
        contentType: false,
        processData: false,
        async: false,
        url: path,
        success: function(data, textStatus) {
            $("#conteudo").html(data);
            // var user = data['user'];
            // var avatar = data['avatar'];
            // var tipo = data['tipo'];
            //
            // if(user!=null&&typeof(user)!='undefined'){
            //     $("#userPhoto").attr("src","data:image/png;bmp;jpg;base64,"+avatar);
            //     $("#photoUser").attr("src","data:image/png;bmp;jpg;base64,"+avatar);
            //     $("#fullname").val(user);
            //     $("#tipo").val(tipo);
            // }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {}
    });

    // $.ajax({
    //     type:'POST',
    //     url:'/usuario/renderPerfilPhoto',
    //     success: function(data){
    //         $('#photoUser').html(data);
    //     }
    // });

    return false;
};