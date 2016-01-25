var tvShow = "";
chrome.runtime.onMessage.addListener(function (msg, sendResponse) {
    
    if (msg.from == "popup") {
        tvShow = msg.subject;
        sendResponse({reply: "heard"});
    }
});

countRemoved = 0;
// var spoilerImg = chrome.extension.getURL('/assets/Spoilers.png');




window.Remove = function Remove() {
  console.log(tvShow);


    if (tvShow != "") {
        console.log("here");
        var tvShowName = new RegExp(tvShow);



        rem = false;


      

        //abbreviations as well

        //check each newsfeed article
        $('div[class^="userContentWrapper"]').each(function() {


            $(this).find("*").each(function() {


                if (tvShowName.test(this.innerHTML)) {

                    rem = true;
                    return false;
                }


            });

            if (rem) {
                countRemoved = countRemoved + 1;
                console.log("removed " + countRemoved + " reference to " + tvShowName);
                //send message to update badge count
                chrome.runtime.sendMessage({
                    from: "removeSpoiler",
                    count: countRemoved
                });

                var width = $(this).width();
                var height = $(this).height();
                this.id = "blur";
                $(this).after("<div id = 'button'>Possible Spoiler<br> Click To Show</div>");


                // var replaced = $(this).replaceWith("<div><img id = 'image' src =" + spoilerImg+ " width = '" + width+ "' height = '"+ height + "'><div id = 'button'>Possible Spoiler, Click To Show</div></div>");
                rem = false;
            }


        });
    }
}

Remove();

//timer to check newsfeed every 2 seconds for articles referencing tv Show
setInterval(function() {
    Remove()
}, 2000);