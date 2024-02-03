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
class Team < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  validates :name, presence: true

  def user_has_role?(user, role)
    membership = memberships.find_by(user_id: user.id)
    membership.present? && user.role == role
  end
end
