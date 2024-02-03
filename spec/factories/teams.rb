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
FactoryBot.define do
  factory :team do
    name { Faker::Team.name }
  end
end
