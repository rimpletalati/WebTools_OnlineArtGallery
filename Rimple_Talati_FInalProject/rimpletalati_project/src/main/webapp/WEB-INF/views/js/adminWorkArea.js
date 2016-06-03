
$(document).ready(function(){
		
		$( ".mybutton1" ).click(function() {
			  $( "#supplierForm" ).toggle( "fast" );
			});
		$( ".mybutton2" ).click(function() {
			  $( "#big-form").toggle( "fast" );
			});
		
		 $("#register-form").validate({
			    
			 onfocusout: false,
			 errorElement: "div",
			 errorPlacement: function(error, element) {
                 
				 error.appendTo("div#errors1");
             }, 
		        // Specify the validation rules
		        rules: {
		        	firstName: "required",
		            lastName: "required",
		            email: {
		                required: true,
		                email: true
		            },
		            username:"required",
		            password:"required"
             
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	firstName: "Please enter your first name",
		            lastName: "Please enter your last name",
		           
		            email: "Please enter a valid email address",
		            username:"Please set a username",
		            password:"Please set a password"
		            
		        },
		        
		        submitHandler: function(form) {
		            form.submit();
		        }
		    });
		 
		 $("#addCategory").validate({
			    
			 onfocusout: false,
			 errorElement: "div",
			 errorPlacement: function(error, element) {
                 
				 error.appendTo("div#errors2");
             }, 
		        // Specify the validation rules
		        rules: {
		        	paintingCaetgoryName: "required",
		            
		        },
		        
		        // Specify the validation error messages
		        messages: {
		        	paintingCaetgoryName: "Please enter Category name",
		        },
		        
		        submitHandler: function(form) {
		            form.submit();
		        }
		    });

});




