# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Works", type: :system do
  let!(:user) { create :user }
  let!(:work) { create :work, :with_pages, user: user, title: "おれんじの原稿" }

  before do
    login_as user
    visit works_path
  end

  it "create a work" do
    click_link "原稿を登録する"
    fill_in "タイトル", with: "れもんの原稿"
    select "6", from: "ページ数"
    click_button "登録する"

    expect(page).to have_content "れもんの原稿が登録されました"
  end

  it "edit a work" do
    click_button "編集"
    fill_in "タイトル", with: "りんごの原稿"
    click_button "更新する"

    expect(page).to have_content "りんごの原稿の情報が変更されました"
  end

  it "delete a work" do
    accept_alert do
      click_button "削除"
    end

    expect(page).to have_content "おれんじの原稿を削除しました"
  end
end
