# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  team_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

RSpec.describe Membership, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:team) }
end
