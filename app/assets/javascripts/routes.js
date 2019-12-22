$(document).ready(function(){
  $('a.edit_route').click(function(e){
    e.preventDefault();

    var routeId = $(this).data('routeId');
    form = $('#edit_route_' + routeId);
    stationTitle = $('#station_title_' + routeId);

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