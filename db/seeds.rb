# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'state_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  puts row.to_hash
  t = State.new
  t.name = row['state']
  t.income = row['median_household_income']
  t.unemployed = row['share_unemployed_seasonal']
  t.metro = row['share_population_in_metro_areas']
  t.grads = row['share_population_with_high_school_degree']
  t.save
end
csv_text2 = File.read(Rails.root.join('lib', 'seeds', 'abbreviation.csv'))
csv_text2 = csv_text2.gsub(csv_text2[0], "")
csv_text2 = csv_text2.gsub("\"", "")
csv2 = CSV.parse(csv_text2, :headers => true)
csv2.each do |row|
  t = State.find_by(name: row["State"])
  t.code = row['Code']
  t.save
end