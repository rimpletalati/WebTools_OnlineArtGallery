function validatePaintingName() 
    {
	
	var paintingName = document.forms["addPainting"]["paintingName"].value;
	
	if(paintingName.trim()==null || paintingName.trim()==("")){
		document.getElementById('paintingNameError').innerHTML="Painting name is mandatory";
		}
	else {
		document.getElementById('paintingNameError').innerHTML="";	
	}
    }

function validatePrice(){
	var price = document.forms["addPainting"]["price"].value;
	var patt1 = /^\d+(\.\d{0,2})?$/g;
	if(price.trim()==null || price.trim()==""){
		document.getElementById('priceError').innerHTML="Price is mandatory";
		}
	else if (!price.match(patt1)){
		document.getElementById('priceError').innerHTML="Enter valid Price";
	}
	else {
		document.getElementById('priceError').innerHTML="";	
	}
}

function validate(){
	
	var paintingName = document.forms["addPainting"]["paintingName"].value;
	var price = document.forms["addPainting"]["price"].value;
	var patt1 = /^\d+(\.\d{0,2})?$/g;

	if(paintingName.trim()==null || paintingName.trim()==""
		|| price.trim()==null || price.trim()==""
			|| !price.match(patt1)){
		document.getElementById('errormsg').innerHTML="Form is incomplete!";	
		return false;
		}
	else {
		return true;
	}
}

$(document).ready(function(){
	 $("#singlebutton").click(function(){
		 $("#errormsg").addClass("errormsgjquery"); 
      blink();
	 });
});
function blink(){
   $("#info").fadeOut(800).fadeIn(800).fadeOut(400).fadeIn(400).fadeOut(400).fadeIn(400);
}

function uploadIt() {
    var x = document.getElementById("image").value;
    
    if(x=="")
    	{
    	alert("Empty file location");
    	return;
    	}
    $('#textPath').val(x);

    document.getElementById("singlebutton").disabled=false;
}