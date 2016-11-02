require 'sequel'

DB = Sequel.connect("postgres://localhost/billing2")

def query
  DB[:customers].select { [customers__name,
                           services__description,
                           services__price.cast(:money)] }
                .inner_join(:customers_services, customer_id: :id)
                .inner_join(:services, services__id: :service_id)
                .order(:customers__name, :services__description)
end

def print_service(row)
  puts "  #{row[:description]} #{row[:price]}"
end

current_name = nil

query.each do |row|
  name = row[:name]
  if current_name != name
    current_name = name
    puts "#{current_name}"
    print_service(row)
  else
    print_service(row)
  end
end
