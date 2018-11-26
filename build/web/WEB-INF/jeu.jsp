<%-- 
    Document   : jeu
    Created on : 21 nov. 2018, 14:32:42
    Author     : bdubus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Trouvez le sourire</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="res/style.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <link rel="apple-touch-icon" sizes="180x180" href="res/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="res/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="res/favicon-16x16.png">
        <link rel="manifest" href="res/site.webmanifest">
        <link rel="mask-icon" href="res/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
        <script src="res/game.js"></script>
    </head>
    <body>
        <nav>
              <ul>
                <li><a href="accueil">Accueil</a></li>
                <li><a href="apropos">A propos</a></li>
                 <% if (session.getAttribute("email") != null) { %>
                <li class="dropdown">
                    <a href="javascript:void(0)" class="dropbtn"> <%= (String)request.getAttribute("name") %></a>
                    <div class="dropdown-content">
                        <a href="moncompte">Mon compte</a>
                        <a href="deconnexion">Déconnexion</a>
                </li>
                    <% }%>
            </ul>
        </nav>
        <div class="game-box">
            <div class="box-content">
                <table>
                    <h1 id="welcome" class="title">Bienvenue ${name}</h1> 
                    <tr>
                        <td id="Pic0"></td>
                        <td id="Pic1"></td>
                        <td id="Pic2"></td>
                        <td id="Pic3"></td>
                        <td id="Pic4"></td>
                    </tr>
                    <tr>
                        <td id="Pic5"></td>
                        <td id="Pic6"></td>
                        <td id="Pic7"></td>
                        <td id="Pic8"></td>
                        <td id="Pic9"></td>
                    </tr>
                    <tr>
                        <td id="Pic10"></td>
                        <td id="Pic11"></td>
                        <td id="Pic12"></td>
                        <td id="Pic13"></td>
                        <td id="Pic14"></td>
                    </tr>
                    <tr>
                        <td id="Pic15"></td>
                        <td id="Pic16"></td>
                        <td id="Pic17"></td>
                        <td id="Pic18"></td>
                        <td id="Pic19"></td>
                    </tr>
                    <tr>
                        <td id="Pic20"></td>
                        <td id="Pic21"></td>
                        <td id="Pic22"></td>
                        <td id="Pic23"></td>
                        <td id="Pic24"></td>
                    </tr>
                </table>
                <button class="btn btn-primary btn-large btn-block"
                        id="start" onclick="launchGame()">Jouer</button>
                <button class="btn btn-primary btn-large btn-block"
                        id="reload" onclick="reloadGame()">Recommencer</button>
            </div>
        </div>
        <div class="box">
            <div class="box-content">
                <table class="table-score">
                    <tr>
                        <th class="th-score">Temps écoulé</th>
                        <th class="th-score">Temps moyen</th>
                        <th class="th-score">Nombre de visages trouvé</th>
                        <th class="th-score">Meilleur score</th>
                        <th class="th-score">Dernier score</th>
                    </tr>
                    <tr>
                        <td class="td-score"><p  id="timer">00:00:00</p></td>
                        <td class="td-score"><p id="avg">00:00:00</p></td>
                        <td class="td-score"><p id="score">0</p></td>
                        <td class="td-score"><p id="bestScore">${bestScore}</p></td>
                        <td class="td-score"><p id="lastScore">${lastScore}</p></td>
                    </tr>
                </table>
                <img src="res/images/trophée.jpg" id="trophée"></img>
            </div>
        </div>

    </body>
</html>