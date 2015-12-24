
// This delay ensures that the elements have been created by Facebook's
// scripts before we attempt to replace them
 window.setInterval(function () {
    
    
     console.log("here");
     



      var tvShowName = new RegExp("BuzzFeed");

     

    remove = false;
    countRemoved = 0;

//show a count in icon, like adBlock
//maybe option to show removed article
//hide all newsfeed until check tkhat its ok?

//abbreviations as well
//user input

        //check each newsfeed article
        $('div[class^="userContentWrapper"]').each(function(){
   
      
        $(this).find("*").each(function(){
          

          if(tvShowName.test(this.innerHTML)){
            countRemoved++;
            console.log("found");
              remove = true;
              return false;
          }


        });

        if(remove){
          console.log("removed one reference to " + tvShowName);
          this.remove();
        }
        remove = false;

      });

     


}, 2000);

