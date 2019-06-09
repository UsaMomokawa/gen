# frozen_string_literal: true

class Page < ApplicationRecord
  belongs_to :work
  has_many :progresses, dependent: :destroy
end
