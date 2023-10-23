FactoryBot.define do
    # This will create a Project class
    factory :project do
      title { 'FSAD' }
      url  { 'www.fsad.com' }
    end

    # This will create a Student class
    factory :student do 
        sequence(:name) { |n| "Student #{n}" }
        sequence(:url) { |n| "www.student#{n}.com" }

    end 


  end