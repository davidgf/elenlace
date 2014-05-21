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
end