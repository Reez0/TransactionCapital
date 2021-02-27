const apiUrl = 'http://localhost:8000/weather/'

function fadeIn() {
  $("#weather").fadeIn('slow');
}
$("#addressSubmit" ).click(() => {
  let address = $("#address").val().trim();
  if (address) {
    let payload = {"address":address};
    let csrfToken = getCookie('csrftoken');
    $.ajax({
        url: apiUrl+'report',
        type: 'POST',
        beforeSend: (xhr, settings) => {
            xhr.setRequestHeader("X-CSRFToken", csrfToken);
        },
        data: payload
      }).done((response) => {
        if (response.success) {
            fadeIn();
            appendApiResponseValues(response);


        }
      }).fail((jqXHR, textStatus, errorThrown) =>{
        console.log("fail" + errorThrown);
      });
  }
});

function getCookie(name) {
    var cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        var cookies = document.cookie.split(';');
        for (var i = 0; i < cookies.length; i++) {
            var cookie = jQuery.trim(cookies[i]);
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function appendApiResponseValues(response) {
  const data = response.data.current_weather;
  $("#location").text("LAT:"+ data.coord.lat +';'+ "LON:" +data.coord.lon);
  $("#dayTime").text(getDateFromUnixTimestamp(data.dt))
  $("#temp").text(data.main.temp+'°C')
  $("#description").text(data.weather[0].description)
  $("#windSpeed").text(data.wind.speed)
  $("#humidity").text(data.main.humidity)
}

function getDateFromUnixTimestamp(unix_timestamp) {
  let formattedTime = new Date(unix_timestamp * 1000);
  return formattedTime.getHours() + ':' + formattedTime.getMinutes();
}

