require_relative '../db/sql_runner.rb'

class Category

  attr_reader :id
  attr_accessor :name

  def initialize options
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save
    sql = "INSERT INTO categories (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update
    sql = "UPDATE categories SET name = $1"
    # FIXME where id = $5
    values = [@name]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM categories WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "DELETE FROM categories"
    SqlRunner.run(sql)
  end

end