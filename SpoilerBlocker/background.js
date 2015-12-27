chrome.runtime.onMessage.addListener(function (msg) {
	if(msg.from == "removeSpoiler"){
	  chrome.browserAction.setBadgeBackgroundColor({ color: [0, 102, 153, 0] });
	  chrome.browserAction.setBadgeText({text: msg.count.toString()});
	}
});

