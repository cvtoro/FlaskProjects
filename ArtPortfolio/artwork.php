<!DOCTYPE html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title></title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="artpage.css" type="text/css">

		<!-- <link rel="stylesheet" href="./dist/css/animsition.min.css"> -->
		<!-- animsition.css -->
		<link rel="stylesheet" href="./dist/css/animsition.min.css">
		<!-- jQuery -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        

    </head>
    <body>


    <div class = "animsition">
    <?php
    include '../configuration/configArt.php'
   	

    ?>

    </div>

   <!--  <div class = 'box'>
    	<div>
    		    <img src="<?php echo $imageArray[0]; ?>">

    	</div>
    	<div>
    		    <img src="<?php echo $imageArray[1]; ?>">

    	</div>
    	<div>
    		    <img src="<?php echo $imageArray[2]; ?>">

    	</div>




    </div> -->

    <!-- animsition.js -->
	<script src="./dist/js/animsition.min.js"></script>
	<script type="text/javascript">
		    $(document).ready(function() {
			  $(".animsition").animsition({
			    inClass: 'fade-in-left',
			    outClass: 'fade-out-left',
			    inDuration: 1500,
			    outDuration: 800,
			    linkElement: '.animsition-link',
			    // e.g. linkElement: 'a:not([target="_blank"]):not([href^=#])'
			    loading: true,
			    loadingParentElement: 'body', //animsition wrapper element
			    loadingClass: 'animsition-loading',
			    loadingInner: '', // e.g '<img src="loading.svg" />'
			    timeout: false,
			    timeoutCountdown: 5000,
			    onLoadEvent: true,
			    browser: [ 'animation-duration', '-webkit-animation-duration'],
			    // "browser" option allows you to disable the "animsition" in case the css property in the array is not supported by your browser.
			    // The default setting is to disable the "animsition" in a browser that does not support "animation-duration".
			    overlay : false,
			    overlayClass : 'animsition-overlay-slide',
			    overlayParentElement : 'body',
			    transition: function(url){ window.location.href = url; }
			  });
			});

    </script>


        
    </body>
</html>