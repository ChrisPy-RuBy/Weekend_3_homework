require_relative('../db/sql_runner')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i 
    @name = options['name']
    @funds = options['funds']
  end

  def save()
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING id"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end 

  def update()
    sql = "
    UPDATE customers SET (
    name,
    funds,
    id
    ) = (
    '#{@name}',
    #{@funds} ,
    #{@id}
    ) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT f.*, t.*, c.* FROM films f
    INNER JOIN tickets t
    ON t.film_id = f.id
    INNER JOIN customers c
    ON c.id = t.customer_id
    ;"
    results = SqlRunner.run(sql)
    return results.map {|film| Film.new(film)}
  end


def Customer.all() #this is a class method
  sql = "SELECT * FROM customers" #this is the sql query to call all the data from the customers table
  customers = SqlRunner.run (sql)
  result = customers.map {|customer| Customer.new (customer)}
  return result
  #this can obviously be refactored using the method demonstrated on thursday
end

def Customer.delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end


end