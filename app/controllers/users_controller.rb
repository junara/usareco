# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @rabbits = current_user.rabbits
    @user = policy_scope(User).find(params[:id])
  end
end
