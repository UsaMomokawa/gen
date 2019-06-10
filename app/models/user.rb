# frozen_string_literal: true

class User < ApplicationRecord
  has_many :works, dependent: :destroy

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
end
