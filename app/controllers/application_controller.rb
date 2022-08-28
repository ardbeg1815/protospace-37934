class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller? 
  #deviseに属する画面に遷移したとき[configure_permitted_parameters]メソッドを呼び出す。

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :position, :occupation])
  end
end