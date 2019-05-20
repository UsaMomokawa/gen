class Progress < ApplicationRecord
  belongs_to :stage
  belongs_to :page
end
