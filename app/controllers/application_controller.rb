# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit
  helper_method :current_user

  def current_user
    if session[:user_id] && User.where(id: session[:user_id]).present?
      User.find(session[:user_id])
    else
      session.delete(:user_id)
    end
  end
end
