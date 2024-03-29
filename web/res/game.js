var first = true;
var historique_timer = [];
var timerIsOn = false;
var total_counter = 0;
var current_point_counter = 0;
var avg = 0;
var score = 0;
var t;
var lastScore = 0;
var bestScore = 0;
var happy_list = [];
var sad_list = [];
var wrong = new Audio('res/sons/wrong.mp3');
var right = new Audio('res/sons/right.wav');
$(document).ready(function () {
    $('#reload').hide();
    $('#trophée').hide();

});


function formatScore(seconds, target)
{
    var d = new Date(0, 0, 0, 0, 0, seconds, 0);
        if (d.getUTCSeconds() >= 10)
            formated = d.getUTCMinutes() + ':' + d.getUTCSeconds();
        else
            formated = d.getUTCMinutes() + ':0' + d.getUTCSeconds();
            $(target).html(formated);
}

function grid_generator()
{
    var current_grid = [];
    current_grid.push(happy_list[Math.floor(Math.random() * 600) + 1]);
    idx = 0;
    while (idx !== 24)
    {
        current_grid.push(sad_list[Math.floor(Math.random() * 600) + 1]);
        idx++;
    }
    for (var idx = current_grid.length - 1; idx > 0; idx--) {
        var j = Math.floor(Math.random() * (idx + 1));
        var temp = current_grid[idx];
        current_grid[idx] = current_grid[j];
        current_grid[j] = temp;
    }
    return current_grid;
}
function fill_pic_list() {
    var idx = 1;
    while (idx !== 601)
    {
        happy_list.push("res/images/joyeux/" + String(idx) + ".jpg");
        sad_list.push("res/images/tristes/" + String(idx) + ".jpg");
        idx++;
    }
}
function launchGame()
{
    
    if (first == true)
    {
        bestScore = parseInt($("#bestScore").text())
        lastScore = parseInt($("#lastScore").text())
        first = false;
    }
    formatScore(bestScore, "#bestScore");
    formatScore(lastScore, "#lastScore");
    fill_pic_list();
    pics = grid_generator();
    for (idx = 0; idx < 25; idx++)
    {
        image = $("#Pic" + idx);
        image.html("<img class=\"game-img\" id=\"face" + idx + "\" src='" + pics[idx] + "' />");
    }
    doTimer();
    $('#start').hide();
    $('#welcome').hide();
    $('#reload').show("slow");
    $(document).ready(function () {
        $("img").click(function () {
            img_path = this.src;
            var happy_pos = img_path.search("joyeux");
            if (happy_pos == -1)
            {
                wrong.play();
                id = this.id;
                $("#" + id).addClass("wrong");
            } 
            else
            {
                getPoint();
                right.play();
                launchGame();
            }
        });
    });
}
function timedCount()
{
    t = setTimeout("timedCount()", 1000);
    var d = new Date(0, 0, 0, 0, 0, total_counter, 0);
    if (d.getUTCSeconds() >= 10)
        global_timer = d.getUTCMinutes() + ':' + d.getUTCSeconds();
    else
        global_timer = d.getUTCMinutes() + ':0' + d.getUTCSeconds();
    $('#timer').html(global_timer);
    total_counter = total_counter + 1;
    current_point_counter = current_point_counter + 1;
}
function getTimeAverage()
{
    var TimeAverage = 0;
    var sum = 0;
    historique_timer.forEach(function (element) {
        sum = sum + element;
    });
    TimeAverage = sum / score;
    return TimeAverage;
}
function doTimer()
{
    if (timerIsOn == 0)
    {
        timerIsOn = 1;
        timedCount();
    }
}
function reloadGame()
{
    $('#trophée').hide();
    $('#grid').show();
    clearTimeout(t);
    t = 0;
    timerIsOn = 0;
    avg = 0;
    current_point_counter = 0;
    total_counter = 0;
    score = 0;
    historique_timer = [];
    $('#avg').html(avg);
    $('#score').html(score);
    launchGame();
}

function getPoint()
{
    score = score + 1;
    if (score == 10)
    {
                $('#trophée').show();
        $('#grid').hide();
        lastScore = total_counter;
        formatScore(lastScore, "#lastScore");
        if (total_counter < bestScore)
        {
            bestScore = total_counter;
            formatScore(bestScore, "#bestScore");
        }
        if (bestScore == 0)
            bestScore = total_counter;
        updateScores();
        clearTimeout(t);
    }
    historique_timer.push(current_point_counter * 1000);
    var ms = getTimeAverage();
    var d = new Date(ms);
    if (d.getUTCSeconds() >= 10)
        average = d.getUTCMinutes() + ':' + d.getUTCSeconds() + ":" + d.getMilliseconds();
    else
        average = d.getUTCMinutes() + ':0' + d.getUTCSeconds() + ":" + d.getMilliseconds();
    $('#avg').html(average);
    $('#score').html(score);
    current_point_counter = 0;
}

function updateScores()
{
    console.log(bestScore, lastScore);
    var data = {};
    data["bestScore"] = bestScore;
    data["lastScore"] = lastScore;
    $.ajax({url: "updateScore",
        type: "POST",
        data : data
       });
}
