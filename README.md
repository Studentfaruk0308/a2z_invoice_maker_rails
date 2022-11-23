# A2Z INVOICE MAKER RAILS (Backend)

This application is the backend part of "a2z_invoice_maker" web app.

## Table of Contents
# Objectives
# System Requirements
# How to Setup
# Usage
# License
# Terms & Conditions



# Objectives
* a2z_Invoice_Maker is a web application to generate invoices for client from a Company.

# System Requirements
Following is the ideal system requirements to run the applicaiton smoothly:
* node v16.15.0
* npm 8.10.0
* React v18.2.0
* ruby 2.6.1p33
* Rails 6.1.7

# How to Setup (Backend)
* Fork the Repository to your Github Account.
* Then clone the repisotry yo your local machine.
* Then in the local machiine go to this directory by typing: cd A2Z_INVOICE_MAKER_RAILS
* Then type: 'bundle install' to initialize the local machine.
* Then type: 'rails db:create' to create database.
* Then type: 'rails db:migrate' to create database tables.
* Follow below steps for Sendgrid Email Setup:
> Create an account in 'https://docs.sendgrid.com/'
> Create an API Key in app.sendgrid.com/Settings/api.keys
> Create a sendgrid.env file in the root directory that exports the key `SENDGRID_API_KEY`. Add this file in .gitignore in the root directory to prevent the key being exposed to others in the Github Repository. 
example: export SENDGRID_API_KEY='<key-goes-here>'
Run `source sendgrid.env`
* Then type: 'rails s' to start the application and view it in your browser.
* The backend of the application will start in 'http://localhost:3000'


# Usage (All the UI will be from Frontend)
* As a first time user you need to create an account by Logging in to this application.
* Create a Profile in 'Profile' Tab with your Company Details of the floowing:
> Profile Name: This will not be displayed in the Invoice.
> Company Name, Address, ABN, Email, Contact Number, Bank Details: All these fileds will be displayed in the invoice.
> Please note only one Profile can be created. The profile can be updated if required. All invoices created by you will be linked to this Profile.
* Create a Client in the 'Client' Tab to whom invoice will be issued. 
* Create an Invoice in the 'Invoice" Tab.
> Submitting a created invoice will send the invoice to the Client.
> A created invoice can be viewed, edited, downloaded for printing or saving as pdf file or can be copied to create a new invoice.
> All submitted invoice after creation or modification will eamil the invoice to the Client.

# License
Copyright (c) 2022 by Md Faruk Ahmed

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following Terms & Conditions:

# Terms & Conditions
The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
