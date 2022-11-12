# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# {"id":1,"company_name":"First Company","contact_person_name":"Micahel","email":"mick@yahoo.com","mobile_number":"0123456789","phone_number":"0987654321","postal_address":"Michael Home Address","created_at":"2022-11-05T01:07:50.016Z","updated_at":"2022-11-05T01:07:50.016Z"}


invoices = Invoice.create([{"inv_number":"INV-001","date_of_issue":"2022-10-25","due_date":"2022-11-25","job_reference":"First Job","description":"Testing Job","quantity":1,"unit_price":250,"sum_amount":250, "tax":25,"total_amount":275, "paid_amount":0,"due_amount":275,"client_id":1}])