# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

transx = Company.create(name: 'TransX', email: 'info@transx.com', description: 'A shipping company',
                        phone_number: '1-800-123-4567')
User.create(company: transx, name: 'Sam', role: 'admin', email: 'admin@transx.com',
            password_hash: '$2b$12$h0q30TiUGYGhqvnBtm6hdOps3MQhSrOi6C89vyBCcYNqzxkpAoJrm') # 123465
User.create(company: transx, name: 'Kit', role: 'driver', email: 'driver@transx.com',
            password_hash: '$2b$12$h0q30TiUGYGhqvnBtm6hdOps3MQhSrOi6C89vyBCcYNqzxkpAoJrm') # 123456
Truck.create(company: transx, name: 'F-150', type: '1 ton', year: 2015, capacity: 1500)
Truck.create(company: transx, name: 'F-250', type: '2 ton', year: 2018, capacity: 2500, reserved: true)
