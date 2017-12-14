$("#photo_url").on("blur", function(event){ // address the ID on the form $ is the jquery
    
    var photo_url =$(this).val(); //get me value of input field 
    //alert(photo_url) //photo alert while click out
    var preview = $("#preview")
    if (photo_url){
        preview.attr("src", photo_url);
        //preview.show()
        preview.fadeIn(1000)
    }
    else{
        //preview.hide()
        preview.fadeOut(1000)
        //alert ("no photo_url")
    }
});
