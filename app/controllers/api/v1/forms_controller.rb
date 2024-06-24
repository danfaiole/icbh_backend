class API::V1::FormsController < ApiController
  def create
    current_form = Form.find_by(active: true)

    current_form.skip_callback = true
    current_form.form_data.build(data: forms_params)

    if current_form.save
      render json: { message: "Cadastro efetuado!" }, status: :created
    else
      render json: { message: "Cadastrado com erro!" }, status: :unprocessable_entity
    end
  end

  def get_help_text
    current_form = Form.find_by(active: true)

    render json: current_form
  end

  private

  def forms_params
    params.require(:form).permit(
      "fullName", "birthday", "city", "leader", "specialNeed",
      "specialNeedDetails", "privateRoom", "phone", "cpf",
      "email", "dependants"
    )
  end
end