require 'sequel'

class GenerateDatabase
  attr_accessor :db, :data

  def initialize
    @db = Sequel.connect "postgres://localhost/billing2"
  end

  def create_database
    system('dropdb', '--if-exists', 'billing2')
    system('createdb', 'billing2')
  end

  def create_tables
    db.create_table(:customers) do
      primary_key :id
      String :name, null: false
      String :payment_token, unique: true, null: false
      constraint(:payment_token_all_caps_eight_chars){ payment_token =~ /^[A-Z]{8}$/ }
    end

    db.create_table(:services) do
      primary_key :id
      String :description, null: false
      BigDecimal :price, size: [10,2], null: false
      constraint(:price_greater_than_zero){ price > 0.00 }
    end

    db.create_table(:customers_services) do
      primary_key :id
      foreign_key :customer_id, :customers, on_delete: :cascade
      foreign_key :service_id, :services
    end
  end

  def populate_data
    customers_data = [
      { name: 'Pat Johnson',   payment_token: 'XHGOAHEQ' },
      { name: 'Nancy Monreal', payment_token: 'JKWQPJKL' },
      { name: 'Lynn Blake',    payment_token: 'KLZXWEEE' },
      { name: 'Chen Ke-Hua',   payment_token: 'KWETYCVX' },
      { name: 'Scott Lakso',   payment_token: 'UUEAPQPS' },
      { name: 'Jim Pornot',    payment_token: 'XKJEYAZA' }
    ]

    services_data = [
      { description: 'Unix Hosting',        price: 5.95 },
      { description: 'DNS',                 price: 4.95 },
      { description: 'Whois Registration',  price: 1.95 },
      { description: 'High Bandwidth',      price: 15.00 },
      { description: 'Business Support',    price: 250.00 },
      { description: 'Dedicated Hosting',   price: 50.00 },
      { description: 'Bulk Email',          price: 250.00 },
      { description: 'One-to-one Training', price: 999.00 }
    ]

    customers_services_data = [
      { customer_id: 1, service_id: 1 },
      { customer_id: 1, service_id: 2 },
      { customer_id: 1, service_id: 3 },
      { customer_id: 3, service_id: 1 },
      { customer_id: 3, service_id: 2 },
      { customer_id: 3, service_id: 3 },
      { customer_id: 3, service_id: 4 },
      { customer_id: 3, service_id: 5 },
      { customer_id: 4, service_id: 1 },
      { customer_id: 4, service_id: 4 },
      { customer_id: 5, service_id: 1 },
      { customer_id: 5, service_id: 2 },
      { customer_id: 5, service_id: 6 },
      { customer_id: 6, service_id: 1 },
      { customer_id: 6, service_id: 6 },
      { customer_id: 6, service_id: 7 }
    ]

    insert_customer_rows(customers_data)
    insert_service_rows(services_data)
    insert_customers_services_rows(customers_services_data)
  end

  def insert_customer_rows(data_array)
    data_array.each do |row|
      db[:customers].insert(name: row[:name], payment_token: row[:payment_token])
    end
  end

  def insert_service_rows(data_array)
    data_array.each do |row|
      db[:services].insert(description: row[:description], price: row[:price])
    end
  end

  def insert_customers_services_rows(data_array)
    data_array.each do |row|
      db[:customers_services].insert(customer_id: row[:customer_id],
                                   service_id:  row[:service_id])
    end
  end
end

class QueryDatabase
  attr_accessor :db

  def initialize
    @db = Sequel.connect "postgres://localhost/billing2"
  end

  def customers_with_services
    db[:customers].select(%i(customers__id name payment_token))
                      .distinct
                      .join_table(:inner, :customers_services, customer_id: :id)
  end
end

db = GenerateDatabase.new

database_created = db.create_database

if database_created
  db.create_tables
  db.populate_data
  puts "database created"
end

billing = QueryDatabase.new

puts billing.customers_with_services.all
