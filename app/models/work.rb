# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy
  has_many :pages, dependent: :destroy
end
