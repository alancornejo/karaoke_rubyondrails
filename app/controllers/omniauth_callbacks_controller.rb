class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  # Para usuarios que usan Twitter
  def twitter
    @user = User.find_for_oauth(env["omniauth.auth"], current_user)

    # Chequea que nuestro usuario se haya guardado en la base de datos y no sea una instancia superficial
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "twitter".capitalize) if is_navigational_format?
    else
      session["devise.twitter_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # PAra usuarios que usan facebook
  def facebook
    @user = User.find_for_oauth(env["omniauth.auth"], current_user)

    # Chequea que nuestro usuario se haya guardado en la base de datos y no sea una instancia superficial
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: "facebook".capitalize) if is_navigational_format?
    else
      session["devise.facebook_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # Para usuarios que usan GMAIL
  def google_oauth2

    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    # Chequea que nuestro usuario se haya guardado en la base de datos y no sea una instancia superficial
    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  # Revisa después de cada login si el mail del usuario es válido
  def after_sign_in_path_for(resource)
    if resource.completed_verified?
      super resource # Acción por defecto de Devise (si no está configurada, va al root_path)
    else
      edit_user_registration_path
      #finish_signup_path(resource)
    end
  end

end