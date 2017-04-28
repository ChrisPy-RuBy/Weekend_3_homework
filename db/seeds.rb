
require_relative('../models/customer.rb')
require_relative('../models/films.rb')
require_relative('../models/tickets.rb')
require('pry-byebug')

Customer.delete_all() #these methods are called to clear the database
Film.delete_all()
# Ticket.delete_all()


customer1 = Customer.new({
  'name' => 'Dr Patel',
  'funds' => 1000
  })

customer2 = Customer.new({
  'name' => 'Dirk Nasty', 
  'funds' => 20
  })

customer3 = Customer.new({
  'name' => 'Nardinold P. Tuckwitt',
   'funds' => 200
   })

customer1.save()
customer2.save()
customer3.save()

film1 = Film.new({
  'title' => 'Forest Gump',
  'price' => 5})

film2 = Film.new({
  'title' => 'Back to the future',
  'price' => 5})

film3 = Film.new({
  'title' => 'The evil dead 2',
  'price' => 5})

film1.save()
film2.save()
film3.save()

ticket1 = Ticket.new({
  'customer_id' => customer1.id,
  'film_id' => film1.id
  })

ticket1.save()


binding.pry
nil