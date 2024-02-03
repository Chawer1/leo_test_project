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
class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one_attached :avatar

  has_one :profile, dependent: :destroy
  has_many :memberships
  has_many :teams, through: :memberships
  belongs_to :current_team, class_name: "Team", optional: true

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true, format: {with: /\A[a-zA-Z0-9_\.]*\z/}
  validates :email, presence: true, uniqueness: true
  # validates :avatar, content_type: ['image/jpeg', 'image/png', 'image/gif']
  # validates :role, inclusion: {in: %w[admin owner member], message: "%{value} is not a valid role"}

  attr_accessor :login

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", {value: login.downcase}]).first
  end

  def admin?
    role == "admin"
  end
end
