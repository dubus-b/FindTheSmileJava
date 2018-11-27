<%-- 
    Document   : index
    Created on : 20 nov. 2018, 20:24:44
    Author     : bdubus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Bienvenue</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="stylesheet" type="text/css" href="res/style.css">
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
                <li><a class="active" href="accueil">Accueil</a></li>
                <li><a href="apropos">A propos</a></li>
                 <% if (session.getAttribute("email") != null) { %>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn"> <%= (String)request.getAttribute("firstName") %></a>
                    <div class="dropdown-content">
                        <a href="moncompte">Mon compte</a>
                        <a href="deconnexion">Déconnexion</a>
                </li>
                    <% }%>
            </ul>
        </nav>
        <div class="box">
            <div class="box-content">
                <h1 class="title">Trouvez le sourire</h1>
                <img src="res/images/logo.png" id="logo"></img>
                <p>Bienvenue sur <b>Trouvez le sourire</b>
                    <br>
                    <br>
                    La regle du jeu est simple : Une grille de 25 visages s'affiche, parmis eux 1 seul est souriant.
                    <br>
                    Votre objectif est <b>simple</b>, vous devez trouver ce visage en un minimum de temps.
                    <br>
                    Inscrivez-vous <b>dès maintenant</b> pour commencer à jouer.
                </p>
            </div>
        </div>
         <div class="login">
                <div class="login-screen">
                    <% if(session.getAttribute("email") == null) { %>
                        <div class="app-title">
                    <h1>Connectez-vous pour jouer</h1>
                    </div>
                    <div class="login-form">
                        <form method="post">
                            <div class="control-group">
                                <input class="login-field" name="email" placeholder="Courriel"type="text">
                                <label class="login-field-icon fui-user" placeholder="Courriel" for="login-name"></label>
                            </div>
                            <div class="control-group">
                                <input class="login-field" name="password" type="password" placeholder="Mot de passe">
                                <label class="login-field-icon fui-lock" for="login-pass"></label>
                            </div>
                            <button class="btn btn-primary btn-large btn-block">Soumettre</button>
                            <span class="erreur">${erreur}</span>
                            <br>
                            <p>Vous n'avez pas de compte inscrivez-vous: <a style="color: red;"class="title" href="inscription"><b>ici</b></a></p>
                        </form>
                    </div>
                    <% } %>
                     <% if(session.getAttribute("email") != null) { %>
                    <div class="login-form">
                        <form action="jeu">
                            <button class="btn btn-primary btn-large btn-block">Jouer</button>
                        </form>
                    </div>
                    <% } %>
                    
                </div>
            </div>
    </body>
</html>

