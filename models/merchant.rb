class Merchant
  
  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i options['id']
    @name = options['name']
  end
end