# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Users", type: :system do
  context "before login" do
    it "create a user" do
      visit new_user_path
      fill_in "名前", with: "hitoshi"
      fill_in "メールアドレス", with: "hitoshi@example.com"
      fill_in "パスワード(8文字以上)", with: "testtest"
      fill_in "パスワード(確認)", with: "testtest"
      click_button "登録する"

      expect(page).to have_content "アカウントを登録しました"
    end
  end

  context "after login" do
    let!(:user) { create :user, name: "mitsuru" }

    it "update a user" do
      login_as user
      visit edit_user_path(user)
      fill_in "名前", with: "masashi"
      fill_in "メールアドレス", with: "masashi@example.com"
      fill_in "パスワード(8文字以上)", with: "masashi111"
      fill_in "パスワード(確認)", with: "masashi111"
      click_button "更新する"

      expect(page).to have_content "アカウント情報を更新しました"
    end

    it "delete a user" do
      login_as user
      visit edit_user_path(user)
      accept_alert do
        first(".form-footer__items .form-footer__items-link").click
      end

      expect(page).to have_content "アカウントを削除しました"
    end
  end
end
