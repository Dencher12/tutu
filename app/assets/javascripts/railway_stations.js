$(document).ready(function(){
  $('a.edit_station').click(function(e){
    e.preventDefault();

    var stationId = $(this).data('stationId');
    form = $('#edit_railway_station_' + stationId);
    stationTitle = $('#station_title_' + stationId);

    if($(this).hasClass('cancel')) {
      $(this).html('Edit');
      $(this).removeClass('cancel');
    } else {
      $(this).html('Cancel');
      $(this).addClass('cancel');
    }

    form.toggle();
    stationTitle.toggle();
  });
});