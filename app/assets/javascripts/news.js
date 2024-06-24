var $newsPage = (function ($, window, document, undefined) {

  /* Pega seletor principal da tela */
  var newsSelector = '.news-page';

  return {
    go : function () {
      if ( $(newsSelector).length ){
        $newsPage.initialize();
      };
    },
    initialize : function() {
      switch ($(newsSelector).data('action')) {
        case 'index':
          $newsPage.actionFunctions.index();
          break;
        case 'new': /* O primeiro status da tela é new */
          $newsPage.actionFunctions.new();
          break;
        case 'create': /* Caso ache o erro o status vira create */
          $newsPage.actionFunctions.new();
          break;
        case 'edit':
          $newsPage.actionFunctions.new();
          break;
        default:
          console.log('Route not implemented yet')
          break;
      }
    },
    actionFunctions : {
      index : function () {
        $('#news_index_table').dataTable({
          "processing": true,
          "serverSide": true,
          "ajax": $('#news_index_table').data('source'),
          "pagingType": "full_numbers",
          "columns": [
            {"data": "id"},
            {"data": "title"},
            {"data": "user_name"},
            {"data": "published"},
            {"data": "publication_date"},
            {"data": "edit_link"}
          ]
        });
      },

      new : function() {
        $('.add-fields-for-link').on('click', function(event){
          event.preventDefault();

          var time = new Date().getTime(),
              regexp = new RegExp($(this).data('id'), 'g');

          $('#news_notification_fields tbody').prepend($(this).data('fields').replace(regexp, time))
            .find('.notification-date-field')
            .datetimepicker({
              locale: 'pt-BR'
            });
        });
      }
    }
  };
    // Pass in jQuery.
})(jQuery, this, this.document);
//
// Dar o pontapé inicial
//
$(document).on('turbolinks:load', function () {
  $newsPage.go();
});