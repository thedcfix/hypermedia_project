$("document").ready(function(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/script.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            var result = '<img src="'+response+'" >';
            console.log(result);
            $(".content").html(result);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
});