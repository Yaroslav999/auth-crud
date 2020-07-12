# frozen_string_literal: true

class Department < ApplicationRecord
  paginates_per 10

  has_many :employees, dependent: :destroy

  validates :name, presence: true
end
