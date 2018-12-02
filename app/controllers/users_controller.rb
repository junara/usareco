# frozen_string_literal: true

class UsersController < ApplicationController
  def show
    @rabbits = current_user.rabbits
  end
end
