# frozen_string_literal: true

class Work < ApplicationRecord
  belongs_to :user
  has_many :progresses, dependent: :destroy
  has_many :pages, dependent: :destroy
  has_many :stages, dependent: :destroy

  validates :title, presence: true, length: { maximum: 40 }
  validate :deadline_cannnot_be_in_the_past

  def deadline_cannnot_be_in_the_past
    if deadline.present? && deadline < Date.today
      errors.add(:deadline, ": 過去の日時は設定できません")
    end
  end
end
