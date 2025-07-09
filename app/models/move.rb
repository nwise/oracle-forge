# frozen_string_literal: true

class Move < ApplicationRecord
  validates_presence_of :name, :description

  scope :ordered, -> { order(id: :desc) }
end
