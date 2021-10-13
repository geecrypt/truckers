# Truckers

A simple Rails 6 & Ruby 3.0.0 Application to be used for practice.

### Getting Started
* Use Ruby 3.0.0
* Fork the repo from Github
* cd into `Truckers`
* `bundle install`
* `rake db:create`
* `rails db:migrate`
* `rails server` and the application is up and running

### Scenario

This app is to help Drivers connect to Trucks that their companies own.
Admin users are able to add, edit, and delete trucks in their company's fleet.
Driver users are able to look at their company's fleet and reserve a truck.

![alt text](https://github.com/sddanila/truckers/blob/main/app/assets/images/truckers_screen.png "Truckers Main Screen")


### Tasks

1. Create a `Truck` model, with the following columns:
  * name
  * company_id
  * type
  * year
  * capacity
  * reserved (Bool)
  * timestamps

2. Add a `TrucksController` to manage:
  * viewing a list of trucks
  * viewing one single truck
  * creating a new truck (admin only)
  * editing an existing truck (admin only)
  * reserve a truck (driver)
  * deleting a truck (admin only)

3. Make sure the `TrucksController` is tested

4. Define two User roles: `admin` and `driver`
  * `admin` Users should be able to add, edit, and delete trucks
  * `driver` Users should be able to view and reserve trucks

---

### My Solution

#### Environment setup (10 mins)

* Encountered a webpacker error on initial `rails server`. Had to install yarn and run `rails webpacker:install`. 

#### Test setup

* Encountered an error running `rails test` due to Ruby >= 3.0, so I added `rexml` to the Gemfile

