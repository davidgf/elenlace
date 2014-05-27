class Wedding < ActiveRecord::Base
    has_one :groom, dependent: :destroy
    has_one :bride, dependent: :destroy
    has_many :guests, dependent: :destroy
end
