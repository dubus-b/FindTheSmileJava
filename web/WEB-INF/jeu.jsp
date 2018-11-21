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
        <link rel="apple-touch-icon" sizes="180x180" href="/TP1-BenjaminDUBUS/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="/TP1-BenjaminDUBUS/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="/TP1-BenjaminDUBUS/favicon-16x16.png">
        <link rel="manifest" href="/TP1-BenjaminDUBUS/site.webmanifest">
        <link rel="mask-icon" href="/TP1-BenjaminDUBUS/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
        <script src="res/game.js"></script>
    </head>
    <body>
        <nav>
            <ul>
                <li><a href="index.html">Accueil</a></li>
                <li><a href="apropos.html">A propos</a></li>
            </ul>
        </nav>
        <div class="game-box">
            <div class="box-content">
            <table>
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
                        <th class="th-score">Score</th>
                    </tr>
                    <tr>
                        <td class="td-score"><p  id="timer">00:00:00</p></td>
                        <td class="td-score"><p id="avg">00:00:00</p></td>
                        <td class="td-score"><p id="score">0</p></td>
                    </tr>
                </table>
                <img src="/TP1-BenjaminDUBUS/images/trophée.jpg" id="trophée"></img>
            </div>
        </div>
    </body>
</html>