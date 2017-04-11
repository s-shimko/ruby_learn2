require 'sqlite3'

db = SQLite3::Database.open("friends.sqlite")

i = 0
puts "| rowid | first_name | phone | company_id |"

db.execute( "SELECT rowid, first_name, phone, company_id FROM people WHERE company_id = 1" ) do |row|
  puts "| #{row[0]}     | #{row[1]}      | #{row[2]}   |     #{row[3]}     |"
end