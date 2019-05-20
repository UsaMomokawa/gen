# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  has_many :pages, dependent: :destroy
  has_many :progresses, dependent: :destroy
end
