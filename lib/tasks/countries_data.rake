namespace :db do
  desc "populate database with csv file data"
  task populate_countries: :environment do
    countries = load_countries
    populate_countries(countries)
  end
end

def load_countries
  countries = YAML::load_file(File.join(File.dirname(File.expand_path(__FILE__)), '../../spec/fixtures/countries.yml'))
  countries.sort
end

def populate_countries(countries)
  countries.each do |country|
    # Since the country is an array ["countries_226", {"name"=>"Zimbabwe", "iso3"=>"ZWE", "iso"=>"ZW", "iso_name"=>"ZIMBABWE", "id"=>"226", "numcode"=>"716"}]
    # the last part of the array is the hash of the country that we want
    # 
    Country.create!(country.last.except('id'))
  end
end