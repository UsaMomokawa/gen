class Stage < ApplicationRecord
  belongs_to :user
  has_many :pages
end
