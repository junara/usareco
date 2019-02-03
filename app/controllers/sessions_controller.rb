# frozen_string_literal: true

class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(request.env['omniauth.auth'])
    # いろんなユーザーに使ってもらうためには、ここらへんをいじる
    if Rails.env.production?
      if user.persisted? && user.save!
        session[:user_id] = user.id
        redirect_to rabbits_path
      else
        redirect_to root_path
      end
    else
      if user.save!
        session[:user_id] = user.id
        redirect_to rabbits_path
      else
        redirect_to root_path
      end
    end
  end

  def destroy
    # raise
    session.delete(:user_id)
    redirect_to root_path
  end
end
