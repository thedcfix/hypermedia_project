$(document).ready(documentReady);

function documentReady() {

var type = getUrlParameter("type");
var risultato;
$("#tipologia").append(type);
appendAll(type);

$('.resetfiltri').click(function() {
    removeAll();
    appendAll(type);
});

$(".150").click(function() {
    cerca(0,150,type);
});

$(".150e450").click(function() {
    cerca(150,450,type);
});

$(".450").click(function() {
    cerca(450,10000,type);
});

};



function getUrlParameter(sParam) {
    var sPageURL = decodeURIComponent(window.location.search.substring(1)),
        sURLVariables = sPageURL.split('&'),
        sParameterName,
        i;
    for (i = 0; i < sURLVariables.length; i++) {
        sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] === sParam) {
            var result = sParameterName[1];
            return result;
        }
    }
};

function cerca(min,max,type){
    removeAll();
    appendMinMax(type,min,max);

};


function removeAll() {
    $("#content").empty();
    $("#contentxs").empty();
};

function appendAll(type){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "http://reyze.altervista.org/php/oracle.php",
        data : { type : type , method : 'products_show' },
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            $("#content").append(response);
            $("#contentxs").append(response);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
};

function appendMinMax(type,min,max){

    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "http://reyze.altervista.org/php/oracle.php",
        data : { type : type , min : min , max : max , method : 'products_show_min_max' },
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            $("#content").append(response);
            $("#contentxs").append(response);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });    

};


