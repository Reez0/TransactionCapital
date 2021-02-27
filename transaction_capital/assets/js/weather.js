const apiUrl = 'http://localhost:8000/weather/'

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
            alert("Ok!")
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
