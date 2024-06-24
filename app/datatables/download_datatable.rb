class DownloadDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_download_path

  def view_columns
    @view_columns ||= {
      id: { source: "Download.id", cond: :eq },
      title: { source: "Download.title", cond: :like, searchable: true, orderable: true },
      description: { source: "Download.description" }
    }
  end

  def data
    records.map do |record|
      {
        id: record.id,
        title: record.title,
        description: record.description,
        edit_link: link_to('<i class="fa fa-pencil"></i>'.html_safe, edit_download_path(record.id))
      }
    end
  end

  private

  def get_raw_records
    Download.all
  end
end
