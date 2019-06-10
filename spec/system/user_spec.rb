# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :system do
  it "can sign up" do
    visit new_user_path
    fill_in "名前", with: "test"
    fill_in "メールアドレス", with: "test@example.com"
    fill_in "パスワード", with: "testtest"
    fill_in "パスワード(確認)", with: "testtest"
    click_button "登録する"

    expect(page).to have_content "アカウントを登録しました"
  end
end
