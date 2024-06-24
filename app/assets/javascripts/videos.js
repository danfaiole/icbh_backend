var $videosPage = (function ($, window, document, undefined) {

  /* Pega seletor principal da tela */
  var videosSelector = '.videos-page';

  return {
    go : function () {
      if ( $(videosSelector).length ){
        $videosPage.initialize();
      };
    },
    initialize : function() {
      switch ($(videosSelector).data('action')) {
        case 'index':
          $videosPage.actionFunctions.index();
          break;
        default:
          console.log('Route not implemented yet')
          break;
      }
    },
    actionFunctions : {
      index : function () {
        $('#videos_index_table').dataTable({
          "processing": true,
          "serverSide": true,
          "ajax": $('#videos_index_table').data('source'),
          "pagingType": "full_numbers",
          "columns": [
            {"data": "id"},
            {"data": "title"},
            {"data": "description"},
            {"data": "published"},
            {"data": "publication_date"},
            {"data": "edit_link"}
          ]
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
  $videosPage.go();
});