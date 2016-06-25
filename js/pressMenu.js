$(document).ready(documentReady);

function documentReady() {
	aggiornaInfo();

    $('#desc').click(function(){
    	if ( $('#panoList').hasClass('active') ){
    		$('#panoList').removeClass('active');
    	}
    	if ( $('#specList').hasClass('active') ){
    		$('#specList').removeClass('active');
    	}

    	$('#descList').addClass('active');
    	aggiornaInfo();
    });


    $('#pano').click(function(){
    	if ( $('#descList').hasClass('active') ){
    		$('#descList').removeClass('active');
    	}
    	if ( $('#specList').hasClass('active') ){
    		$('#specList').removeClass('active');
    	}

    	$('#panoList').addClass('active');
    	aggiornaInfo();
    });



    $('#spec').click(function(){
    	if ( $('#panoList').hasClass('active') ){
    		$('#panoList').removeClass('active');
    	}
    	if ( $('#descList').hasClass('active') ){
    		$('#descList').removeClass('active');
    	}

    	$('#specList').addClass('active');
    	aggiornaInfo();
    });


}

function aggiornaInfo() {

	if ( $('#panoList').hasClass('active') ){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/getPano.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            var result = response;
            $("#stringa_descrittiva").remove();
            $("#Pannello_descrittivo").append("<div id ='stringa_descrittiva'>"+result+"</div>");
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
	}

	if ( $('#descList').hasClass('active') ){
    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/getDesc.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            var result = response;
            $("#stringa_descrittiva").remove();
            $("#Pannello_descrittivo").append("<div id ='stringa_descrittiva'>"+result+"</div>");
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;

	}
	if ( $('#specList').hasClass('active') ){

    $.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/getSpec.php",
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            var result = response;
            $("#stringa_descrittiva").remove();
            $("#Pannello_descrittivo").append("<div id ='stringa_descrittiva'>"+result+"</div>");
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
    });
    return false;
	}
}