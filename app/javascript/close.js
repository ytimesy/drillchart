window.onbeforeunload = function() {
  const XHR = new XMLHttpRequest();
  XHR.open("POST", "/graphs", true);
  XHR.responseType = "json";
  XHR.send('1');
  XHR.onload = () => {
  };
}




