require 'sqlite3'

db = SQLite3::Database.open("friends.sqlite")

c_id = db.execute("SELECT id FROM companies WHERE company_name = 'Invento'")

puts "| rowid | first_name | phone | company_id |"

db.execute("SELECT rowid, first_name, phone, company_id FROM people WHERE company_id = ?", c_id) do |row|
  puts "| #{row[0]}     | #{row[1]}      | #{row[2]}   |     #{row[3]}     |"
end

puts
puts "OR"
puts

puts "| rowid | first_name | phone | company_id |"

db.execute("SELECT rowid, first_name, phone, company_id FROM people WHERE company_id = " +
               "(SELECT id FROM companies WHERE company_name = 'Epam')") do |row|
  puts "| #{row[0]}     | #{row[1]}      | #{row[2]}   |     #{row[3]}     |"
end