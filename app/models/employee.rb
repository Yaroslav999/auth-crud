# frozen_string_literal: true

class Employee < ApplicationRecord
  paginates_per 10

  belongs_to :department

  validates :name, presence: true
end
