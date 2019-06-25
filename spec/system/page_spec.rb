# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Pages", type: :system do
  let!(:user) { create :user }
  let!(:work) { create :work, :with_stage, user: user }
  let!(:stage) { work.stages.first }

  before do
    login_as user
    visit work_stage_path(work_id: work.id, id: stage.id)
  end

  it "push a page" do
    login_as user
    visit work_stage_path(work_id: work.id, id: stage.id)
    click_button "ページを増やす"

    expect(page).to have_content "ページを追加しました"
  end

  it "remove a page" do
    accept_alert do
      first(".card-list-item__actions .card-list-item__actions-link").click
    end

    expect(page).to have_content "ページを削除しました"
  end
end
