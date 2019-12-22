$(document).ready(function(){
  updateCarsFields();
  $('.field.select_car_type').change(function(e) { updateCarsFields(); });
});

function updateCarsFields() {
  var selectedType = $('.field.select_car_type option:selected').text();

  var topPlaces = $('.places.top');
  var bottomPlaces = $('.places.bottom');
  var topSidePlaces = $('.places.top_side');
  var bottomSidePlaces = $('.places.bottom_side');

  if(selectedType == "DownCar") {
    topPlaces.hide();
    bottomPlaces.show();
    topSidePlaces.hide();
    bottomSidePlaces.hide();

  }

  if(selectedType == "CoupeCar") {
    topPlaces.show();
    bottomPlaces.show();
    topSidePlaces.hide();
    bottomSidePlaces.hide();
  }

  if(selectedType == "EconomyCar") {
    topPlaces.show();
    bottomPlaces.show();
    topSidePlaces.show();
    bottomSidePlaces.show();
  }
}