require 'test_helper'

class TrucksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @truck = trucks(:one)
  end

  test 'should not allow unauthenticated users' do
    [trucks_url, new_truck_url, edit_truck_url(@truck), truck_url(@truck)].each do |url|
      get url
      assert_response :forbidden
    end
  end

  test 'should get index' do
    login_as(users(:driver))
    get trucks_url
    assert_response :success
  end

  test 'should get new' do
    login_as(users(:admin))
    get new_truck_url
    assert_response :success
  end

  test 'should reserve truck' do
    login_as(users(:driver))
    put reserve_truck_url(@truck)
    assert_redirected_to trucks_url
  end

  test 'should create truck' do
    login_as(users(:admin))
    assert_difference('Truck.count') do
      post trucks_url,
           params: { truck: { capacity: @truck.capacity, company_id: @truck.company_id, name: @truck.name,
                              reserved: @truck.reserved, type: @truck.type, year: @truck.year } }
    end

    assert_redirected_to truck_url(Truck.last)
  end

  test 'should show truck' do
    login_as(users(:driver))
    get truck_url(@truck)
    assert_response :success
  end

  test 'should get edit' do
    login_as(users(:admin))
    get edit_truck_url(@truck)
    assert_response :success
  end

  test 'should update truck' do
    login_as(users(:admin))
    patch truck_url(@truck),
          params: { truck: { capacity: @truck.capacity, company_id: @truck.company_id, name: @truck.name,
                             reserved: @truck.reserved, type: @truck.type, year: @truck.year } }
    assert_redirected_to truck_url(@truck)
  end

  test 'should destroy truck' do
    login_as(users(:admin))
    assert_difference('Truck.count', -1) do
      delete truck_url(@truck)
    end

    assert_redirected_to trucks_url
  end
end
