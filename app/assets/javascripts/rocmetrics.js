var rocmetrics = {
  report: function(event_name) {
    var event = {name: event_name};
    var rm_url = "http://rocmetrics2016.herokuapp.com/api/events";

    var request = new XMLHttpRequest();
    request.open("POST", rm_url, true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.onreadystatechange = function () {};
    request.send(JSON.stringify(event));
  }
};
