$(document).ready(documentReady);

function documentReady() {

var id = getUrlParameter("id");
var risultato;
console.log("estoi aqui")
$.ajax({
        method: "POST", 
        crossDomain: true,
        url: "php/oracle.php",
        data : { id : id , method : 'device_assistance' },
        success: function(response) {
            console.log("riuscito!");
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
    console.log("appendo");
    var nomi = parametro.split(";");
    console.log(nomi);
    for(var idDispo of nomi){
        var stringaToAppend = '<a href="http://localhost/hypermedia_project/device.php?id='+idDispo+'" class="list-group-item">'+idDispo+'</a>';
        $('#ListaDispositivi').append(stringaToAppend);
    }
};