FactoryGirl.define do
    
    factory :wedding do
    end

    factory :user do
        username "usuario"
    end

    factory :admin do
        username "administrador"
    end

    factory :groom do
        association :wedding, factory: :wedding
        username "novio"
    end

    factory :bride do
        association :wedding, factory: :wedding
        username "novia"
    end


    factory :guest do
        association :wedding, factory: :wedding
        username "invitado"
    end

    factory :dance do
        association :user, factory: :groom
        association :partner, factory: :guest
    end

    factory :message do
        association :user, factory: :guest
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
        association :location, factory: :location
        datetime "2014-05-22 18:01:33"
        description "MyText"
    end

    factory :picture do
        association :user, factory: :guest
        name "MyString"
    end

end