class Stage < ApplicationRecord
  belongs_to :work
  has_many :pages
end
