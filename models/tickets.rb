require_relative('../db/sql_runner')
require_relative('customer')
require_relative('films')


class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id


def initialize(options)
  @id = options['id'].to_i
  @customer_id = options['customer_id'].to_i
  @film_id = options['film_id'].to_i
end

def Ticket.all()
  sql = "SELECT * FROM tickets"
  tickets = SqlRunner.run(sql)
  result = tickets.map {|ticket| Ticket.new(ticket)}
  return result
end

def Ticket.delete_all()
  sql = "DELETE FROM tickets"
  SqlRunner.new( sql )  
end

def save()
  sql = "INSERT into tickets (customer_id, film_id) VALUES (#{@customer_id}, #{@film_id}) RETURNING id"
  ticket = SqlRunner.run(sql).first
  @id = ticket['id'].to_i
end
end
