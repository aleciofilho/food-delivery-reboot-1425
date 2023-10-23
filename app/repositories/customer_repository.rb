class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @customers = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def create(customer)
    customer.id = @next_id
    @next_id += 1
    @customers << customer
    save_csv
  end

  def all
    @customers
  end
  
  def find(customer_id)
    @customers.find { |customer| customer.id == customer_id }
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %i[id name address]
      @customers.each do |customer|
        csv << [customer.id, customer.name, customer.address]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      # row[:name]
      # row[:address]
      @customers << Customer.new(row)
    end
    @next_id = @customers.last.id + 1 if !@customers.empty?
  end
end