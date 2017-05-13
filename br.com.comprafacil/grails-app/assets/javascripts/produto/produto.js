
$(document).ready(function() {
    $('select').material_select();

    $(document).ajaxStop(function(){
        $('select').material_select();
    })
});