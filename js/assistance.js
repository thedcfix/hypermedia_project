$(document).ready(documentReady);

function documentReady() {

var id = getUrlParameter("id");
var risultato;
$.ajax({
        method: "POST",
        crossDomain: true,
        url: "http://reyze.altervista.org/php/oracle.php",
        data : { id : id , method : 'device_assistance' },
        success: function(response) {
            console.log(response);
            appendAllDevice(response);
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

function appendAllDevice(parametro){
    var nomi = parametro.split(";");
    console.log(nomi);
    for(var idDispo of nomi){
        var device = idDispo.split("-");
        console.log(device);
        var id = device[0];
        var nome = device[1];
        var stringaToAppend = '<a href="http://reyze.altervista.org/device.php?id='+id+'" class="list-group-item">'+nome+'</a>';
        $('#ListaDispositivi').append(stringaToAppend);
    }
};
