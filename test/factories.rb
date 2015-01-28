FactoryGirl.define do
    
    factory :wedding do
        groom_name "groom name"
        groom_surname "groom surname"
        bride_surname "bride surname"
        bride_name "bride name"
        date "2018-05-22"
    end

    factory :demo_wedding, class: Wedding do
        groom_name "groom name"
        groom_surname "groom surname"
        bride_surname "bride surname"
        bride_name "bride name"
        date "2018-05-22"
        slug "demo"
    end
    
    factory :table do
        association :wedding, factory: :wedding
        name "table"
    end

    sequence :email do |n|
        "user#{n}@example.com"
    end

    factory :user do
        username "usuario"
        email
        password 'password'
    end

    factory :admin do
        username "administrador"
        email
        password "adminpass"
    end

    sequence :password do |n|
        "pass#{n}"
    end

    factory :attendee do
        association :wedding, factory: :wedding
        username "usuario boda"
        password
        description "this is an attendee"
    end

    factory :groom do
        association :wedding, factory: :wedding
        username "novio"
        password
        description "this is a groom"
    end

    factory :bride do
        association :wedding, factory: :wedding
        username "novia"
        password
        description "this is a bride"
    end


    factory :guest do
        association :wedding, factory: :wedding
        username "invitado"
        password
        description "this is a guest"
    end

    factory :dance do
        association :attendee, factory: :groom
        association :partner, factory: :guest
    end

    factory :message do
        association :attendee, factory: :guest
        message "MyText"
        datetime "2014-05-22 17:23:17"
    end

    factory :location do
        name "MyString"
        description "MyText"
        address "MyText"
        lat 1.5
        long 1.5
    end

    factory :event do
        association :wedding, factory: :wedding
        association :location, factory: :location
        name "event name"
        datetime "2014-05-22 18:01:33"
        description "MyText"
    end

    factory :picture do
        association :attendee, factory: :guest
        name "MyString"
        image Rack::Test::UploadedFile.new("#{Rails.root}/test/images/dys.png", "image/png")
    end
    
    factory :song do
        association :wedding, factory: :wedding
        association :attendee, factory: :guest
        artist "MyString"
        title "MyString"
    end

    factory :notification do
        association :attendee, factory: :attendee
        association :resource, factory: :picture
        key "Picture"
        read false
    end

    factory :notification_picture, class: Notification do
        association :attendee, factory: :attendee
        association :resource, factory: :picture
        key "Picture"
        read false
    end

    factory :notification_message, class: Notification do
        association :attendee, factory: :attendee
        association :resource, factory: :message
        key "Message"
        read false
    end

    factory :comment do
        association :attendee, factory: :attendee
        association :commentable, factory: :picture
        comment "my comment"
    end
end