$("document").ready(function(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/loadOutlet.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            $("#content").append(response);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
});