FactoryGirl.define do

    factory :user do
        username "usuario"
    end

    factory :admin, class: User do
        username "administrador"
        role "admin"
    end

    factory :groom, class: User do
        username "novio"
        role "groom"
    end

    factory :guest, class: User do
        username "invitado"
        role "guest"
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
end