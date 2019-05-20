# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy
  has_many :pages, dependent: :destroy

  validates :title, presence: true, length: { maximum: 40 }
  validates :total_page, presence: true
end
