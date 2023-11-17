# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.destroy_all
Company.destroy_all
Contract.destroy_all
# Create Users
users = User.create!([
  { name: "Alice Smith", email: "alice@example.com" },
  { name: "Bob Johnson", email: "bob@example.com" }
])

# Create Companies
companies = Company.create!([
  { name: "Tech Corp" },
  { name: "Business Inc." }
])

# Create Contracts
contracts = Contract.create!([
  { user_id: users[0].id, company_id: companies[0].id, average_weekly_hours: 40.0, hourly_wage: 20.50, valid_from: Date.new(2023, 1, 1), valid_to: Date.new(2023, 6, 30) },
  { user_id: users[1].id, company_id: companies[1].id, average_weekly_hours: 35.0, hourly_wage: 18.75, valid_from: Date.new(2023, 2, 1), valid_to: Date.new(2023, 7, 31) }
])

puts "Created #{User.count} users, #{Company.count} companies, and #{Contract.count} contracts."