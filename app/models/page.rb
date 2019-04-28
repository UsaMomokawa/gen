class Page < ApplicationRecord
  belongs_to :work

  enum status: {
    not_start: 0,
    pending: 1,
    complete: 2
  }
end
