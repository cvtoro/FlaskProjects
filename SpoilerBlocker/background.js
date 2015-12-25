chrome.runtime.onMessage.addListener(function (count) {

  chrome.browserAction.setBadgeBackgroundColor({ color: [0, 102, 153, 0] });
  chrome.browserAction.setBadgeText({text: count.toString()});
});

