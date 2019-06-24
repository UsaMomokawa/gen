# frozen_string_literal: true

require "rails_helper"

RSpec.describe Work, type: :model do
  it "is invalid with a title which has more than 40 words" do
    work = FactoryBot.build(:work, title: "#{"w" * 41}")
    work.valid?
    expect(work.errors[:title]).to include("が長すぎます")
  end

  it "is invalid when user set a deadline on yesterday" do
    work = FactoryBot.build(:work, deadline: Date.yesterday)
    work.valid?
    expect(work.errors[:deadline]).to include(": 過去の日時は設定できません")
  end

  it "is invalid with a duplicate title in a user" do
    user = FactoryBot.create(:user)
    work = FactoryBot.create(:work, user: user, title: "木陰の鳩")
    new_work = FactoryBot.build(:work, user: user, title: "木陰の鳩")
    new_work.valid?
    expect(new_work.errors[:title]).to include("は既に使われています")
  end
end
