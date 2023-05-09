require 'database_cleaner'

DatabaseCleaner.clean_with(:truncation)
Organisation.create!([{
    ppon_id: "AA1111AA1",
}])

p "Created #{Organisation.count} Organisations"