class Page < ApplicationRecord
  belongs_to :stage

  enum status: {
    not_complete: 0,
    started: 1,
    complete: 2
  }
end
