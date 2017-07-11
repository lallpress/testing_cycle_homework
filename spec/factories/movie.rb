FactoryGirl.define do
    factory :movie do
        title 'Movie Title'
        rating 'G'
        release_date { 10.years.ago }
    end
end