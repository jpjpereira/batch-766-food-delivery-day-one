class CustomersView
  def ask_for(attribute)
    puts "What's the #{attribute} of the customer?"
    gets.chomp
  end

  def display(customers)
    customers.each do |customer|
      puts "#{customer.id} - #{customer.name} - #{customer.address}"
    end
  end
end
