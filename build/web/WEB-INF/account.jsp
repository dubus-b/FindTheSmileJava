<%-- 
    Document   : account
    Created on : 26 nov. 2018, 13:10:59
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
                        <a class="active" href="moncompte">Mon compte</a>
                        <a href="deconnexion">Déconnexion</a>
                </li>
                <% }%>
            </ul>
        </nav>

        <div class="login">
            <div class="login-screen">
                <div class="login-form">
                    <form action="moncompte" method="POST">
                        <h1 class="title"> Mes informations personelles</h1>
                        <div class="control-group">
                            <label>Prénom :</label>
                            <input required class="login-field" placeholder="Prénom" type="text" name="firstName" value="${firstName}">
                        </div>
                        <label>Nom :</label>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Nom" type="text" name="lastName" value="${lastName}">
                        </div>
                        <label>Date de naissance :</label>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Date de naissance" type="date" name="birthdate" value="${birthDate}">
                        </div>
                        <label>Numéro de téléphone :</label>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Numéro de téléphone" type="tel" name="phone" value="${phone}">
                        </div>
                        <label>Adresse de courriel :</label>
                        <div class="control-group">
                            <p id="invalid-email"></p>
                            <input required class="login-field" id="mail" placeholder="Adresse de courriel" type="email" minLenght="3" maxlength="19" name="email" value="${email}">
                        </div>
                        <p>${response}</p>
                        <input required class="btn btn-primary btn-large btn-block" type="submit" value="Actualiser les informations">
                    </form>
                    <br>
                    <button onclick="reinitScore()" class="btn btn-primary btn-large btn-block">Réinitialiser les scores</button>
                    <br>
                    <div>
                        <label>Ancien mot de passe :</label>
                        <input type="password" id="oldPasswd">
                        <br>
                        <br>
                        <label>Nouveau mot de passe :</label>
                        <input type="password" id="newPasswd">
                        <button type="button" onclick="updatePassword()" class="btn btn-primary">Changer de mot de passe</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>

<script>
    function updatePassword()
    {
        json = {};
        json['oldPasswd'] = $('#oldPasswd').val();
        json['newPasswd'] = $('#newPasswd').val();
        $.ajax({url: "moncompte",
            type: "POST",
            data: json,
            success: function (result)
            {
                alert(result);
            }});
    }
    function reinitScore()
    {
        json = {};
        json['scores'] = true;
        $.ajax({url: "moncompte",
            type: "POST",
            data: json,
            success: function (result)
            {
                alert(result);
            }});
    }
</script>