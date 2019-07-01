# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required

  private
    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def login_required
      unless current_user
        redirect_to welcome_path, alert: "ログインしてください"
      end
    end
end
