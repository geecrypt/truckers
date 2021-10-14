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

### My Solution (7 hrs)

#### Intro

My primary goal for this exercise was to meet all of the requirements stated in the `Tasks` section above, as well as ensure that the website was functional from an end-to-end driver and admin perspective, without adding too many new features. 

I made extensive use of the generators to setup the project idiomatically. I used migrations to track my changes to the database, and made frequent commits to stay focused on incrementally building the website.

###### User stories

* As a user
  * I can register with their name, email, company ID, and password and be automatically assigned the driver role
  * I can't see the trucks inventory
* As a driver
  * I can login with email and password
  * I can see all trucks and reserve a truck
  * I can see an individual truck's details
* As an admin
  * I can do everything a driver can
  * I can edit. delete, and add a new truck to the inventory

###### Scripts

To run the tests from the root of the project: `rails test test/controllers/trucks_controller_test.rb`

To reset the database: `rails db:setup`

To run the server: `rails server`

#### Environment setup (10 mins)

* Encountered a webpacker error on initial `rails server`. Had to install yarn and run `rails webpacker:install`. 

#### Test setup (1.5 hrs)

* Encountered an error running `rails test` due to Ruby >= 3.0, so I added `rexml` to the Gemfile
* Added trucks and company fixtures to use with test database

#### TDD for trucks_controller access control(3 hrs)

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

#### User Login and Registration (1 hrs)

* Had an issue with trying to save `params` that were not valid fields of the `user` model, so I used the `params.permit` method.

#### Navigation and Styling (20 mins)

* Added some sorely needed links (home (logo), trucks) in the nav bar
* Styling is lacking, but increased width of trucks table

#### Documentation (30 mins)

* documented progress and challenges through the build

#### Future improvements

* style form, list, and table elements
* add logout button
* add ability to close flash notifications, or have them timeout
* add more validation to users and trucks models
* allow admins to create companies
* add a user profile page
* improve reservation handling:
  * specify duration
  * improve security - only users who made the reservation can cancel
