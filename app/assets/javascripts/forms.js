var $formPage = (function ($, window, document, undefined) {

  /* Pega seletor principal da tela */
  var formSelector = '.forms-page';

  return {
    go : function () {
      if ( $(formSelector).length ){
        $formPage.initialize();
      };
    },
    initialize : function() {
      switch ($(formSelector).data('action')) {
        case 'index':
          $formPage.actionFunctions.index();
          break;
        case 'new': /* O primeiro status da tela é new */
          $formPage.actionFunctions.new();
          break;
        case 'create': /* Caso ache o erro o status vira create */
          $formPage.actionFunctions.new();
          break;
        case 'edit':
          $formPage.actionFunctions.new();
          break;
        case 'show':
          $formPage.actionFunctions.show();
          break;
        default:
          console.log('Route not implemented yet')
          break;
      }
    },
    actionFunctions : {
      index : function () {
        $('#forms_index_table').dataTable({
          "processing": true,
          "serverSide": true,
          "ajax": $('#forms_index_table').data('source'),
          "pagingType": "full_numbers",
          "columns": [
            {"data": "id"},
            {"data": "title"},
            {"data": "start_date"},
            {"data": "end_date"},
            {"data": "active"},
            {"data": "counter"},
            {"data": "edit_link"}
          ]
        });
      },

      new : function(){
        $('#form_end_date,#form_start_date').datetimepicker({
          locale: 'pt-BR',
          format: "DD/MM/YYYY"
        });

        $('#form_data_table').dataTable();
      },

      show: function(){
        $('#form_data_table').dataTable();
      }
    }
  };
  // Pass in jQuery.
})(jQuery, this, this.document);
//
// Dar o pontapé inicial
//
$(document).on('turbolinks:load', function () {
  $formPage.go();
});