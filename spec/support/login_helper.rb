# frozen_string_literal: true

module LoginHelper
  def login_as(user)
    visit "/login"
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログイン"
  end
end

RSpec.configure do |config|
  config.include LoginHelper
end
