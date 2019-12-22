$(document).ready(function(){
  $('a.edit_train').click(function(e){
    e.preventDefault();

    var trainId = $(this).data('trainId');
    form = $('#edit_train_' + trainId);
    stationTitle = $('#train_title_' + trainId);

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