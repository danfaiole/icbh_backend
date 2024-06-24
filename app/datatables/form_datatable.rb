class FormDatatable < AjaxDatatablesRails::Base
  include HomeHelper

  def_delegators :@view, :link_to, :edit_form_path, :form_path

  def view_columns
    @view_columns ||= {
      id: { source: "Form.id", cond: :eq, orderable: true },
      title: { source: "Form.title", cond: :like, searchable: true, orderable: true },
      start_date: { source: "Form.start_date", cond: :like, searchable: true, orderable: true },
      end_date: { source: "Form.end_date", cond: :like, searchable: true, orderable: true },
      active: { source: "Form.active", cond: :like, searchable: true, orderable: true },
      counter: { source: "FormData.count", cond: :eq, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.title,
        start_date: record.start_date.strftime('%d/%m/%Y'),
        end_date: record.end_date.strftime('%d/%m/%Y'),
        active: record.active ? 'Sim' : 'Não',
        counter: record.form_data.count,
        edit_link: action_buttons_datatable_tag(record, 'form')
      }
    end
  end

  private

  def get_raw_records
    Form.select(:id, :title, :start_date, :end_date, :active).all
  end
end
