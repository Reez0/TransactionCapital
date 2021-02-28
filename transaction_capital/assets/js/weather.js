const apiUrl = "http://localhost:8000/weather/";
var history = {};

showSpinner = () => {
  $(".spinner").show();
};

hideSpinner = () => {
  $(".spinner").hide();
};

fadeIn = () => {
  $("#weather").fadeIn("slow");
};

$("#addressSubmit").click(() => {
  let address = $("#address").val().trim();
  if (address) {
    let payload = { address: address };
    let csrfToken = getCookie("csrftoken");
    $.ajax({
      url: apiUrl + "report",
      type: "POST",
      beforeSend: (xhr, settings) => {
        xhr.setRequestHeader("X-CSRFToken", csrfToken);
        showSpinner();
      },
      data: payload,
    })
      .done((response) => {
        if (response.success) {
          setCurrentWeather(response);
          setForecastWeather(response);
          hideSpinner();
          fadeIn();
          history.lastPayload = payload;
          history.lastResponse = response;

          $("#save-history").removeAttr("hidden");
        }
      })
      .fail((jqXHR, textStatus, errorThrown) => {
        console.log("fail" + errorThrown);
      });
  }
});

getCookie = (name) => {
  var cookieValue = null;
  if (document.cookie && document.cookie !== "") {
    var cookies = document.cookie.split(";");
    for (var i = 0; i < cookies.length; i++) {
      var cookie = jQuery.trim(cookies[i]);
      if (cookie.substring(0, name.length + 1) === name + "=") {
        cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
        break;
      }
    }
  }
  return cookieValue;
};

setCurrentWeather = (response) => {
  const data = response.data.current_weather;
  $("#location").text("LAT:" + data.coord.lat + ";" + "LON:" + data.coord.lon);
  $("#temp").text(Math.round(data.main.temp) + "°C");
  $("#description").text(data.weather[0].description);
  $("#windSpeed").text(data.wind.speed + "km/h winds");
  $("#humidity").text(data.main.humidity + "% humidity");
  $("#weatherIndicator").attr(
    "src",
    `http://openweathermap.org/img/w/${data.weather[0].icon}.png`
  );
};

setForecastWeather = (response) => {
  const data = response.data.weather_forecast;
  createForecastElementsDynamic(data);
};

getDateFromUnixTimestamp = (unix_timestamp) => {
  let formattedTime = new Date(unix_timestamp * 1000);
  return formattedTime.toLocaleString();
};

//Dynamically created elements inside a div
createForecastElementsDynamic = (data) => {
  data.hourly.map((hourlyForecast, index) => {
    $(".carousel-inner").append(
      createHourlyForecastCard(hourlyForecast, index)
    );
  });
};

createHourlyForecastCard = (data, index) => {
  let card = `
  <div class="carousel-item ${index == 0 ? "active" : ""}">
  <div class="card weather-card">
    <div class="card-title m-3">
        <h1 id = "description">${data.weather[0].description}</h1>
        <h2 id ="time">${getDateFromUnixTimestamp(data.dt)
          .split(",")[1]
          .trim()}</h2>
    </div>
    <div class="card-body">
        <h1 id="temp">${Math.round(data.temp) + "°C"}</h1>
        <img id="weatherIndicator" src="http://openweathermap.org/img/w/${
          data.weather[0].icon
        }.png" alt="">
    </div>
    <div class="card-body-detail">
        <p id="windSpeed">${data.wind_speed + "km/h winds"}</p>
        <p id="humidity">${data.humidity + "% humidity"}</p>
    </div>
  </div>  
  </div>
`;
  return card;
};

$("#noSaveHistory").click(() => {
  $("#save-history").attr("hidden", true);
});

$("#saveHistory").click(() => {
  console.log(history);
  let payload = {
    request_address: history.lastPayload.address,
    request_response_data: JSON.stringify(history.lastResponse.data),
  };
  let csrfToken = getCookie("csrftoken");
  $.ajax({
    url: apiUrl + "history/create",
    type: "POST",
    beforeSend: (xhr, settings) => {
      xhr.setRequestHeader("X-CSRFToken", csrfToken);
      showSpinner();
    },
    data: payload,
  })
    .done((response) => {
      if (response.success) {
        hideSpinner();
        swal("Success", "History updated successfully", "success");
        $("#save-history").attr("hidden", true);
      }
    })
    .fail((jqXHR, textStatus, errorThrown) => {
      console.log(errorThrown);
    });
});
