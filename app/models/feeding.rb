# frozen_string_literal: true

class Feeding
  include ActiveModel::Model
  include Virtus.model
  attribute :body_weight, BodyWeight
  attribute :pellet_weight, PelletWeight
  attribute :rabbit, Rabbit
  attribute :date, Date

  def initialize(attributes = {})
    super(attributes)
    @body_weight ||= @rabbit.body_weights.where(scaled_at: @date.in_time_zone.all_day).first
    @pellet_weight ||= @rabbit.pellet_weights.where(fed_at: @date.in_time_zone.all_day).first
  end

  def builds
    @body_weight = @rabbit.body_weights.where(scaled_at: @date.in_time_zone.all_day).first || @rabbit.body_weights.new
    @pellet_weight = @rabbit.pellet_weights.where(fed_at: @date.in_time_zone.all_day).first || @rabbit.pellet_weights.new
  end

  def body_weight_attributes=(attributes)
    if attributes.key?('id')
      @body_weight = @rabbit.body_weights.find(attributes['id'])
      @body_weight.assign_attributes(attributes.merge(scaled_at: @date))
    else
      @body_weight = @rabbit.body_weights.new(attributes.merge(scaled_at: @date))
    end
  end

  def pellet_weight_attributes=(attributes)
    if attributes.key?('id')
      @pellet_weight = @rabbit.pellet_weights.find(attributes['id'])
      @pellet_weight.assign_attributes(attributes.merge(fed_at: @date))
    else
      @pellet_weight = @rabbit.pellet_weights.new(attributes.merge(fed_at: @date))
    end
  end
end
