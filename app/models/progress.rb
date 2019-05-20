class Progress < ApplicationRecord
  belongs_to :stage
  belongs_to :page

  enum status: {
    not_complete: 0,
    started: 1,
    complete: 2
  }
end
