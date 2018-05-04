class Transaction
  
  attr_reader :id
  attr_accessor :date, :amount, :merchant_id, :category_id

  def initialize(options)
    @id = options['id'].to_i options['id']
    @date = options['date']
    @merchant_id = options['merchant_id']
    @category_id = options['category_id']
  end

end