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
	
}