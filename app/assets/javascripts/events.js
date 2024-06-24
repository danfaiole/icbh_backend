var $eventPage = (function ($, window, document, undefined) {

  /* Pega seletor principal da tela */
  var eventsSelector = '.events-page';

  return {
    go : function () {
      if ( $(eventsSelector).length ){
        $eventPage.initialize();
      };
    },
    initialize : function() {
      switch ($(eventsSelector).data('action')) {
        case 'index':
          $eventPage.actionFunctions.index();
          break;
        case 'new': /* O primeiro status da tela é new */
          $eventPage.actionFunctions.new();
          break;
        case 'create': /* Caso ache o erro o status vira create */
          $eventPage.actionFunctions.new();
          break;
        case 'edit':
          $eventPage.actionFunctions.new();
          break;
        default:
          console.log('Route not implemented yet')
          break;
      }
    },
    actionFunctions : {
      index : function () {
        $('#eventsCalendar').fullCalendar({
          events: '/events.json',
          locale: 'pt-br',
          customButtons: {
            newEvent: {
              text: 'Novo Evento',
              click: function() {
                window.location.href = "events/new"
              }
            }
          },
          header: {
            left: 'title',
            right: 'newEvent prev,next today'
          }
        });
      },
      new: function(){
        $('#event_end_date,#event_start_date').datetimepicker({
          locale: 'pt-BR'
        });

        $('#event_color').colorpicker();

        $('.destroy-link').on('click', function(event){
          event.preventDefault();

          $(this).closest('.nested-field-group').addClass('hidden');
          $(this).prev('.destroy-field').val('1');
        });

        $('.add-fields-for-link').on('click', function(event){
          event.preventDefault();

          var time = new Date().getTime(),
              regexp = new RegExp($(this).data('id'), 'g');

          $('#event_notification_fields tbody').prepend($(this).data('fields').replace(regexp, time))
            .find('.notification-date-field')
            .datetimepicker({
              locale: 'pt-BR'
            });
        });
      }
    }
  };
})(jQuery, this, this.document);

$(document).on('turbolinks:load', function () {
  $eventPage.go();
});