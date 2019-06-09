# frozen_string_literal: true

require "rails_helper"

RSpec.describe Work, type: :model do
  it "is invalid with a title which has more than 41 words" do
    work = FactoryBot.build(:work, title: "#{"w" * 41}")
    work.valid?
    expect(work.errors[:title]).to include("が長すぎます")
  end

  it "is invalid when user set a deadline on yesterday" do
    work = FactoryBot.build(:work, deadline: Date.yesterday)
    work.valid?
    expect(work.errors[:deadline]).to include(": 過去の日時は設定できません")
  end
end
