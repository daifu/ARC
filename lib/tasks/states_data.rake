namespace :db do
  desc "populate database with csv file data"
  task populate_states: :environment do
    states = load_states
    populate_states(states)
  end
end

def load_states
  states = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../../spec/fixtures/states.yml'))
  states.sort
end

def populate_states(states)
  states.each do |state|
    # Since the state is an array ["countries_226", {"name"=>"Zimbabwe", "iso3"=>"ZWE", "iso"=>"ZW", "iso_name"=>"ZIMBABWE", "id"=>"226", "numcode"=>"716"}]
    # the last part of the array is the hash of the state that we want
    # 
    State.create!(state.last.except('id'))
  end
end