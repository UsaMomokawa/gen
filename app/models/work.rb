class Work < ApplicationRecord
  has_many :pages, dependent: :destroy
end
