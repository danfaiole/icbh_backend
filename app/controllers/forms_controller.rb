class FormsController < ApplicationController
  before_action :set_form, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: FormDatatable.new(view_context) }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="cadastros.xlsx"'
      }
    end
  end

  def new
    @form = Form.new
  end

  def edit
  end

  def create
    @form = Form.new(form_params)

    respond_to do |format|
      if @form.save
        format.html { redirect_to @form, notice: 'Formulário criado com sucesso.' }
        format.json { render :show, status: :created, location: @form }
      else
        format.html { render :new }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @form.update(form_params)
        format.html { redirect_to @form, notice: 'Formulário alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @form }
      else
        format.html { render :edit }
        format.json { render json: @form.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @form.destroy
    respond_to do |format|
      format.html { redirect_to forms_url, notice: 'Formulário apagado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    def set_form
      @form = Form.find(params[:id])
    end

    def form_params
      params.require(:form).permit(
        :title, :help_text, :fields, :start_date, :end_date,
        :active
      )
    end
end
