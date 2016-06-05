class Users::PasswordsController < Devise::PasswordsController
  append_before_action :assert_reset_token_passed, only: :edit

  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  def create
    puts "Aqui se deberia mostrar el contenido enviado"
    puts resource_params.to_json

    self.resource = User.send_reset_password_instructions(resource_params)
    yield resource if block_given?

    puts "Aqui se deberia mostrar el contenido enviado"
    puts resource.to_json

    if successfully_sent?(resource)
      respond_with({}, location: after_sending_reset_password_instructions_path_for(resource_name))
    else
      respond_with(resource)
    end
  end

  # GET /resource/password/edit?reset_password_token=abcdef
  def edit
    self.resource = resource_class.new
    set_minimum_password_length
    resource.reset_password_token = params[:reset_password_token]
    puts "Aqui se deberia mostrar el contenido recibido"
    puts resource.to_json
  end

  # PUT /resource/password
  def update
    puts "Aqui se deberia mostrar el contenido recibido"
    puts resource_params.to_json

    self.resource = resource_class.reset_password_by_token(resource_params)
    yield resource if block_given?

    if resource.errors.empty?
      resource.unlock_access! if unlockable?(resource)
      if Devise.sign_in_after_reset_password
        flash_message = resource.active_for_authentication? ? :updated : :updated_not_active
        set_flash_message!(:notice, flash_message)
        sign_in(resource_name, resource)
      else
        set_flash_message!(:notice, :updated_not_active)
      end
      respond_with resource, location: after_resetting_password_path_for(resource)
    else
      set_minimum_password_length
      respond_with resource
    end
  end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
end
