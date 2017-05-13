<!doctype html>
<html lang="pt-br" class="no-js">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <asset:link rel="icon" href="compraFacilFavIcon.ico" type="image/x-ico" />
    <title>
        <g:layoutTitle default="Compra Fácil"/>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <asset:stylesheet src="application.css"/>
    <asset:stylesheet src="font-awesome-4.7.0/css/font-awesome.css"/>
    <asset:stylesheet src="materialize/css/materialize.css"/>
    <asset:stylesheet src="sweetalert-master/dist/sweetalert.css"/>
    <g:layoutHead/>
</head>
<body>
    <g:layoutBody/>
    <div class="container" style="min-height: 100%">

    </div>

    <div class="load center" style="display: none">
        <div class="preloader-wrapper big active">
            <div class="spinner-layer spinner-blue-only">
                <div class="circle-clipper left">
                    <div class="circle"></div>
                </div><div class="gap-patch">
                <div class="circle"></div>
            </div>
                <div class="circle-clipper right">
                    <div class="circle"></div>
                </div>
            </div>
        </div>
    </div>

    <input type="hidden" id="erroSwall" value="${message(code:'default.swall.error.label')}"/>
    <asset:javascript src="application.js"/>
    <asset:javascript src="sweetalert-master/dist/sweetalert-dev.js"/>
    <asset:javascript src="materialize/js/materialize.js"/>
    <script>
        $(document).ready(function() {
            Materialize.updateTextFields();
            $(".button-collapse").sideNav();
        });
    </script>
    <g:render template="/layouts/footer"/>
</body>
</html>
