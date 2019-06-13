# frozen_string_literal: true

class User < ApplicationRecord
  has_many :works, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 8..32 }
  validates :password_confirmation, presence: true
end
