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

To run the tests from the root of the project: `rails test test/controllers/trucks_controller_test.rb`

#### Environment setup (10 mins)

* Encountered a webpacker error on initial `rails server`. Had to install yarn and run `rails webpacker:install`. 

#### Test setup (1.5 hr)

* Encountered an error running `rails test` due to Ruby >= 3.0, so I added `rexml` to the Gemfile
* Added trucks and company fixtures to use with test database

#### TDD for trucks_controller access control(3 hr)

* Auth gems: reviewed `pundit` and `cancancan`, and went with the latter.
* I followed TDD to implement the trucks_controller access control. Cancan doesn't allow any resources to be accessed by default, so this resulted in all tests failing at first. I then added the abilities to the driver and admin roles one by one and checked that tests were passing before moving on.

* To create a  `reserved` route, I referenced the Rails routes docs:

  > To add a member route, just add a [`member`](https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Routing/Mapper/Resources.html#method-i-member) block into the resource block:
  >
  > ```
  > resources :photos do
  >   member do
  >     get 'preview'
  >   end
  > end
  > ```

* Made the decision to only allow drivers to reserve trucks if the company ids were the same.

#### User Login and Registration (1 hr)

* Had an issue with trying to save `params` that were not valid fields of the `user` model, so I used the `params.permit` method.

#### Future improvements

* fix trucks re-ordering after updating reservation status
* style form, list, and table elements
* 
