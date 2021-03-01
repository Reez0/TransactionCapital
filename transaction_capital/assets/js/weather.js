const apiUrl = "http://localhost:8000/weather/";
var history = {};

showSpinner = () => {
  $(".spinner").show();
};

hideSpinner = () => {
  $(".spinner").hide();
};

fadeIn = (element) => {
  $(element).fadeIn("slow");
};

fadeOut = (element) => {
  $(element).fadeOut("slow");
};

$("#searchAgain").click(() => {
  fadeIn("#search");
});

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
          fadeIn("#weather");
          $("#viewHistory").removeAttr('hidden');
          fadeOut("#search");
          history.lastPayload = payload;
          history.lastResponse = response;
          $("#save-history").removeAttr("hidden");
        } else {
          hideSpinner();
          swal("Error", response.message, "error");
        }
      })
      .fail((jqXHR, textStatus, errorThrown) => {
        hideSpinner();
        swal("Error", "An unexpected error occured. Please try again later.", "error");
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
  $("#location").text(`${data.name}, ${data.sys.country}`);
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
  fadeOut("#save-history");
  $("#searchAgain").attr("hidden", false);
});

$("#saveHistory").click(() => {
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
        fadeOut("#save-history");
        $("#searchAgain").removeAttr("hidden");
      }
    })
    .fail((jqXHR, textStatus, errorThrown) => {
      hideSpinner();
      swal("Error", "An unexpected error occured. Please try again later.", "error");

    });
});

$("#viewHistory").click(() => {
  let csrfToken = getCookie("csrftoken");
  $.ajax({
    url: apiUrl + "history",
    type: "GET",
    beforeSend: (xhr, settings) => {
      xhr.setRequestHeader("X-CSRFToken", csrfToken);
      showSpinner();
    },
  })
    .done((response) => {
      if (response.success) {
        hideSpinner();
        if (response.data.length == 0) {
          swal("No data", "You do not have any history saved", "info");
          return
        }
        response.data.map((item, index) => {
          $("#historyAccordion").append(createWeatherHistoryCard(item, index));
        });
        $("#weatherHistory").removeAttr("hidden");
      }
    })
    .fail((jqXHR, textStatus, errorThrown) => {
      hideSpinner();
      swal("Error", "An unexpected error occured. Please try again later.", "error");

    });
});

createWeatherHistoryCard = (data, index) => {
  let item = `
  <div class="card">
  <div class="card-header" id="heading-${index}">
    <h2 class="mb-0">
      <button class="btn btn-link" type="button" data-toggle="collapse" data-target="#collapse-${index}" aria-expanded="true" aria-controls="collapse-${index}">
        ${data.request_address}
      </button>
    </h2>
    <small class="ml-3">${data.request_timestamp}</small>
  </div>

  <div id="collapse-${index}" class="collapse" aria-labelledby="heading-${index}" data-parent="#historyAccordion">
    <div class="card-body">
     <code> 
     ${data.request_response_data}
     </code>
    </div>
  </div>
  </div>`;
  return item;
};
