window.onload = function() {
    var objects = new L.LayerGroup();

    var map = L.map('map');

  L.tileLayer('http://{s}.tiles.mapbox.com/v3/wcargen.j0dp52nf/{z}/{x}/{y}.png', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18
  }).addTo(map);

  var data = {
    name: App.food,
    postal_code: App.postal_code,
    price__lte: App.price__lte,
    api_key: 'be5ae34d7365abed6bcd99407fd233259dc189f0',
  }

  console.log(data)

  $.ajax({
      type: "GET",
      url: "https://api.locu.com/v1_0/menu_item/search/",
      data: data,
      dataType: 'jsonp',
      success: function (response) {

      var objects = response["objects"]
        for (var i = 0; i < objects.length; i++) {
          var marker = L.marker([objects[i]["venue"]["lat"], objects[i]["venue"]["long"]]).addTo(map);
          marker.bindPopup(
            "<strong>" + objects[i]["name"] + " - $" + objects[i]["price"] + "</strong>"
            + "<br/>" + "<br/>" +
            "<em>" + objects[i]["venue"]["name"] + "</em>"
            + "<br/>" +
            objects[i]["venue"]["street_address"]
            + "<br/>" +
            objects[i]["venue"]["locality"] + ", " + objects[i]["venue"]["region"]
            + "<br/>" +
            objects[i]["venue"]["postal_code"]);
          if (i === 0) {
                marker.openPopup();
              };
          map.setView([objects[0]["venue"]["lat"], objects[0]["venue"]["long"]], 15);
        }
      }
  })
}