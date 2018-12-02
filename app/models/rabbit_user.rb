# frozen_string_literal: true

class RabbitUser < ApplicationRecord
  belongs_to :user
  belongs_to :rabbit
end
