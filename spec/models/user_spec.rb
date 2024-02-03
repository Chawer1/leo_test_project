# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string           default(""), not null
#  last_name              :string           default(""), not null
#  username               :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  current_team_id        :bigint
#  sign_in_count          :integer          default(0), not null
#  role                   :string
#  avatar                 :string
#
# Подключите необходимые зависимости и фабрику
require "rails_helper"

RSpec.describe User, type: :model do
  # Создайте пользователя для использования в тестах
  let(:user) { create(:user) }

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:username) }
    it { should allow_value("validemail@example.com").for(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  describe "associations" do
    it { should have_one(:profile).dependent(:destroy) }
    it { should have_many(:memberships) }
    it { should have_many(:teams).through(:memberships) }
    it { should belong_to(:current_team).class_name("Team").optional }
  end

  describe "methods" do
    it "should return the correct sign_in_count" do
      expect(user.sign_in_count).to eq(0)
    end

    it "should check if user is an admin" do
      expect(user.admin?).to be_falsey
    end
  end

  describe "devise" do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_confirmation_of(:password) }
  end

  describe "login method" do
    it "should find user by username or email" do
      found_user = User.find_for_database_authentication({login: user.username})
      expect(found_user).to eq(user)

      found_user_by_email = User.find_for_database_authentication({login: user.email})
      expect(found_user_by_email).to eq(user)
    end
  end
end
