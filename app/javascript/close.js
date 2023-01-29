window.onbeforeunload = function() {
  const XHR = new XMLHttpRequest();
  XHR.open("DELETE", "/graphs/1", true);
  XHR.responseType = "json";
  XHR.send('1');
}




