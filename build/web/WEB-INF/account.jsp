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
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
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
                    <% if (session.getAttribute("email") != null) {%>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn"> <%= (String) request.getAttribute("name")%></a>
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
                    <form action="index.html">
                        <h1 class="title"> Mes informations personelles</h1>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Prénom" type="text" name="firstname" value="${lastname}">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Nom" type="text" name="lastname" value="${name}">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Date de naissance" type="date" name="birthdate" value="${birthDate}">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" placeholder="Numéro de téléphone" type="tel" name="phone" value="${phone}">
                        </div>
                        <div class="control-group">
                            <input required class="login-field" id="mail" placeholder="Adresse de courriel" type="email" minLenght="3" maxlength="19" name="email" value="${email}">
                        </div>
                        <input required class="btn btn-primary btn-large btn-block" type="submit" value="Actualiser les informations">
                    </form>
                </div>
                <br>
                <input class="btn btn-primary btn-large btn-block"  data-target="#exampleModal" data-toggle="modal" type="submit" value="Changer de mot de passe">
                <br>
                <input class="btn btn-primary btn-large btn-block" value="Réinitialiser les scores">
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Changement de mot de passe</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <label>Ancien mot de passe :</label>
                                <input>
                                <br>
                                <br>
                                <label>Nouveau mot de passe :</label>
                                <input>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                                <button type="button" class="btn btn-primary">Changer de mot de passe</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>