class API::V1::RegisterPhonesController < ApiController
  def create
    new_phone = RegisteredPhone.new(phone_params)

    if new_phone.save
      render json: { new_phone: { id: new_phone.id } }, status: :created
    else
      render json: { new_phone: { id: '' } }, status: :unprocessable_entity
    end
  end

  private

  def phone_params
    params.require(:new_phone).permit(:phone_id)
  end
end