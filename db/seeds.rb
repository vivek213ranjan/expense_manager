# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def price_range(category)
	min = 0.0
	max = 5000.00
	case 
	when "Beverage"
		min = 30.50
		max = 50.35
	when "Food"
		min = 40.30
		max = 120.0
	when "Book"
		min = 200.00
		max = 350.00
	when "Petrol"
		min = 50.05
		max = 300.10
	when "Clothes"
		min = 400.00
		max = 2200.00
	end
	# byebug
	rand * (max-min) + min
end


%w(Beverage Food Book Petrol Clothes).each do |category|
	60.times do |index|
		Expense.create(category: category, date: DateTime.now - index.days, amount: price_range(category))
	end
end
