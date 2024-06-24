module HomeHelper
  def action_buttons_datatable_tag(record, model_name)
    html = link_to(
      '<i class="fa fa-eye"></i>'.html_safe,
      eval("#{model_name}_path(record.id)"),
      class: 'btn btn-primary'
    )

    html << link_to(
      '<i class="fa fa-pencil"></i>'.html_safe,
      eval("edit_#{model_name}_path(record.id)"),
      class: 'btn btn-info'
    )

    html << link_to(
      '<i class="fa fa-trash"></i>'.html_safe,
      record,
      method: :delete,
      data: { confirm: 'Tem certeza que deseja deletar o registro?' },
      class: 'btn btn-danger datatable-button'
    )

    html
  end
end
