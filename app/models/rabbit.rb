# frozen_string_literal: true

class Rabbit < ApplicationRecord
  before_save :generate_token

  belongs_to :breed
  has_many :body_weights
  has_many :pellet_weights
  has_many :rabbit_users
  has_many :users, through: :rabbit_users

  accepts_nested_attributes_for :body_weights, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :pellet_weights, allow_destroy: true, reject_if: :all_blank

  def feeding(attributes = {})
    Feeding.new({ rabbit: self, date: Time.current }.merge(attributes))
  end

  def ideal_pellet_gram
    return unless latest_body_weight

    latest_body_weight_gram = latest_body_weight.gram
    coefficient = if latest_body_weight_gram < 400
                    0.07
                  elsif age_of_month <= 6
                    0.05
                  elsif age_of_year < 5
                    0.02
                  elsif age_of_year >= 5
                    0.01
                  end
    latest_body_weight_gram * coefficient
  end

  def latest_body_weight
    body_weights.where('body_weights.gram > ?', 0).order(:scaled_at).last
  end

  def age_of_month(date = Time.current)
    diff_month = date.month - birthday.month >= 0 ? date.month - birthday.month : birthday.month - date.month

    age_of_year * 12 + diff_month
  end

  def age_of_year(date = Time.current)
    date.year - birthday.year
  end

  private

  def generate_token
    self.token ||= SecureRandom.uuid
  end
end
