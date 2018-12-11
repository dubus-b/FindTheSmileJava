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
                    <% if (session.getAttribute("User") != null) {%>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn"> <%= (String) request.getAttribute("firstName")%></a>
                    <div class="dropdown-content">
                        <a href="moncompte">Mon compte</a>
                        <a href="deconnexion">Déconnexion</a>
                </li>
                <% }%>
            </ul>
        </nav>
        <div class="login">
            <div class="login-screen">
                <div class="login-form">
                    <form action="inscription" method="post">
                        <h1 class="title">Inscription</h1>
                        <div class="control-group">
                            <label>Prénom :</label>
                            <input required class="login-field" placeholder="Prénom" type="text" name="firstname" value="">
                        </div>
                         <label>Nom :</label>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Nom" type="text" name="lastname" value="">
                        </div>
                         <label>Date de naissance :</label>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Date de naissance" type="date" name="birthdate" value="">
                        </div>
                         <label>Numéro de téléphone :</label>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Numéro de téléphone" type="tel" name="phone" value="">
                        </div>
                        <div class="control-group">
                        <label>Adresse de courriel:</label>
                            <p id="invalid-email"></p>
                            <input required class="login-field" id="mail" placeholder="Adresse de courriel" type="email" minLenght="3" maxlength="19" name="email" value="">
                        </div>
                        <label>Mot de passe :</label>
                        <div class="control-group">
                            <p id="invalid-password"></p>
                            <input required class="login-field"  id="password" placeholder="Mot de passe" type="password" name="passwd" value="">
                        </div>
                         <label>Confirmer le mot de passe :</label>
                        <div class="control-group">
                            <input required class="login-field"  id="cpassword" placeholder="Confirmez le mot de passe" type="password" name="confirm-passwd" value="">
                        </div>
                        <input id="submit-btn"required class="btn btn-primary btn-large btn-block" type="submit" value="Soumettre">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>

<script>
    var jsonResult;
    $("#mail").keyup(function () {
        json = {"email": $('#mail').val()};
        $.ajax({url: "MailAjax",
            type: "POST",
            data: json,
            success: function (result)
            {
                jsonResult = JSON.parse(result);
                if (jsonResult["mailTaken"] == true)
                {
                    $("#invalid-email").html("L'addresse saisie est déjà utilisée");
                    $("#submit-btn").attr("disabled", true);
                    $("#submit-btn").css('background', 'grey');
                } else
                {
                    $("#invalid-email").html("");
                    $("#submit-btn").attr("disabled", false);
                    $("#submit-btn").css('background', '#3498DB');
                }
            }});
    });
    $("#password").keyup(function () {
        if ($('#password').val() === $('#cpassword').val())
        {
            $("#invalid-password").html("");

        } else {
            $("#invalid-password").html("Les mots de passe entrées sont différents");
            $("#submit-btn").attr("disabled", true);
            $("#submit-btn").css('background', 'grey');
        }
    });
    $("#cpassword").keyup(function () {
        if ($('#password').val() === $('#cpassword').val())
        {
            $("#invalid-password").html("");
            $("#submit-btn").attr("disabled", false);
            $("#submit-btn").css('background', '#3498DB');
        } else {
            $("#invalid-password").html("Les mots de passe entrées sont différents");
            $("#submit-btn").attr("disabled", true);
            $("#submit-btn").css('background', 'grey');
        }
    });
</script>
