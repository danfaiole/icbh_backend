module ApplicationHelper
  ##
  # Encapsula o container da página com as classes customizadas
  # de controle de javascript
  # Params:
  #   - &block: Bloco de código
  def container_tag(&block)
    content = block_given? ? capture(&block) : ''.html.safe
    div_class = "wrapper #{controller_name}-page"

    content_tag(
      :div, content, class: div_class, id: 'main_div_container',
      data: { action: action_name }
    )
  end

  ##
  # Cria uma linha com as colunas do bootstrap para facilitar na construção
  # do layout. Ainda foi implementado apenas um tamanho de tela.
  # Params:
  #   - md: Tamanho da coluna média do bootstrap
  #   - &block: Bloco de código
  def div_col_tag(md = 12, &block)
    content = block_given? ? capture(&block) : ''.html.safe
    div_class = "col-md-#{md}"
    content_tag(:div, content, class: div_class, id: 'div_container')
  end

  ##
  # Cria o breadcrumb ao lado do título para navegação rápida
  def breadcrumb_links
    # Controller exceptions
    exceptions = ['pictures', 'home']

    link = link_to("<i class='fa fa-desktop'></i>Início".html_safe, root_path)
    li = content_tag(:li, link)

    if !exceptions.include?(cookies[:last_controller_name]) &&
      cookies[:last_action_name] != 'destroy' &&
      (action_name != cookies[:last_action_name] ||
      controller_name != cookies[:last_controller_name])

      link = link_to(create_description_for_breadcrumb(cookies[:last_action_name], cookies[:last_controller_name]), :back)
      li << content_tag(:li, link)
    end

    li << content_tag(:li, create_description_for_breadcrumb(action_name))

    ol = content_tag(:ol, li, class: "breadcrumb")
    ol
  end

  ##
  # Function to create the description for the breadcrumb, since it was a repeating code
  # I created a new function to use it everywhere
  def create_description_for_breadcrumb(action_name, last_controller_name = nil)
    description = t("action_controller.action_names.#{action_name}").to_s

    if last_controller_name.present?
      description << " " + t("action_controller.controller_names.#{last_controller_name}").to_s
    else
      description << " " + t("action_controller.controller_names.#{controller_name}").to_s
    end

    description << (action_name == 'index' ? "s" : "")
  end

  def add_fields_for(description, f, association, options = {partial_name: nil, class: nil})
    new_object = f.object.send(association).klass.new
    id = new_object.object_id

    fields = f.fields_for(association, new_object, child_index: id) do |builder|
      partial = options[:partial_name].nil? ? association.to_s + '_fields' : options[:partial_name]

      render(partial, f: builder)
    end

    link_to(
      description.html_safe, '#', class: "add-fields-for-link #{options[:class]}",
      data: {id: id, fields: fields.gsub('\n', '')}
    )
  end
end