require_relative('../db/sql_runner')


class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize (options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price) VALUES ('#{@title}',#{@price}) RETURNING id"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def customers()
    sql = "SELECT c.*, t.*, f.* FROM customers c
    INNER JOIN tickets t
    ON t.customer_id = c.id
    INNER JOIN films f
    ON f.id = t.film_id
    ;"
    results = SqlRunner.run(sql)
    return results.map {|customer| Customer.new(customer)}
  end 

  def Film.all()
    sql = "SELECT * FROM films"
    films = SqlRunner.run (sql)
    result = films.map {|film| Film.new(film)}
    return result 
  end

  def Film.delete_all()
    sql = "DELETE FROM films"
    SqlRunner.run(sql)
  end




end
