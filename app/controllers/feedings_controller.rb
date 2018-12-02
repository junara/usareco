# frozen_string_literal: true

class FeedingsController < ApplicationController
  before_action :set_rabbit, only: %i[new show edit create update destroy]

  def new
    @date = Time.parse(params[:date]).in_time_zone
    @feeding = @rabbit.feeding(date: @date)
    @feeding.builds
  end

  def create
    @feeding = @rabbit.feeding(feeding_params)
    @feeding.pellet_weight.save!
    @feeding.body_weight.save!
    redirect_to controller: 'rabbits', action: 'show', id: @rabbit.id
  end

  private

  def feeding_params
    params.require(:feeding).permit(
      :date,
      body_weight_attributes: %i[id gram],
      pellet_weight_attributes: %i[id gram]
    ).merge(rabbit: Rabbit.find(params[:rabbit_id]))
  end

  def set_rabbit
    @rabbit = policy_scope(Rabbit).find(params[:rabbit_id])
  end
end
