class ApplicationController < ActionController::Base


  protected

  def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_books_path(resource)
  when User
    user_path(resource)
  end
  end



  #sign_out後のredirect先変更する。rootパスへ。rootパスはhome topを設定済み。
  def after_sign_out_path_for(resource)
    root_path
  end

protected

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:name])
    #sign_upの際にnameのデータ操作を許。追加したカラム。
  end
end
