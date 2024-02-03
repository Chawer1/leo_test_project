class AddCurentTeamToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :current_team, foreign_key: {to_table: :teams}, index: true
  end
end
