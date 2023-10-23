require_relative '../views/customers_view'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def add
    name = @customers_view.ask_name
    address = @customers_view.ask_address
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  def list
    customers = @customer_repository.all
    @customers_view.display_all(customers)
  end

end