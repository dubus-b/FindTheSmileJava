<%-- 
    Document   : erreur
    Created on : 26 nov. 2018, 15:05:48
    Author     : bdubus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <title>A propos</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/res/style.css"/>
        <link rel="apple-touch-icon" sizes="180x180" href="res/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="res/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="res/favicon-16x16.png">
        <link rel="manifest" href="/TP1-BenjaminDUBUS/site.webmanifest">
        <link rel="mask-icon" href="res/safari-pinned-tab.svg" color="#5bbad5">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="theme-color" content="#ffffff">
    </head>
    <body>
         <nav>
                <ul>
                    <li><a href="accueil">Accueil</a></li>
                    <li><a href="apropos.html">A propos</a></li>
                    <% if(session.getAttribute("email") != null) { %>
                <li><a href="moncompte">Mon compte</a></li>
                    <% } %>
                </ul>
            </nav>
                <div class="box">
            <div class="box-content">
                <h1 class="title">${erreur}</h1>
            </div>
        </div>
    </body>
</html>
