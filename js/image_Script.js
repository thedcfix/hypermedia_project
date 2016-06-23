$("document").ready(function(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/imageprincipale.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            var result = '<img src="'+response+'">';
            $("#principal_image").append(result);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
});