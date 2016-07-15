$(document).ready(documentReady);

function documentReady() {

var type = getUrlParameter("type");
var risultato;
$.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/oracle.php",
        data : { type : type , method : 'products_show' },
        success: function(response) {
            console.log("riuscito!");
            console.log(response);
            $("#content").append(response);
        },
        error: function(request,error){
            console.log(request+":"+error);
        }
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
