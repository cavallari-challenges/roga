# frozen_string_literal: true

class Complaint < ApplicationRecord
  validates :title, :description, presence: true
  belongs_to :user
  enum status: { new: 0, under_analisys: 1, done: 2 }, _prefix: true
  attribute :location_point, Types::GeoType.new
end
