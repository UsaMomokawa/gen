# frozen_string_literal: true

class Stage < ApplicationRecord
  belongs_to :user
  has_many :progresses
end
