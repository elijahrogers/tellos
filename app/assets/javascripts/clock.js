$(function() {
  startClock();
});

function startClock() {
  var today = new Date();
  var h = today.getHours();
  var m = today.getMinutes();
  var html = formatTime(h, m)
  $('#clock').html(html);
  var t = setTimeout(startClock, 500);
}

function formatTime(hour, minute) {
  var amPM = (hour > 11) ? "PM" : "AM";
  if (hour > 12) {
    hour -= 12;
  } else if (hour == 0) {
    hour = "12";
  }
  if (minute < 10) {
    minute = "0" + minute;
  }
  return hour + ":" + minute + " " + amPM;
}
