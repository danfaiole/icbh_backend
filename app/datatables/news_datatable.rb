class NewsDatatable < AjaxDatatablesRails::Base
  include HomeHelper

  def_delegators :@view, :link_to, :edit_news_path, :news_path

  def view_columns
    @view_columns ||= {
      id: { source: "News.id", cond: :eq, orderable: true },
      title: { source: "News.title", cond: :like, searchable: true, orderable: true },
      user_name: { source: "User.name", cond: :like, searchable: true, orderable: true },
      published: { source: "News.published", cond: :null_value, searchable: true, orderable: true },
      publication_date: { source: "News.publication_date", cond: :date_range, searchable: true, orderable: true }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.title,
        user_name: record.user_name,
        published: record.published_status,
        publication_date: record.publication_date,
        edit_link: action_buttons_datatable_tag(record, 'news')
      }
    end
  end

  private

  def get_raw_records
    News.select(:id, :title, 'users.name as user_name', :published, :publication_date)
      .joins(:user)
      .all
  end
end
