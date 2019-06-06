require 'rails_helper'

RSpec.describe User, type: :model do
  it "is invalid with a duplicate email address" do
    FactoryBot.create(:user, email: "hoge@example.com")
    user = FactoryBot.build(:user, email: "hoge@example.com")
    user.valid?
    expect(user.errors[:email]).to include("は既に使われています")
  end
end
