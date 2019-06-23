# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stage, type: :model do
  let!(:user) { create :user }
  let!(:work) { create :work, :with_pages, user: user }

  it "is invalid with a name which has more than 8 words" do
    stage = Stage.new(name: "#{"w" * 9}")
    stage.valid?
    expect(stage.errors[:name]).to include("が長すぎます")
  end

  it "is invalid with a duplicate name in a work" do
    Stage.create(name: "線画", work: work)
    stage = Stage.new(name: "線画", work: work)
    stage.valid?
    expect(stage.errors[:name]).to include("は既に使われています")
  end
end
