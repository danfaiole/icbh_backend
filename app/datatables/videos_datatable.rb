class VideosDatatable < AjaxDatatablesRails::Base
  include HomeHelper

  def_delegators :@view, :link_to, :edit_video_path, :video_path

  def view_columns
    @view_columns ||= {
      id: { source: "Video.id", cond: :eq, orderable: true },
      title: { source: "Video.title", cond: :like, searchable: true, orderable: true },
      description: { source: "Video.description", cond: :like, searchable: true, orderable: true },
      published: { source: "Video.published", cond: :null_value, searchable: true, orderable: true },
      publication_date: { source: "Video.publication_date", cond: :date_range, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.title,
        description: record.description,
        published: record.published_status,
        publication_date: record.publication_date,
        edit_link: action_buttons_datatable_tag(record, 'video')
      }
    end
  end

  private

  def get_raw_records
    Video.select(:id, :title, :description, :published, :publication_date).all
  end
end