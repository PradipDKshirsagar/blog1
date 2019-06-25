require 'rails_helper'

RSpec.describe "Article", type: :model do
  let!(:article) {FactoryBot.create(:article) }
  it "has a valid factory" do
    expect(article).to be_valid
  end
end
