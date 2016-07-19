$("document").ready(function(){

appendAll();

$('.resetfiltri').click(function() {
    removeAll();
    appendAll();
});

$(".150").click(function() {
    cerca(0,150);
});

$(".150e450").click(function() {
    cerca(150,450);
});

$(".450").click(function() {
    cerca(450,10000);
});
});

function appendAll(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "http://reyze.altervista.org/php/loadPromotions.php",
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
    return false;
};

function removeAll() {
    $("#content").empty();
    $("#contentxs").empty();
};

function cerca(min,max){
    removeAll();
    appendMinMax(min,max);

};

function appendMinMax(min,max){

    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "http://reyze.altervista.org/php/oracle.php",
        data : { min : min , max : max , method : 'in_evidenza_min_max' },
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