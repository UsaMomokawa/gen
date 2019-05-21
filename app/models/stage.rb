# frozen_string_literal: true

class Stage < ApplicationRecord
  belongs_to :stage
  has_many :progresses

  validates :name, presence: true, length: { maximum: 8 }
end
