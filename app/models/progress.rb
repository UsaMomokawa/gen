# frozen_string_literal: true

class Progress < ApplicationRecord
  belongs_to :stage
  belongs_to :page
  belongs_to :work

  enum status: {
    not_complete: 0,
    started: 1,
    complete: 2
  }
end
