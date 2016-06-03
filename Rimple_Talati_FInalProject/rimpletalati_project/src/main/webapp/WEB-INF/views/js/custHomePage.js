		function ajaxFunction(){
					
		var xmlhttp;
		var productName = document.getElementById("paintingName").value;
		var category = document.getElementById("selectbasic").value;
		
		//document.getElementById("match").innerHTML = oldPass;

		if (window.XMLHttpRequest){
	        xmlhttp = new XMLHttpRequest(); //for IE7+, Firefox, Chrome, Opera, Safari
	    } else {
	      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
	    }
		
		
		xmlhttp.open("POST", "checkforproduct.do", true);
		xmlhttp.setRequestHeader("paintingName", productName);
		xmlhttp.setRequestHeader("category", category);
		
		if(paintingName=="")
			{
			alert("Enter valid key");
			return;
			}
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4){
				if (xmlhttp.status == 200){
					
					document.getElementById("suggestions").innerHTML = xmlhttp.responseText;
	            }
				else
	            {
	                alert('Error 200');
	            }
			}		
		}
		xmlhttp.send(null);
	}