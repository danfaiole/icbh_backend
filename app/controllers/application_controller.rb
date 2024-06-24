class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :save_last_action_and_controller_name

  ##
  # Salva o nome da ultima ação do controlador para
  # que possa ser usado no breadcrumb de navegação
  def save_last_action_and_controller_name
    cookies[:last_action_name] = action_name
    cookies[:last_controller_name] = controller_name
  end

  ##
  # Uso a ação para contar os eventos do mês e colocar
  # no badge do menu lateral
  def count_events
    cookies[:events_counter] = Event.select(1).where("date_part('month', start_date) = ?", Time.now.month).count
  end
end
