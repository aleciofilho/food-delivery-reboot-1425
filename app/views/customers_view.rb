class CustomersView
  def ask_name
    puts "What's the customer's name"
    gets.chomp
  end
  
  def ask_address
    puts "What's the customer's address"
    gets.chomp
  end

  def display_all(customers)
    customers.each_with_index do |customer, i|
      puts "#{i + 1} - #{customer.name}"
    end
  end
end