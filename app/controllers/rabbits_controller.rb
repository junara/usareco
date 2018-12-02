# frozen_string_literal: true

class RabbitsController < ApplicationController
  before_action :set_rabbit, only: %i[show edit update destroy]

  def index
    @rabbits = policy_scope(Rabbit)
  end

  def show
    year = (params[:year] || Time.current.year).to_i
    month = (params[:month] || Time.current.month).to_i
    day = (params[:day] || Time.current.day).to_i
    @date = Date.new(year, month, day)
  end

  private

  def set_rabbit
    @rabbit = policy_scope(Rabbit).find(params[:id])
  end
end
