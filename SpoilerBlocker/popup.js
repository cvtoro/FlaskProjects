
$(function() {
	console.log("console logging works");
  
    document.getElementById("form").addEventListener("submit", handleClick, false);
   


	// document.forms[0].onsubmit = function(e) {
	// 	alert("submitted");
	//     e.preventDefault(); // Prevent submission
	//     var show = document.getElementById('show').value;
	//     console.log(show);
	// 	chrome.runtime.sendMessage({
	// 		        from: "popup",
	// 		        subject: show
	// 	});
	// };


    function handleClick(e) {
    	e.preventDefault();
   		var val = document.getElementById("show").value;
   		console.log(val);
   		
	    chrome.runtime.sendMessage({
	        from: "popup",
	        subject: val
	    }, function(res){
	    	// console.log(res.reply);
	    });
	
	}

	function checkSubmit(e) {
	    console.log('Enter Key Pressed');

	    if (e && e.keyCode == 13) {
	        document.forms[0].submit();
	    }
	}

	 var availableTags = [
        "Arrow",
        "Homeland",

    ];
    $("#show").autocomplete({
        source: availableTags
    });

});


