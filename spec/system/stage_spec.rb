# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Stages", type: :system do
  let!(:user) { create :user }
  let!(:work) { create :work, :with_stages, user: user }

  it "add a stage" do
    login_as user
    visit works_path
    visit new_work_stage_path(work_id: work)
    fill_in "手順名", with: "線画"
    click_button "登録する"

    expect(page).to have_content "線画が登録されました"
  end
end
