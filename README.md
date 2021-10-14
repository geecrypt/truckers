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

#### Test setup (1 hr)

* Encountered an error running `rails test` due to Ruby >= 3.0, so I added `rexml` to the Gemfile
* Added trucks and company fixtures to use with test database

#### TDD for trucks_controller access control

* Auth gems: reviewed `pundit` and `cancancan`, and went with the latter.

* To create a  `reserved` route, I referenced the Rails routes docs:

  > #### [2.10 Adding More RESTful Actions](https://guides.rubyonrails.org/routing.html#adding-more-restful-actions)
  >
  > You are not limited to the seven routes that RESTful routing creates by default. If you like, you may add additional routes that apply to the collection or individual members of the collection.
  >
  > ##### [2.10.1 Adding Member Routes](https://guides.rubyonrails.org/routing.html#adding-member-routes)
  >
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
* 
