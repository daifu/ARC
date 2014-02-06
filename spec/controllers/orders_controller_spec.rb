require 'spec_helper'

describe OrdersController do
  before do
    @attributes = {
      "event_attributes"=> { "id"=>"2" },
      "user_attributes" => {
        "address_attributes" => {
          "firstname"=>"Daifu",
          "lastname"=>"Ye",
          "title"=>"",
          "degree"=>"",
          "organization"=>"",
          "address1"=>"1308 Factory Place",
          "address2"=>"Ste 112",
          "country_id"=>"214",
          "state_id"=>"16",
          "city"=>"Los Angeles",
          "zipcode"=>"90013"},
        "id"=>"1"},
        "comment"=>""
      }
  end

  describe '#create' do

  end
end