
$(function() {
	console.log("console logging works");
    var availableTags = [
        "Arrow",
        "Homeland",

    ];
    $("#shows").autocomplete({
        source: availableTags
    });

    
    document.getElementById("form").addEventListener("onSubmit", handleClick(), false);
    	


	// document.forms[0].onsubmit = function(e) {
	// 	console.log('submitted');
	//     e.preventDefault(); // Prevent submission
	//     var show = document.getElementById('show').value;
	//     console.log(show);
	// 	chrome.runtime.sendMessage({
	// 		        from: "popup",
	// 		        subject: show
	// 	});
	// };


    function handleClick() {
    	
		var show = form.elements[0].value;
		console.log(show);
	    chrome.runtime.sendMessage({
	        from: "popup",
	        subject: show
	    });
	}

	function checkSubmit(e) {
	    console.log('Enter Key Pressed');

	    if (e && e.keyCode == 13) {
	        document.forms[0].submit();
	    }
	}


});


