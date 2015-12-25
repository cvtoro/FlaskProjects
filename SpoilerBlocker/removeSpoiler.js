countRemoved = 0;
var spoilerImg = chrome.extension.getURL('/assets/Spoilers.png');

window.Remove = function Remove(){
     console.log("here");
     

      var tvShowName = new RegExp("BuzzFeed");

     

    rem = false;
    

    
        //check each newsfeed article
        $('div[class^="userContentWrapper"]').each(function(){
   
      
        $(this).find("*").each(function(){
          

          if(tvShowName.test(this.innerHTML)){
            
            console.log("found");
              rem = true;
              return false;
          }


        });

        if(rem){
          countRemoved = countRemoved + 1;
          console.log("removed " + countRemoved + " reference to " + tvShowName);

          chrome.runtime.sendMessage(countRemoved);

          var width = $(this).width();
          var height = $(this).height();
          var replaced = $(this).replaceWith("<img src =" + spoilerImg+ " width = '" + width+ "' height = '"+ height + "'>");
          rem = false;
        }
       

      });
}
 
Remove();

//timer to check newsfeed every 2 seconds for articles referencing tv Show
setInterval(function(){Remove()}, 2000);
    
