# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  has_many :stages
  has_many :pages
end
