$("document").ready(function(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/script.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            var result = '<div class="col-sm-4" style="float:left"><a href="iPhone.html"><img src="'+response+'" ></a></div>';
            for(var i=0; i<100; i++){
                console.log(result);
                $("#content").append(result);
            }
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
});