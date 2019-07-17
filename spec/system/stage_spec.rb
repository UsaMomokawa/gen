# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Stages", type: :system do
  let!(:user) { create :user }
  let!(:work) { create :work, :with_stage, user: user }
  let!(:stage) { work.stages.first } # stage.name = "線画"

  before do
    login_as user
  end

  it "add anoter stage" do
    visit new_work_stage_path(work_id: work.id)
    fill_in "工程名", with: "トーン"
    click_button "登録する"

    expect(page).to have_content "トーンが登録されました"
  end

  it "edit a stage" do
    visit edit_work_stage_path(work_id: work.id, id: stage.id)
    fill_in "工程名", with: "下書き"
    click_button "更新する"

    expect(page).to have_content "工程を更新しました"
  end

  it "delete a stage" do
    visit work_stages_path(work_id: work.id)
    accept_alert do
      click_link "削除"
    end

    expect(page).to have_content "工程を削除しました"
  end
end
