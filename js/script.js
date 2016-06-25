$("document").ready(function(){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/script.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            //var result = '<div class="col-sm-4" align="center" style="float:left"><a href="iPhone.html"><img src="'+response["Immagine"]+'" ><p>'+response["Nome"]+'</p></a></div>';
            //console.log(result);
            for(var i=0;i<10;i++)
            $("#content").append(response);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
});