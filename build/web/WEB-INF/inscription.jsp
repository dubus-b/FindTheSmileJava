<%-- 
    Document   : inscription
    Created on : 20 nov. 2018, 20:07:15
    Author     : bdubus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Inscription</title>
        <meta charset="UTF-8">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/style.css" />
        <link rel="apple-touch-icon" sizes="180x180" href="res/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="res/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="res/favicon-16x16.png">
        <link rel="manifest" href="res/site.webmanifest">
        <link rel="mask-icon" href="res/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="accueil">Accueil</a></li>
                <li><a href="apropos">A propos</a></li>
            </ul>
        </nav>
        <div class="login">
            <div class="login-screen">
                <div class="login">
                    <form action="inscription" method="post">
                        <h1 class="title">Informations personelles</h1>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Prénom" type="text" name="firstname" value="">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Nom" type="text" name="lastname" value="">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Date de naissance" type="date" name="birthdate" value="">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Numéro de téléphone" type="tel" name="phone" value="">
                        </div>`
                        <div class="control-group">
                            <p id="invalid-email"></p>
                            <input required class="login-field" id="mail" placeholder="Adresse de courriel" type="email" minLenght="3" maxlength="19" name="email" value="">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Mot de passe" type="password" name="passwd" value="">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Confirmez le mot de passe" type="password" name="confirm-passwd" value="">
                        </div>
                        <input required class="btn btn-primary btn-large btn-block" type="submit" value="Soumettre">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

<script>
    $("#mail").keypress(function(){
    json = {"email" : $('#mail').val()};
    $.ajax({url: "MailAjax",
        type: "POST",
        data : json,
        success: function(result)
        {
            $("#invalid-email").html(result);
        }});
});
</script>
