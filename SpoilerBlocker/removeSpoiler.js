countRemoved = 0;

window.Remove = function Remove(){
     console.log("here");
     

      var tvShowName = new RegExp("Arrow");

     

    rem = false;
    

//show a count in icon
//maybe option to show removed article
//hide all newsfeed until check tkhat its ok?

//abbreviations as well
//user input

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
          this.remove();
          rem = false;
        }
       

      });
}
 
Remove();

//timer to check newsfeed every 2 seconds for articles referencing tv Show
setInterval(function(){Remove()}, 2000);
    
