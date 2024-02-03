def create_records(model_class, records_data)
  model_class.create!(records_data)
end

# Create an admin user
create_records(User, [
  {first_name: "Admin", last_name: "User", username: "admin", email: "admin@example.com", password: "password123", role: "admin"}
])

# Create regular users
create_records(User, [
  {first_name: "User", last_name: "One", username: "user1", email: "user1@example.com", password: "password123", role: "member"},
  {first_name: "User", last_name: "Two", username: "user2", email: "user2@example.com", password: "password456", role: "member"},
  {first_name: "User", last_name: "Three", username: "user3", email: "user3@example.com", password: "password789", role: "member"}
])

# Create teams
create_records(Team, [
  {name: "Team 1"},
  {name: "Team 2"},
  {name: "Team 3"}
])

users = User.all
teams = Team.all

# Assign random roles and memberships
users.each do |user|
  team = teams.sample
  user.teams << team
  user.role = ["owner", "member"].sample
  user.current_team_id = team.id
  user.save!
end
