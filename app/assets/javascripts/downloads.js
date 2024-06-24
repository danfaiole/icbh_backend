var $downloadPage = (function ($, window, document, undefined) {
  
  /* Pega seletor principal da tela */
  var downloadSelector = '.downloads-page';
  
  return {
    go : function () {
      if ( $(downloadSelector).length ){
        $downloadPage.initialize();
      };
    },
    initialize : function() {
      switch ($(downloadSelector).data('action')) {
        case 'index':
          $downloadPage.actionFunctions.index();
          break;
        default:
          console.log('Route not implemented yet')
          break;
      }
    },
    actionFunctions : {
      index : function () {
        $('#downloads_index_table').dataTable({
          "processing": true,
          "serverSide": true,
          "ajax": $('#downloads_index_table').data('source'),
          "pagingType": "full_numbers",
          "columns": [
            {"data": "id"},
            {"data": "title"},
            {"data": "description"},
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
  $downloadPage.go();
});