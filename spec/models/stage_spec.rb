# frozen_string_literal: true

require "rails_helper"

RSpec.describe Stage, type: :model do
  let!(:work) { create :work }

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

  it "is valid with a duplicate name between works" do
    Stage.create(name: "線画", work: work)

    new_work = FactoryBot.create(:work)
    stage = Stage.new(name: "線画", work: new_work)
    stage.valid?
    expect(stage).to be_valid
  end
end
