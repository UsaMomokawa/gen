class User < ApplicationRecord
  has_many :works
  has_many :stages
end
