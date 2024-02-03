# == Schema Information
#
# Table name: teams
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "rails_helper"

RSpec.describe Team, type: :model do
  it "should have a valid factory" do
    team = create(:team)
    expect(team).to be_valid
  end

  it "should require a name" do
    team = build(:team, name: nil)
    expect(team).not_to be_valid
  end

  it "should allow a description to be optional" do
    team = build(:team, description: nil)
    expect(team).to be_valid
  end

  it "should have many memberships" do
    should have_many(:memberships)
  end

  it "should have many users through memberships" do
    should have_many(:users).through(:memberships)
  end
end
