$("document").ready(function(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "http://reyze.altervista.org/php/loadSalute.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            $("#contenuto").append(response);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
});