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
      String :payment_token, unique: true
      constraint(:payment_token_all_caps_eight_chars){payment_token =~ /^[A-Z]{8}$/}
    end

    db.create_table(:services) do
      primary_key :id
      String :description, null: false
      BigDecimal :price, size: [10,2]
      constraint(:price_greater_than_zero){price > 0.00}
    end

    db.create_table(:customers_services) do
      primary_key :id
      foreign_key :customer_id, :customers, on_delete: :cascade
      foreign_key :service_id, :services
    end
  end

  def create_tables_and_data
    create_tables
    populate_data 
  end

  def populate_data
    customers.insert(
      'Pat Johnson', 'XHGOAHEQ'
      'Nancy Monreal', 'JKWQPJKL'
      'Lynn Blake', 'KLZXWEEE'
      'Chen Ke-Hua', 'KWETYCVX'
      'Scott Lakso', 'UUEAPQPS'
      'Jim Pornot', 'XKJEYAZA'    
    )
  end

  def insert_customer_row(name, token)
    db.customers.insert(name: name, payment_token: token)
  end

  def insert_service_row(name, token)
    db.services.insert(name: name, payment_token: token)
  end

  def insert_customers_services_row(name, token)
    db.customers_services.insert(name: name, payment_token: token)
  end
end

db = GenerateDatabase.new

database_created = db.create_database

if database_created
  db.create_tables
  db.populate_data
end
